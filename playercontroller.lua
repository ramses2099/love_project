local Manager = require "entities"
local createBody = require "body"

local PlayerController = Manager:filter({"body", "physics" })

-- overrider 
function PlayerController:update(entity, dt)
    local physics = entity:get "physics"
    local body = entity:get "body"

    if love.keyboard.isDown "up" then
        physics.vy = physics.vy - physics.speedy * dt
    end
    if love.keyboard.isDown "down" then
        physics.vy = physics.vy + physics.speedy * dt
    end
    if love.keyboard.isDown "left" then
        physics.vx = physics.vx - physics.speedx * dt 
    end
    if love.keyboard.isDown "right" then
        physics.vx = physics.vx + physics.speedx * dt
    end

end