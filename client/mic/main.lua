local longVoiceRange = Option.Range
local micFilter, isMicActive, isToggleOn = false, false, false
local canUseMic = true
local VehicleModels = Option.VehicleModels
local VehicleClasses = Option.VehicleClass

RegisterNetEvent('patrol_system:client:toggle', function()
    print('Toggling Patrol Mic')
    if not isEmergencyVehicle() then
        exports[Core]:Notify('You must be in an emergency vehicle to use the patrol mic!', 'error', 5000)
        return
    end
    
    if canUseMic then
        isMicActive = not isMicActive
        if isMicActive then
            applyMicFilter()
            exports["pma-voice"]:overrideProximityRange(longVoiceRange, true)
            isToggleOn = true
            Interaction.showActivated()
            vehicleCheckLoop()
        else
            deactivateMic()
        end
    else
        exports[Core]:Notify('Patrol mic is not available right now!', 'error', 3000)
    end
end)

RegisterCommand(Option.Command, function()
    TriggerEvent('patrol_system:client:toggle')
end, false)

RegisterKeyMapping(Option.Command, Option.Description, 'keyboard', Option.Key)

function isEmergencyVehicle()
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local vehicleClass = GetVehicleClass(vehicle)
        local vehicleModel = GetEntityModel(vehicle)
        
        if VehicleModels[vehicleModel] then
            canUseMic = true
            return true
        end
        return VehicleClasses[vehicleClass] or false
    end
    return false
end

function createMicFilter()
    micFilter = CreateAudioSubmix("patrol_system")
    if micFilter then
        SetAudioSubmixEffectRadioFx(micFilter, 0)
        SetAudioSubmixEffectParamInt(micFilter, 0, `default`, 1)
        AddAudioSubmixOutput(micFilter, 0)
    end
end

function applyMicFilter()
    if micFilter then
        MumbleSetSubmixForServerId(PlayerId(), micFilter)
    end
end

function removeMicFilter()
    MumbleSetSubmixForServerId(PlayerId(), -1)
end

function deactivateMic()
    removeMicFilter()
    exports["pma-voice"]:clearProximityOverride()
    isToggleOn = false
    isMicActive = false
    Interaction.showDeactivated()
    Wait(1000)
    Interaction.hide()
end

function vehicleCheckLoop()
    CreateThread(function()
        while isToggleOn do
            Wait(500)
            if not isEmergencyVehicle() then
                canUseMic = false
                exports['qb-core']:Notify('You left the emergency vehicle, mic turned off!', 'warning', 7500)
                deactivateMic()
                break
            end
        end
    end)
end

CreateThread(function()
    createMicFilter()
end)