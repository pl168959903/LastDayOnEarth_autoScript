
--joystick
local joystick = {}
joystick.pos = Location(160,560)
joystick.radius = 150
function joystick:move(angle, Time)
    
    local loc = self.pos:offset(self.radius * math.sin(math.rad(angle)), -self.radius * math.cos(math.rad(angle)))
    local moveList = { 
        {action = "touchDown", target = self.pos},
        {action = "touchMove", target = loc},
        {action = "wait", target = Time},
        {action = "touchUp", target = loc} 
    }
    manualTouch(moveList)
end

joystick:move(45, 0.1) --1
joystick:move(45, 0.6) --2
joystick:move(45, 0.6) --3
joystick:move(0, 0.6)
joystick:move(90, 0.2) --4
joystick:move(120, 0.5) --5
joystick:move(90, 0.3)
joystick:move(180, 0.3) --6
joystick:move(270, 4) -- r


joystick:move(90, 4.5) -- o
joystick:move(0, 0.8)
joystick:move(90, 0.9) -- t 
joystick:move(270, 0.35)
joystick:move(180, 0.1) --a 

joystick:move(270, 2) --a 
joystick:move(180, 1) --a 
joystick:move(270, 4)
