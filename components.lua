local Components = {}
Components.__index = Components 

function Components.new(id)
    local self = {id = id}
    setmetatable(self, Components)
    return self
end

----------------------------------------------------
-- Component 1: Position
----------------------------------------------------
local Position = {}
Position.__index = Position

function Components.Position(x, y)
    local self = Components.new("Position")
    setmetatable(self, Position)
    self.x = x
    self.y = y
    return self
end

----------------------------------------------------
-- Component 2: Shape
----------------------------------------------------
local Shape = {}
Shape.__index = Shape

function Components.Shape(shape)
    local self = Components.new("Shape")
    setmetatable(self, Shape)
    self.shape = shape
    return self
end

----------------------------------------------------
-- Component 3: Drawable
----------------------------------------------------
local Drawable = {}
Drawable.__index = Drawable

function Components.Drawable(t)
    local self = Components.new("Drawable")
    setmetatable(self, Drawable)
    self.visible = t
    return self
end

----------------------------------------------------
-- Component 4: Movable
----------------------------------------------------
local Movable = {}
Movable.__index = Movable

function Components.Movable(t)
    local self = Components.new("Movable")
    setmetatable(self, Movable)
    self.movable = t
    return self
end

----------------------------------------------------
-- Component 5: Color
----------------------------------------------------
local Color = {}
Color.__index = Color

function Components.Color(r, g, b, a)
    local self = Components.new("Color")
    setmetatable(self, Color)
    self.r = r
    self.g = g
    self.b = g
    self.a = a or 1
    return self
end


return Components