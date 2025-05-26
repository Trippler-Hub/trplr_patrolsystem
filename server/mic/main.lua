RegisterNetEvent('patrol_system:server:applysubmix', function(bool)
    TriggerClientEvent('patrol_system:updateSubmixStatus', -1, bool, source)
end)