-- entity
Vector = {}
Vector.__index = Vector

function Vector.createVector(x, y)
    local self = setmetatable({}, Vector)
    self.x = x or 0
    self.y = y or 0
    return self
end

function Vector:add(v)
    self.x = self.x  + v.x
    self.y = self.y + v.y    
end


return Vector