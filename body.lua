local createComp = require "comp"

local function createBody(x, y, width, height)
  return createComp({
      _name = "body",
      x = x,
      y = y,
      width = width,
      height = height,
      
      center = function(self)
        return {
            self.x + self.width * 0.5,
            self.y + self.height * 0.5
         }
      end,

      contains = function (self, other)
        assert(type(other) == "table")
        assert(other._name == "body")
        return (self.x + self.width > other.x and
            self.x < other.x + other.width and
            self.y + self.height > other.y and
            self.y < other.y + other.height)

      end
  })
end

return createBody