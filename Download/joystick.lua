
--joystick
Joystick = {}
Joystick.pos = Location(160,560)
Joystick.radius = 150
function Joystick:move(angle, Time)
    
    local loc = self.pos:offset(self.radius * math.sin(math.rad(angle)), -self.radius * math.cos(math.rad(angle)))
    local moveList = { 
        {action = "touchDown", target = self.pos},
        {action = "wait", target = 0.2},
        {action = "touchMove", target = loc},
        {action = "wait", target = Time},
        {action = "touchUp", target = loc} 
    }
    manualTouch(moveList)
end
