PositionClass = {}

function PositionClass:New()
    local obj = {}
    obj.path = {}
    self.__index = self
    setmetatable(obj, self)
    return obj
end

function PositionClass:addPath(_dest, _action, _cost)
    self.path[_dest] = {}
    self.path[_dest].action = _action
    self.path[_dest].cost = _cost
end

Position = {}

--======================================================================
--Position.origin = PositionClass:New()
Position.workshop_A = PositionClass:New()
Position.workshop_B = PositionClass:New()
Position.workshop_C = PositionClass:New()
Position.workshop_D = PositionClass:New()
Position.workshop_E = PositionClass:New()
Position.workshop_F = PositionClass:New()


function PosLink(a, b, d)
    a:addPath(b, function ()
        
    end, d)
    b:addPath(a, function ()
        
    end, d)
end

PosLink(Position.workshop_A, Position.workshop_B, 6)
PosLink(Position.workshop_A, Position.workshop_C, 9)
PosLink(Position.workshop_A, Position.workshop_D, 8)
PosLink(Position.workshop_A, Position.workshop_F, 7)
PosLink(Position.workshop_B, Position.workshop_C, 5)
PosLink(Position.workshop_C, Position.workshop_D, 3)
PosLink(Position.workshop_C, Position.workshop_E, 2)
PosLink(Position.workshop_D, Position.workshop_E, 1)
PosLink(Position.workshop_F, Position.workshop_E, 3)

--======================================================================

-- -- origin -> workshop_1
-- Position.origin:addPath(Position.workshop_1, function ()
--     Joystick:move(45, 0.1)
-- end)

-- --======================================================================

-- -- workshop_1 -> workshop_2
-- Position.workshop_1:addPath(Position.workshop_2, function ()
--     Joystick:move(45, 0.5)
-- end)

-- --======================================================================

-- -- workshop_2 -> workshop_3
-- Position.workshop_2:addPath(Position.workshop_3, function ()
--     Joystick:move(45, 0.5)
-- end)

-- --======================================================================

-- -- workshop_3 -> workshop_4
-- Position.workshop_3:addPath(Position.workshop_4, function ()
--     Joystick:move(0, 0.6)
--     Joystick:move(90, 0.2)
-- end)

-- --======================================================================

-- -- workshop_4 -> workshop_5
-- Position.workshop_4:addPath(Position.workshop_5, function ()
--     Joystick:move(120, 0.5)
-- end)

-- --======================================================================

-- -- workshop_5 -> workshop_6
-- Position.workshop_5:addPath(Position.workshop_6, function ()
--     Joystick:move(90, 0.3)
-- Joystick:move(180, 0.3)
-- end)

-- --======================================================================

-- -- workshop_5 -> origin
-- Position.workshop_6:addPath(Position.origin, function ()
--     Joystick:move(270, 4)
-- end)



-- Joystick:move(45, 0.1) --1
-- Joystick:move(45, 0.6) --2
-- Joystick:move(45, 0.6) --3
-- Joystick:move(0, 0.6)
-- Joystick:move(90, 0.2) --4
-- Joystick:move(120, 0.5) --5
-- Joystick:move(90, 0.3)
-- Joystick:move(180, 0.3) --6
-- Joystick:move(270, 4) -- r


-- Joystick:move(90, 4.5) -- o
-- Joystick:move(0, 0.8)
-- Joystick:move(90, 0.9) -- t 
-- Joystick:move(270, 0.35)
-- Joystick:move(180, 0.1) --a 

-- Joystick:move(270, 2) --a 
-- Joystick:move(180, 1) --a 
-- Joystick:move(270, 4)
