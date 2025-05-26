local function GetVehicleConfigByModel(model)
    for i, vehicles in pairs(Option.Vehicles) do
        for _, vehicleConfig in ipairs(vehicles) do
            if vehicleConfig.vehicle == model then
                return vehicleConfig
            end
        end
    end
    return nil
end

RegisterNetEvent("patrol_system:client:spawn")
AddEventHandler("patrol_system:client:spawn", function(vehicleModel, spawnCoords)
    local vehicleConfig = GetVehicleConfigByModel(vehicleModel, spawnCoords)

    Core.Functions.SpawnVehicle(vehicleModel, function(veh)
        local props = Core.Functions.GetVehicleProperties(veh)
        local plate = vehicleConfig.plate[1] .. tostring(math.random(vehicleConfig.plate[2], vehicleConfig.plate[3]))
        SetVehicleNumberPlateText(veh, plate)
        exports[FuelSystem]:SetFuel(veh, 100)

        if vehicleConfig.style and vehicleConfig.style.isenabled then
            if vehicleConfig.style.r and vehicleConfig.style.g and vehicleConfig.style.b then
                SetVehicleCustomPrimaryColour(veh, vehicleConfig.style.r, vehicleConfig.style.g, vehicleConfig.style.b)
            end
            if vehicleConfig.style.r and vehicleConfig.style.g and vehicleConfig.style.b then
                SetVehicleCustomSecondaryColour(veh, vehicleConfig.style.r, vehicleConfig.style.g, vehicleConfig.style.b)  -- Fixed: using r2, g2, b2 for secondary color
            end
            if vehicleConfig.style.livery then
                SetVehicleLivery(veh, vehicleConfig.style.livery)
                SetVehicleMod(veh, 48, vehicleConfig.style.livery, false)
            end
        end

        if vehicleConfig.Registerable then
            TriggerServerEvent("patrol_system:server:insert", props, vehicleModel, GetHashKey(vehicleModel), Core.Functions.GetPlate(veh))
        end

        TriggerEvent("vehiclekeys:client:SetOwner", plate)
        SetVehicleEngineOn(veh, false, false, false)
        car = veh
    end, spawnCoords, true)
end)

RegisterNetEvent('patrol_system:client:return')
AddEventHandler('patrol_system:client:return', function()
    if car ~= nil then
        Core.Functions.Notify('Vehicle Returned Back!')
        DeleteVehicle(car)
        DeleteEntity(car)
    else
        Core.Functions.Notify('You didn\'t take a vehicle from us', 'error')
    end
end)