# maskin-antiwheelie
🚫 Anti-Wheelie Script (FiveM / Qbox)

A simple but effective script to prevent wheelies on motorcycles at high speeds.
Built for Qbox and uses ox_lib for notifications and cache management.

✨ Features

- Blocks wheelies on all motorcycles (vehicleClass = 8), both GTA original and addon bikes.

- Configurable maximum speed limit (km/h).

- Notifies the player via ox_lib that they are starting to wobble and cannot wheelie.

- Efficient implementation via lib.onCache → no unnecessary loop when the player is not on a bike.


⚙️ Installation

- Download the resource and put it in your resources folder, e.g. maskin-antiwheelie.

- Start in server.cfg:

ensure ox_lib

ensure maskin-antiwheelie

🔧 Configuration

Everything is set in config.lua:

Config.BlockSpeedKmh = 80 -- maxhastighet där wheelies blockeras
Config.WheeliePitchThreshold = -4.0 -- hur mycket nosen får lyftas (pitch)
Config.NotifyCooldownMs = 1500 -- cooldown för notiser
Config.Notify = {
    title = 'Stabilitet',
    description = 'Du börjar vingla i farten – kan inte bakhjula.',
    type = 'warning',
    duration = 1500
}

📸 Demo

(Tip: feel free to add a short GIF or image here when a player attempts a high-speed wheelie.)

📝 Requirements

- [ox_lib](https://github.com/overextended/ox_lib)

- Qbox / FiveM server with game build that supports motorcycles

📌 Upcoming features

Different speed limits per model (e.g. sportbikes vs cruisers)

Ability to completely disable wheelies for some specific bikes

