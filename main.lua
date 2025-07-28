_G.love = require("love")

local Entity = require("entity")
local Components = require("components")
local Systems = require("systems")
local World = require("world")

function love.load()
  DEBUG = true
  world = World.new()
  
  -- System --
  systems = Systems.new()

  -- Entity --
  entity01 = Entity.new()
  local pos = Components.Position(60, 10)
  local drawable = Components.Drawable(true)
  local shape = Components.Shape("rectangle")
  local movable = Components.Movable(true)

  entity02 = Entity.new()
  local pos2 = Components.Position(250, 30)
  local colr = Components.Color({0, 1, 0, 1})

  -- Componenet
  entity01:add_component(pos)
  entity01:add_component(drawable)
  entity01:add_component(shape)
  
  entity02:add_component(pos2)
  entity02:add_component(drawable)
  entity02:add_component(shape)
  entity02:add_component(movable)
  entity02:add_component(colr)
  
  world:register_entity(entity01)
  world:register_entity(entity02)

  world:register_system(Systems.Draw())
  world:register_system(Systems.Update())
end

function love.update(dt)
  world:update()
end

function love.draw()
  world:draw()
  
  -- Display FPS
  if DEBUG then
    love.graphics.setColor(1, 1, 1, 1) -- White
    love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
  end
end
