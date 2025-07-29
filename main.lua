_G.love = require("love")
local Manager = require "entities"
local Game = require "game"
local createBody = require "body"
local drawable = require "drawable"
require "entityrenderer"

function love.load()
  DEBUG = true
  -- #region player
  local player = Manager:create()
  player:add(createBody(100, 200, 32, 32))
  player:add(drawable("rect", {1, 0, 0, 1}))
  -- #endregion
  
 
end

function love.update(dt)
  Manager:update(dt)
end

function love.draw()
  -- Display FPS
  if DEBUG then
    love.graphics.setColor(1, 1, 1, 1) -- White
    love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
  end


  -- Draw
  Manager:render()

end
