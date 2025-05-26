Option.Interact = {
    {
        interact = 'interact',
        distance = 5,
        interactDst = 2,
        label = 'Take A Patrol',
        icon = 'fas fa-car',
        ped = 's_f_y_cop_01',
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        coords = vector4(460.07, -1000.31, 25.7, 38.17),
        spawn = vector4(458.73, -993.54, 24.97, 4.34),
        preview = {
            coords = vector4(458.73, -993.54, 24.97, 4.34),
            cam = {
                coords = vector3(455.64, -988.14, 26.35),
                rotation = {
                    verticalrotate = -10.00,
                    horizontalrotate = 0.00,
                    left_n_right = -145.0,
                },
                fov = 40.0
            }
        },
        config = 'police2',
        jobs = {
            police = 0,
        },
    },
    {
        interact = 'interact',
        distance = 5,
        interactDst = 2,
        icon = 'fas fa-car',
        label = 'Take A Patrol',
        ped = 's_f_y_cop_01',
        scenario = 'WORLD_HUMAN_COP_IDLES',
        coords = vector4(1828.33, 3671.63, 34.34, 71.09),
        spawn = vector4(1815.27, 3665.58, 33.59, 298.07),
        preview = {
            coords = vector4(1815.22, 3665.56, 33.93, 303.8),
            cam = {
                coords = vector3(1816.94, 3670.58, 34.78),
                rotation = {
                    verticalrotate = -10.00,
                    horizontalrotate = 0.00,
                    left_n_right = 161.84,
                },
                fov = 100.00
            }
        },
        config = 'police2',
        jobs = {
            police = 0,
        },
    },
    {
        interact = 'interact',
        distance = 5,
        interactDst = 2,
        label = 'Take A Patrol',
        ped = 's_m_y_cop_01',
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        coords = vector4(-460.89, 6051.23, 31.34, 174.82),
        spawn = vector4(-460.64, 6046.97, 30.76, 132.34),
        preview = {
            coords = vector4(-448.14, 5994.5, 31.15, 265.16),
            cam = {
                coords = vector3(-443.54, 5997.72, 32.45),
                rotation = {
                    verticalrotate = -10.00,
                    horizontalrotate = 0.00,
                    left_n_right = 161.84,
                },
                fov = 100.00
            }
        },
        config = 'police2',
        jobs = {
            police = 0,
        },
    },
}

Option.Vehicles = {
    police1 = {
        {
            vehiclename = "Ford Victoria",
            vehicle = "npolvic",
            allowed = {
                police = 1,
            },
            price = 40000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 4,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Nagasaki (Motorcycle)",
            vehicle = "npolmm",
            allowed = {
                police = 2,
            },
            price = 40000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 1,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Ford Explorer",
            vehicle = "npolexp",
            allowed = {
                police = 3,
            },
            price = 45000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 4,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Ford Mustang (Interceptor)",
            vehicle = "npolstang",
            allowed = {
                police = 4,
            },
            price = 65000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 1,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Ford Taurus",
            vehicle = "mttur",
            allowed = {
                police = 5,
            },
            price = 50000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 1,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Dodge Charger",
            vehicle = "npolchar",
            allowed = {
                police = 6,
            },
            price = 55000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 4,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Dodge Durango",
            vehicle = "mtdur",
            allowed = {
                police = 7,
            },
            price = 60000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 1,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Dodge Challenger",
            vehicle = "npolchal",
            allowed = {
                police = 8,
            },
            price = 70000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 1,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Chevrolet Corvette",
            vehicle = "npolvette",
            allowed = {
                police = 9,
            },
            price = 80000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 1,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Vapid",
            vehicle = "bcat",
            allowed = {
                police = 8,
            },
            price = 0,
            Registerable = false,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 0,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Park Ranger ATV",
            vehicle = "npolblazer",
            allowed = {
                police = 8,
            },
            price = 0,
            Registerable = false,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 0,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Retinue",
            vehicle = "npolretinue",
            allowed = {
                police = 8,
            },
            price = 0,
            Registerable = false,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 0,
                r = 81,
                g = 84,
                b = 89,
            }
        },
    },
    police2 = {
        {
            vehiclename = "Nagasaki (Motorcycle)",
            vehicle = "mtbike",
            allowed = {
                police = 1,
            },
            price = 40000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 1,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Ford Explorer",
            vehicle = "soexplorer",
            allowed = {
                police = 2,
            },
            price = 45000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 2,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Ford Taurus",
            vehicle = "sotaurus",
            allowed = {
                police = 3,
            },
            price = 50000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 2,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Dodge Durango",
            vehicle = "mtdur",
            allowed = {
                police = 4,
            },
            price = 55000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 1,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Ford Charger",
            vehicle = "socharger",
            allowed = {
                police = 5,
            },
            price = 60000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 2,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Ford Mustang",
            vehicle = "mach1rb",
            allowed = {
                police = 6,
            },
            price = 70000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 1,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Dodge Challenger",
            vehicle = "poldemonrb",
            allowed = {
                police = 7,
            },
            price = 80000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 1,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Chevrolet Corvette",
            vehicle = "zr1RB",
            allowed = {
                police = 8,
            },
            price = 100000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 1,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "BMW ZX 250R",
            vehicle = "25rnbrt",
            allowed = {
                police = 9,
            },
            price = 150000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 1,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Chevrolet Camaro",
            vehicle = "mtcam",
            allowed = {
                police = 10,
            },
            price = 200000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 1,
                r = 81,
                g = 84,
                b = 89,
            }
        },
        {
            vehiclename = "Nissan GTR",
            vehicle = "godzilla",
            allowed = {
                police = 1,
            },
            price = 250000,
            Registerable = true,
            plate = {"SASP0", 100, 999},
            style = {
                isenabled = true,
                livery = 1,
                r = 81,
                g = 84,
                b = 89,
            }
        },
    },
}