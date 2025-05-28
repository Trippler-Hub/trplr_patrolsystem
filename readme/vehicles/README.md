# patrol_system

```lua
TODO: 
    -vehicles\s name automatic detection
```

```lua
Config = Config or {}
Config.FuelSystem = '' ---@param fuel_script cdn-fuel | LegacyFuel

Config.Interact = {
    {
        interact = '', ---@param interaction_script interact | qb_target
        distance = 0, ---@param interact_distance_for_qb_target inspect_distance_for_interact
        interactDst = 0, ---@param interact_distance_for_only interact
        label = '', ---@param interaction label
        icon = '', ---@param qb_target_interaction icon
        ped = '', ---@param ped model
        scenario = '', ---@param ped scenarion
        coords = vector4(x, y, z, w), ---@param ped location
        spawn = vector4(x, y, z, w), ---@param vehicle_spawn location
        preview = {
            coords = vector4(x, y, z, w), ---@param vehicle_preview location
            cam = {
                coords = vector3(x, y, z), ---@param preview_cam location
                rotation = {
                    verticalrotate = 0.0, ---@param preview_cam_vertical rotation
                    horizontalrotate = 0.0, ---@param preview_cam_horizontal rotation
                    left_n_right = 0.0, ---@param preview_cam_left_or_right angle
                },
                fov = 0.0 ---@param preview_cam field_of_view_(zoom)
            }
        },
        config = '', ---@param ped_menu_config index
        jobs = {
            job = 0, ---@return required jobName & jobGrade  ---@param player job = grade
        },
    },
    ...
}

Config.Vehicles = {
    index = { ---@param config naming
        {
            vehiclename = "", ---@param vehicle labeling
            vehicle = "", ---@param vehicle model
            allowed = {
                job = 0, ---@return required jobName & jobGrade  ---@param player job = grade
            },
            price = 0, ---@param vehicle pricing
            Registerable = true, ---@param isVehicleRegisterable boolean
            plate = {"0", 0, 0}, ---@param plate array[10] value ex: {"SASP", 1000, 9999} | {string, randomfrom, torandom}: total = 10
            style = {
                isenabled = nil, ---@param isStylingEnabled boolean
                livery = 0, ---@param patrol livery
                r = 0, ---@param patrol_primary_AND_secondary color[red]
                g = 0,---@param patrol_primary_AND_secondary color[green]
                b = 0,---@param patrol_primary_AND_secondary color[blue]
            }
        },
    },
    ...
}
```