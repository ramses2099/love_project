_G.love = require("love")

local Entity = require("entity")
local Components = require("components")
local Systems = require("systems")
local World = require("world")

function love.load()
  world = World.new()
  
  -- System --
  systems = Systems.new()

  -- Entity --
  entity01 = Entity.new()
  local pos = Components.Position(10, 30)
  local drawable = Components.Drawable(true)
  local shape = Components.Shape("rectangle")
  local movable = Components.Movable(true)

  entity02 = Entity.new()
  local pos2 = Components.Position(250, 30)
  
  -- Componenet
  entity01:add_component(pos)
  entity01:add_component(drawable)
  entity01:add_component(shape)
  
  entity02:add_component(pos2)
  entity02:add_component(drawable)
  entity02:add_component(shape)
  entity02:add_component(movable)

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
end
