local createComp = require "comp"

local function createPhysics(vx, vy)
  return createComp({
      _name = "physics",
      vx = vx,
      vy = vy,      
      friction = 0.2,
      speedx = 3200,
      speedy = 3200
    })
end

return createPhysics