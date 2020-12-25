
--require
require(scriptPath().."params")
require(scriptPath().."workbench")
require(scriptPath().."item")
require(scriptPath().."joystick")
require(scriptPath().."position")

--Setting
Settings:setCompareDimension(true, CompareDimension)
Settings:setScriptDimension(true, ScriptDimension)

setManualTouchParameter(20, 1)

Position.now = Position.workshop_6

local p = Position.now:FindPath(Position.storage)

-- for key, value in pairs(p[2]) do
--     Position.now.path[value].action()
-- end
