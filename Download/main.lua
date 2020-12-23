
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

local loc_now = Position.origin

local aa =  Position.workshop_F:FindPath(Position.workshop_B)
print(aa[1])
for key, value in pairs(aa[2]) do
    print(value.name)
end


-- while true do
--     for key, value in pairs(loc_now.path) do
--         value()
--         loc_now = key
--     end
-- end
