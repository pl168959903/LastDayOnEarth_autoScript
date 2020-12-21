

local imageFileName = {
    pine_log = "pine_log.jpg",
    pine_plank = "pine_plank.jpg",
    oak_log = "oak_log.jpg",
    oak_plank = "oak_plank.jpg",
    iron_ore = "iron_ore.jpg",
    iron_bar = "iron_bar.jpg",
    iron_plate = "iron_plate.jpg",
    scrap_metal = "scrap_metal.jpg",
    aluminium_wire = "aluminium_wire.jpg",
    aluminium_bar = "aluminium_bar.jpg",
    bauxite = "bauxite.jpg",
    copper_ore = "copper_ore.jpg",
    copper_bar = "copper_bar.jpg",
    quartz = "quartz.jpg",
    glass = "glass.jpg",
    nails = "nails.jpg",
    iron_wire = "iron_wire.jpg",
    spring = "spring.jpg",
    aluminium_plate = "aluminium_plate.jpg",
    lens = "lens.jpg",
    charcoal = "charcoal.jpg"
}

recipes = {
    recipes_pine_plank = {
        product = "pine_plank",
        material = {
            {name = "pine_log", amount = 1}
        },
        useTime = 240,
        amount = 1;
        source = "woodworking_bench";
    },
    recipes_oak_plank = {
        product = "oak_plank",
        material = {
            {name = "oak_log", amount = 3}
        },
        useTime = nil,
        amount = 1;
        source = "woodworking_bench";
    },
    recipes_iron_bar = {
        product = "iron_bar",
        material = {
            {name = "iron_ore", amount = 2}
        },
        useTime = 240,
        amount = 1;
        source = "melting_furnace";
    },
    recipes_iron_bar2 = {
        product = "iron_bar",
        material = {
            {name = "scrap_metal", amount = 4}
        },
        useTime = 240,
        amount = 1;
        source = "melting_furnace";
    },
    recipes_aluminium_bar = {
        product = "aluminium_bar",
        material = {
            {name = "aluminium_wire", amount = 2}
        },
        useTime = nil,
        amount = 1;
        source = "melting_furnace";
    },
    recipes_aluminium_bar2 = {
        product = "aluminium_bar",
        material = {
            {name = "bauxite", amount = 4}
        },
        useTime = nil,
        amount = 1;
        source = "melting_furnace";
    },
    recipes_copper_bar = {
        product = "copper_bar",
        material = {
            {name = "copper_ore", amount = 2}
        },
        useTime = nil,
        amount = 1;
        source = "melting_furnace";
    },
    recipes_glass = {
        product = "glass",
        material = {
            {name = "quartz", amount = 4}
        },
        useTime = nil,
        amount = 1;
        source = "melting_furnace";
    },
    recipes_iron_plate = {
        product = "iron_plate",
        material = {
            {name = "iron_bar", amount = 1}
        },
        useTime = 1200,
        amount = 1;
        source = "workbench";
    },
    recipes_nails = {
        product = "nails",
        material = {
            {name = "iron_plate", amount = 1}
        },
        useTime = nil,
        amount = 2;
        source = "workbench";
    },
    recipes_spring = {
        product = "spring",
        material = {
            {name = "iron_wire", amount = 1}
        },
        useTime = nil,
        amount = 1;
        source = "workbench";
    },
    recipes_aluminium_plate = {
        product = "aluminium_plate",
        material = {
            {name = "aluminium_bar", amount = 2}
        },
        useTime = nil,
        amount = 1;
        source = "workbench";
    },
    recipes_lens = {
        product = "lens",
        material = {
            {name = "glass", amount = 4}
        },
        useTime = nil,
        amount = 1;
        source = "workbench";
    }
}

local item = {}

function item:add(_name)
    local obj = {}

    obj.name = _name
    obj.imageName = imageFileName[_name]
    obj.recipes = {}

    for key, value in pairs(recipes) do
        if value.product == _name then
            table.insert(obj.recipes, key)
        end
    end

    self.__index = self
    setmetatable(item, obj)
    return obj
end
