
require(scriptPath().."params")

task = {}

function task:New(_recipes, loc, amount)
    local obj = {}

    if Recipes[_recipes].source ~= workshop[loc] then
        return nil
    end
    
    obj.recipes = Recipes[_recipes]
    obj.workbench_loc = loc
    obj.amount = amount

    setmetatable(task, obj)
    self.__index = self
    return obj
end

function task:move()
    
end
