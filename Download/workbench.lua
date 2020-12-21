workbench = {}

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

function workbench:New(_name, position)
    local obj = {}

    obj.name = _name
    obj.position = position
    obj.fuel = workbenchTable[_name].fuel
    obj.task = nil

    self._index = self
    setmetatable(workbench, obj)
    return obj
end
