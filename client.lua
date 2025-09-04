local lastNotify = 0

local function isBikeOrTrike(veh)
    return veh ~= 0 and GetVehicleClass(veh) == 8
end

-- Körs varje gång cache.vehicle uppdateras (dvs när man går in/ur fordon)
lib.onCache('vehicle', function(veh)
    if veh and isBikeOrTrike(veh) then
        -- Starta en tråd som bevakar just nuvarande hoj
        CreateThread(function()
            while cache.vehicle == veh do
                local ped = cache.ped
                if GetPedInVehicleSeat(veh, -1) == ped then
                    local speedKmh = GetEntitySpeed(veh) * 3.6
                    if speedKmh >= (Config.BlockSpeedKmh or 80) then
                        DisableControlAction(0, 60, true) -- blockera lutning bakåt

                        local pitch = GetEntityPitch(veh)
                        if pitch <= (Config.WheeliePitchThreshold or -4.0) then
                            SetVehicleOnGroundProperly(veh)

                            local vx, vy, vz = table.unpack(GetEntityVelocity(veh))
                            SetEntityVelocity(veh, vx, vy, vz)

                            local now = GetGameTimer()
                            if now - lastNotify > (Config.NotifyCooldownMs or 1500) then
                                lib.notify({
                                    title = Config.Notify.title,
                                    description = Config.Notify.description,
                                    type = Config.Notify.type,
                                    duration = Config.Notify.duration
                                })
                                lastNotify = now
                            end

                            Wait(250)
                        end
                    end
                end
                Wait(0)
            end
        end)
    end
end)