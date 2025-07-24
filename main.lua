_G.love = require("love")
local World = require("world")
local Component = require("component")
local Components = require("components")
local System = require("system")

function new_body(x, y)
  local body = Component.new("body")
  body.x = x
  body.y = y
  return body
end

function new_rect_component()
  return Component.new("rect") 
end

function new_renderer_system()
  local renderer = System.new({"body","rect","Position"})

  function renderer:load(entity)
    print('ok esto funciona')
  end

  function renderer:draw(entity)
    local body = entity:get_component("body")
    love.graphics.rectangle('fill', body.x, body.y, 32, 32) 
        
    love.graphics.rectangle('fill', 10, 10, 32, 32)

    local body2 = entity:get_component("Position")
    love.graphics.rectangle('fill', body2.x, body2.y, 32, 32)  
  end

  return renderer
end

function love.load()
  -- System --
  World:register(new_renderer_system())
  
  -- Entities --
  local entity = World:create()
  entity:add_component(new_body(50, 50))
  entity:add_component(new_rect_component())

  local enttiy02 = World:create()
  enttiy02:add_component(Components:Position(250,250))
  enttiy02:add_component(Components:Shape("rectn"))

end

function love.update(dt)
  World:update(dt)
end

function love.draw()
  World:draw()
end
