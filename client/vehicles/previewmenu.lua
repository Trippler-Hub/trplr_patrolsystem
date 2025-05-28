RegisterNetEvent('patrol_system:client:previewmenu', function(data)
    local config = data.config
    local spawn = data.spawn
    local preview = data.preview
    if Menu == 'qb-menu' then
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
    elseif Menu == 'ox_lib' then
        local options = {}

        if Option.Vehicles[config] then
            for _, vehicle in ipairs(Option.Vehicles[config]) do
                options[#options+1] = {
                    title = vehicle.vehiclename,
                    description = "Preview: " .. vehicle.vehiclename,
                    onSelect = function()
                        TriggerEvent('patrol_system:client:preview', {
                            vehicle = vehicle.vehicle,
                            preview = preview,
                        })
                    end
                }
            end
        else
            print("Warning: No vehicles found for config: " .. json.encode(data))
        end

        options[#options+1] = {
            title = '⬅ Go Back',
            onSelect = function()
                TriggerEvent('patrol_system:client:menu', {
                    config = config,
                    spawn = spawn,
                    preview = preview
                })
            end
        }

        lib.registerContext({
            id = 'preview_menu',
            title = 'Preview Menu',
            options = options
        })

        lib.showContext('preview_menu')
    end
end)