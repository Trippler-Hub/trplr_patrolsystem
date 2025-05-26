ped = {}

local function deletePeds()
    if not pedSpawned then return end
    for _, v in pairs(ped) do
        DeletePed(v)
    end
    pedSpawned = false
end
CreateThread(function()
    if pedSpawned then return end
    
    for k, v in pairs(Option.Interact) do
        local current = type(v.ped) == "number" and v.ped or GetHashKey(v.ped)
        
        RequestModel(current)
        while not HasModelLoaded(current) do
            Wait(0)
        end
        
        ped[k] = CreatePed(0, current, v.coords.x, v.coords.y, v.coords.z-1, v.coords.w, false, false)
        TaskStartScenarioInPlace(ped[k], v.scenario, 0, true)
        FreezeEntityPosition(ped[k], true)
        SetEntityInvincible(ped[k], true)
        SetBlockingOfNonTemporaryEvents(ped[k], true)

    end
    pedSpawned = true

    for i, v in pairs(Option.Interact) do
        
        local interactionGroups = {} -- Initialize an empty table for groups
        for jobName, requiredGrade in pairs(v.jobs) do
            interactionGroups[jobName] = requiredGrade -- Add each job and its grade to the groups table
            
        end
        if v.interact == 'interact' then
            exports.interact:AddInteraction({
                coords = vector3(v.coords.x, v.coords.y, v.coords.z), -- Use vector3 directly
                distance = v.distance,
                interactDst = v.interactDist,
                id = 'gov.garage_' .. i, -- Make the ID unique using the index
                groups = interactionGroups, -- Use the dynamically created groups table
                options = {
                    {
                        label = v.label,
                        action = function()
                            TriggerEvent("patrol_system:client:menu", v)
                        end,
                    },
                }
            })
        elseif v.interact == 'qb_target' then
            exports['qb-target']:AddBoxZone("gov.garage_" .. i, vector3(v.coords.x, v.coords.y, v.coords.z), 3.45, 3.35, {
                name = "gov.garage_" .. i,
                minZ = v.coords.z - 1.0,
                maxZ = v.coords.z + 1.0,
            }, {
                options = {
                    {
                        type = "client",
                        icon = v.icon,
                        label = v.label,
                        job = interactionGroups,
                        action = function()
                            TriggerEvent("patrol_system:client:menu", v)
                        end,
                    },
                },
                distance = v.distance,
            })
        else
            print("Error: Invalid interaction type for " .. tostring(v.interact) .. " at index " .. tostring(i))
        end
    end
end)

CreateThread(function()
    if GetResourceState(GetCurrentResourceName()) == 'stopping' then
        deletePeds()
    end
end)