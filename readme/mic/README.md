# Vehicle Microphone Toggle System

## Overview

This system provides emergency and service vehicles with a toggleable microphone/PA system feature. Players can broadcast their voice over a wider range when inside authorized vehicles.

---

## Configuration Options

```lua
---@field Range number Voice transmission range in units when microphone is active
---@field Command string Chat command to toggle microphone on/off
---@field Key string Default keybind for microphone toggle
---@field Description string Help text displayed for the keybind/command
---@field VehicleClass table Vehicle classes eligible for microphone system (by class ID)
---@field VehicleModels table Specific vehicle models eligible for microphone system (by hash)
```

---

## Basic Settings

### Example:
```lua
Option.Range = 30.0
Option.Command = 'togglemic'
Option.Key = 'J'
Option.Description = 'Toggle Patrol\'s Mic'
```

**Range**: Distance in game units that voice will carry when microphone is active
- Default range without mic is typically ~10 units
- Microphone extends this to 30 units for emergency communications
- Adjust based on your server's voice chat system

**Command**: Chat command players can use as alternative to keybind
- Usage: `/togglemic` in chat
- Useful for players who prefer commands or have keybind conflicts

**Key**: Default keyboard key for quick microphone toggle
- Single letter keys recommended for easy access
- Players can rebind through their keybind settings

---

## Vehicle Authorization

### By Vehicle Class

```lua
---@field VehicleClass table Authorized vehicle classes using GTA V class IDs
```

```lua
Option.VehicleClass = {
    [18] = true,  -- Emergency vehicles
    [19] = true,  -- Military vehicles
}
```

**Common Vehicle Classes:**
- `[14]` - Boats
- `[15]` - Helicopters  
- `[16]` - Planes
- `[18]` - Emergency (Police, Fire, EMS)
- `[19]` - Military
- `[20]` - Commercial (Buses, Taxis)

### By Specific Models

```lua
---@field VehicleModels table Authorized vehicles using model name hashes
```

```lua
Option.VehicleModels = {
    [`ambulance`] = true,
    [`firetruk`] = true,
    [`police`] = true,
    [`police2`] = true,
    [`police3`] = true,
    [`sheriff`] = true,
    [`sheriff2`] = true,
    [`fbi`] = true,
    [`fbi2`] = true,
}
```

**Adding Custom Vehicles:**
```lua
[`your_custom_police`] = true,
[`custom_ambulance`] = true,
[`fire_engine_custom`] = true,
```

---

## Advanced Configuration Examples

### High-Range Setup (Helicopter/Aviation)
```lua
Option.Range = 50.0
Option.VehicleModels = {
    [`polmav`] = true,     -- Police helicopter
    [`ambulance_heli`] = true,
    [`fire_heli`] = true,
}
```

### Multi-Agency Setup
```lua
Option.VehicleClass = {
    [18] = true,  -- All emergency vehicles
}
Option.VehicleModels = {
    -- Police Department
    [`police`] = true,
    [`police2`] = true,
    [`police3`] = true,
    [`police4`] = true,
    
    -- Sheriff's Office
    [`sheriff`] = true,
    [`sheriff2`] = true,
    
    -- Fire Department
    [`firetruk`] = true,
    [`fire_ladder`] = true,
    
    -- EMS/Medical
    [`ambulance`] = true,
    [`paramedic`] = true,
    
    -- Federal Agencies
    [`fbi`] = true,
    [`fbi2`] = true,
}
```

### Restricted Setup (Police Only)
```lua
Option.Range = 25.0
Option.VehicleClass = {}  -- Disable class-based authorization
Option.VehicleModels = {
    [`police`] = true,
    [`police2`] = true,
    [`police3`] = true,
    [`police4`] = true,
}
```

---

## Integration Notes

### Voice Chat Systems
- **pma-voice**: Compatible with range modifiers
- **saltychat**: May require additional integration
- **mumble-voip**: Works with proximity settings
- **tokovoip**: Compatible with range adjustments

### Framework Integration
```lua
-- QB-Core example
local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand(Option.Command, function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle ~= 0 and IsVehicleAuthorized(vehicle) then
        ToggleMicrophone()
    else
        QBCore.Functions.Notify("You must be in an authorized vehicle", "error")
    end
end)

-- ESX example
ESX = exports["es_extended"]:getSharedObject()

function IsVehicleAuthorized(vehicle)
    local model = GetEntityModel(vehicle)
    local class = GetVehicleClass(vehicle)
    
    return Option.VehicleModels[model] or Option.VehicleClass[class]
end
```

### Usage Examples

**Player Commands:**
- `/togglemic` - Toggle microphone on/off
- Key press (default 'J') - Quick toggle

**Server Events:**
```lua
-- When microphone activates
TriggerEvent('vehicle:microphoneEnabled', playerId, vehicleNetId)

-- When microphone deactivates  
TriggerEvent('vehicle:microphoneDisabled', playerId, vehicleNetId)
```

---

## Troubleshooting

### Common Issues

1. **Microphone not working in custom vehicles**
   - Add vehicle model hash to `Option.VehicleModels`
   - Verify vehicle class ID in `Option.VehicleClass`

2. **Range too short/long**
   - Adjust `Option.Range` value
   - Test with different voice chat systems

3. **Keybind conflicts**
   - Change `Option.Key` to unused key
   - Inform players of alternative chat command

### Vehicle Model Hash Generation
```lua
-- Get hash for custom vehicle
local vehicleHash = GetHashKey("your_vehicle_name")
print("Vehicle hash:", vehicleHash)

-- Add to config
[`your_vehicle_name`] = true,
```

### Vehicle Class Identification
```lua
-- Get class of current vehicle
local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
local class = GetVehicleClass(vehicle)
print("Vehicle class:", class)
```