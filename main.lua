_G.love = require("love")
local Vector = require("vector")

radius = 32
w_height = 800
w_width = 800

function love.load()
  DEBUG = true
  -- #region temp
  position = Vector.createVector(100, 100)
  velocity = Vector.createVector(2.5, 2)

  -- #endregion

end

function love.update(dt)
  position:add(velocity)

  if(position.x > w_width or position.x < 0) then
    velocity.x = velocity.x * -1
  end

  if (position.y > w_height or position.y < 0) then
    velocity.y = velocity.y * -1
  end

end

function love.draw()
  -- Display FPS
  if DEBUG then
    love.graphics.setColor(1, 1, 1, 1) -- White
    love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
  end

  --#region update
   love.graphics.setColor(1, 0, 0, 1)
   love.graphics.circle("fill", position.x, position.y, radius)
   love.graphics.setLineWidth(5)
   love.graphics.setColor(1, 1, 1, 1)   
   love.graphics.circle("line", position.x, position.y, radius)
   --#endregion


end
