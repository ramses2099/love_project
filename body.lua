local createComp = require "comp"

local function createBody(x, y, width, height)
  return createComp({
      _name = "body",
      x = x,
      y = y,
      width = width,
      height = height 
  })
end

return createBody