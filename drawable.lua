local createComp = require "comp"

local function drawable(thetype, color)
  return createComp({
    _name = "drawable",
    type = thetype, 
    color = color or {1, 1, 1, 1}
  })  
end
return drawable