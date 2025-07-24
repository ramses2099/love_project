Components = {}

----------------------------------------------------
-- Component 1: Position
----------------------------------------------------
function Components.Position(x, y)
    local component = {__id = "Position"}
    component.x = x
    component.y = y
    return component
end

----------------------------------------------------
-- Component 2: Shape
----------------------------------------------------
function Components.Shape(shape)
    local component = {__id = "Shape"}
    component.shape = shape
    return component
end

return Components