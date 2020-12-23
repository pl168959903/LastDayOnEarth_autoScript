
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

function table.removeFromData(tb, conditionFunc)
    if tb ~= nil and next(tb) ~= nil then
        for key, value in pairs(tb) do
            if value == conditionFunc then
                table.remove(tb, key)
            end
        end
    end
end

function table.length(tb)
   local i = 0
   for key, value in pairs(tb) do
       i = i + 1
   end
   return i
end

function FindPath(startPos, endPos)
    local s = {}
    local u = {}

    
    function fp(p)
        s[p] = u[p]
        u[p] = nil
        for key, value in pairs(p.path) do
            if u[key] ~= nil  then  
                if u[key] == -1 then
                    u[key] = value.cost + s[p]
                else
                    if u[key] > value.cost + s[p] then
                        u[key] = value.cost + s[p]
                    end
                end                  
                
            end
        end
    end
    
    function findMin()
        local min = -1
        local pt = nil
        for key, value in pairs(u) do
            if min == -1 then
                min = value
                pt = key
            else
                if min > value and value ~= -1 then
                    min = value
                    pt = key
                end
            end
        end
        return pt
    end
    
    -- init
    for key, value in pairs(Position) do
        u[value] = -1
    end
    u[Position[startPos]] = 0

    fp(Position[startPos])
    while table.length(u) ~= 0 do
        fp(findMin())
    end

    print("U---")
    for key, value in pairs(u) do
        print(value)
    end
    print("S---")
    for key, value in pairs(s) do
        print(value)
    end
    
end


FindPath("workshop_A", "workshop_B")
-- while true do
--     for key, value in pairs(loc_now.path) do
--         value()
--         loc_now = key
--     end
-- end
