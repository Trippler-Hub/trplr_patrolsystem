RegisterNetEvent('patrol_system:client:previewmenu', function(data)
    local config = data.config
    local spawn = data.spawn
    local preview = data.preview
    
    local PreviewMenu = {
        {
            header = "Preview Menu",
            isMenuHeader = true
        }
    }

    if Option.Vehicles[config] then
        for _, vehicle in ipairs(Option.Vehicles[config]) do
            PreviewMenu[#PreviewMenu+1] = {
                header = vehicle.vehiclename,
                txt = "Preview: " .. vehicle.vehiclename,
                params = {
                    event = "patrol_system:client:preview",
                    args = {
                        vehicle = vehicle.vehicle,
                        preview = preview,
                    }
                }
            }
        end
    else
        print("Warning: No vehicles found for config: " .. json.encode(data))
    end

    PreviewMenu[#PreviewMenu+1] = {
        header = "⬅ Go Back",
        params = {
            event = "patrol_system:client:menu",
            args = {
                config = config,
                spawn = spawn,
                preview = preview
            }
        }
    }
    
    exports['qb-menu']:openMenu(PreviewMenu)
end)