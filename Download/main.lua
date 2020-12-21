
--require
require(scriptPath().."params")
require(scriptPath().."workbench")
require(scriptPath().."item")

--Setting
Settings:setCompareDimension(true, CompareDimension)
Settings:setScriptDimension(true, ScriptDimension)

local joystick_pos = Location(160,560)
click(joystick_pos)

local n_loc = 1

local role = {}
role.loc = 1

local position = {}
function position:New(_goNext)
    local obj

    obj.Next = _goNext
    obj.
    setmetatable(position, obj)
    self.__index = self
    return obj
end

