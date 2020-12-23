Workbench = {}

local fuel = {
    "pine_log",
    "pine_plank",
    "charcoal"
}

local workbenchTable = {
    woodworking_bench = {
        fuel = nil
    },
    melting_furnace = {
        fuel = {"pine_log", "pine_plank", "charcoal"}
    },
    workbench = {
        fuel = nil
    },
    campfire = {
        fuel = {"pine_log", "pine_plank", "charcoal"}
    }

}

function Workbench:New(_name, position)
    local obj = {}

    obj.name = _name
    obj.position = position
    obj.fuel = workbenchTable[_name].fuel
    obj.task = nil

    self.__index = self
    setmetatable(obj, self)
    return obj
end
