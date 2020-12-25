require(scriptPath() .. "func")

PositionClass = {obj = {}}

function PositionClass:NewGroup()
    local gp = {}

    function gp:addT(c)
        local o
        o.name = c
        self.__index = self
        setmetatable(o, self)
        return o
    end

    self.__index = self
    setmetatable(gp, self)
    return gp
end

local k = PositionClass:NewGroup()
k.a = k:addT("123")

function PositionClass:NewPos(_name)
    local obj = {}
    obj.path = {}
    obj.name = _name
    self.__index = self
    setmetatable(obj, self)
    table.insert(self.obj, obj)
    return obj
end

function PositionClass:AddPath(_dest, _action, _cost)
    self.path[_dest] = {}
    self.path[_dest].action = _action
    self.path[_dest].cost = _cost
end

function PositionClass:FindPath(_dest)
    local s = {}
    local u = {}
    local path = {}

    local function fp(p)
        s[p] = u[p]
        u[p] = nil
        for key, value in pairs(p.path) do
            if u[key] ~= nil then
                if u[key] > value.cost + s[p] or u[key] == -1 then
                    u[key] = value.cost + s[p]
                    path[key] = {}
                    for key2, value in ipairs(path[p]) do
                        path[key][key2] = value
                    end
                    table.insert(path[key], key)
                end
            end
        end
    end

    local function findMin()
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
    for key, value in pairs(self.obj) do
        u[value] = -1
        path[value] = {}
    end
    u[self] = 0

    fp(self)
    while table.length(u) ~= 0 do fp(findMin()) end
    return {s[_dest], path[_dest]}
end

Position = {now = nil}

-- ======================================================================
Position.origin = PositionClass:NewPos()
Position.workshop_1 = PositionClass:NewPos()
Position.workshop_2 = PositionClass:NewPos()
Position.workshop_3 = PositionClass:NewPos()
Position.workshop_4 = PositionClass:NewPos()
Position.workshop_5 = PositionClass:NewPos()
Position.workshop_6 = PositionClass:NewPos()
Position.storage = PositionClass:NewPos()
Position.campfire = PositionClass:NewPos()

-- ======================================================================

-- campfire -> origin
Position.campfire:AddPath(Position.origin, function()
    Joystick:move(270, 2)
    Joystick:move(180, 1)
    Joystick:move(270, 4)
    Position.now = Position.origin
end, 1)
-- ====================================================================== storage

-- storage -> campfire
Position.storage:AddPath(Position.campfire, function()
    Joystick:move(270, 0.35)
    Joystick:move(180, 0.1)
    Position.now = Position.campfire
end, 1)

-- ====================================================================== origin

-- origin -> workshop_1
Position.origin:AddPath(Position.workshop_1, function()
    Joystick:move(45, 0.1)
    Position.now = Position.workshop_1
end, 1)

-- origin -> warehouse
Position.origin:AddPath(Position.storage, function()
    Joystick:move(90, 4.5)
    Joystick:move(0, 0.8)
    Joystick:move(90, 0.9)
    Position.now = Position.storage
end, 1)

-- ====================================================================== workshop_1

-- workshop_1 -> workshop_2
Position.workshop_1:AddPath(Position.workshop_2, function()
    Joystick:move(45, 0.5)
    Position.now = Position.workshop_2
end, 1)

-- ====================================================================== workshop_2

-- workshop_2 -> workshop_3
Position.workshop_2:AddPath(Position.workshop_3, function()
    Joystick:move(45, 0.5)
    Position.now = Position.workshop_3
end, 1)

-- ====================================================================== workshop_3

-- workshop_3 -> workshop_4
Position.workshop_3:AddPath(Position.workshop_4, function()
    Joystick:move(0, 0.6)
    Joystick:move(90, 0.2)
    Position.now = Position.workshop_4
end, 1)

-- ====================================================================== workshop_4

-- workshop_4 -> workshop_5
Position.workshop_4:AddPath(Position.workshop_5, function()
    Joystick:move(120, 0.5)
    Position.now = Position.workshop_5
end, 1)

-- ====================================================================== workshop_5

-- workshop_5 -> workshop_6
Position.workshop_5:AddPath(Position.workshop_6, function()
    Joystick:move(90, 0.3)
    Joystick:move(180, 0.3)
    Position.now = Position.workshop_6
end, 1)

-- ====================================================================== workshop_5

-- workshop_5 -> origin
Position.workshop_6:AddPath(Position.origin, function()
    Joystick:move(270, 4)
    Position.now = Position.origin
end, 1)

print(table.length(PositionClass))
