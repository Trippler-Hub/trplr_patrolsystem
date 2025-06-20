CreateThread(function()
   print("  ____              _                      _        ")
   print(" | __ )   _   _    | |       ___   _ __   (_) __  __")
   print(" |  _ \\  | | | |   | |     / _ \\  | '_ \\  | | \\\\/ /")
   print(" | |_) | | |_| |   | |___  | __/  | | | | | |  >  < ")
   print(" |____/   \\__, |   |_____| \\___|  |_| |_| |_| /_/\\\\ ")
   print("          |___/                                     ")
)

if GetCurrentResourceName() ~= "trplr_patrolsystem" then
    return print("^6Changing the resource's name wont't let the resource start, ^1" .. GetCurrentResourceName() .. "^0 > ^2 trplr_patrolsystem ^7")
end

local isActive = false

RegisterServerEvent('patrol_system:server:charge', function(data)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    local steamname = GetPlayerName(src)

    if Player.PlayerData.money.cash >= data.price then
        
        TriggerClientEvent("patrol_system:client:spawn", src, data.vehicle, data.spawn)
        if data.chargeable then
            Player.Functions.RemoveMoney("cash", data.price)
        end
        TriggerClientEvent('QBCore:Notify', src, 'Vehicle Successfully Bought', "success")    
        
        if discord and discord['webhook'] then
            DiscordLog(discord['webhook'], 'New Vehicle Bought By: **'..steamname..'** ID: **' ..src.. '** Bought: **' ..data.vehiclename.. '** For: **' ..data.price.. '$**', 14177041) 
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'You Don\'t Have Enough Money !', "error")              
    end    
end)

Core.Functions.CreateCallback('patrol_system:server:busycheck', function(source, cb)
    local src = source

    if not isActive then
        TriggerEvent("patrol_system:server:SetActive", true)
        cb(true)
    else
        cb(false)
        TriggerClientEvent("QBCore:Notify", src, "We are already in busy with someone else", "error")
    end
end)

RegisterNetEvent('patrol_system:server:SetActive', function(status)
    if status ~= nil then
        isActive = status
        TriggerClientEvent('patrol_system:client:setactive', -1, isActive)
    else
        TriggerClientEvent('patrol_system:client:setactive', -1, isActive)
    end
end)

RegisterServerEvent("patrol_system:server:insert")
AddEventHandler('patrol_system:server:insert', function(mods, vehicle, hash, plate)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        Player.PlayerData.license,
        Player.PlayerData.citizenid,
        vehicle,
        hash,
        json.encode(mods),
        plate,
        0
    })
end)

discord = {
    ['webhook'] = Option.Webhook,
    ['name'] = Option.BotName,
    ['image'] = Option.BotImage
}

function DiscordLog(name, message, color)
    local embed = {
        {
            ["color"] = Option.EmbedColor, 
            ["title"] = Option.EmbedTitle,
            ["description"] = message,
            ["url"] = Option.DiscordLink,
            ["footer"] = {
                ["text"] = Option.EmbedFooterName,
                ["icon_url"] = Option.EmbedFooterImage
            },
            ["thumbnail"] = {
                ["url"] = Option.EmbedThumbainlImage,
            },
        }
    }
    if Option.LogEnabled then
        PerformHttpRequest(discord['webhook'], function(err, text, headers) end, 'POST', json.encode({username = discord['name'], embeds = embed, avatar_url = discord['image']}), { ['Content-Type'] = 'application/json' })
    end
end