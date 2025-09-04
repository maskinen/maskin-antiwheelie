Config = {}

-- Blockera wheelies över denna hastighet (km/h)
Config.BlockSpeedKmh = 80

-- Hur mycket uppåttiltning (pitch) som räknas som “försök till bakhjulning”
-- Negativa värden = nosen upp. -4.0 är en mild lutning.
Config.WheeliePitchThreshold = -4.0

-- Cooldown för notisen (ms) så man inte spammar
Config.NotifyCooldownMs = 1500

-- Notistext
Config.Notify = {
    title = 'Stabilitet',
    description = 'Du börjar vingla i farten – kan inte bakhjula.',
    type = 'warning', -- success / info / warning / error
    duration = 1500
}