local Vector = require("vector")

Mover = {}
Mover.__index = Mover

function Mover.new()
    local self = setmetatable({}, Mover)
    -- position --
    local x = love.math.random(750)
    local y = love.math.random(750)
    -- velocity --
    local vx = love.math.random(-2, 2)
    local vy = love.math.random(-2, 2)
    -- radius --
    self.radius = love.math.random(5, 32)

    self.position = Vector.createVector(x, y)
    self.velocity = Vector.createVector(vx, vy)

    self.color = {love.math.random(0, 255),love.math.random(0, 255),love.math.random(0, 255), 1}
    self.w_height = 800
    self.w_width = 800

    return self
end

function Mover:draw()
    love.graphics.setColor(self.color)
    love.graphics.circle("fill", self.position.x, self.position.y, self.radius)
    love.graphics.setLineWidth(5)
    love.graphics.setColor(1, 1, 1, 1)   
    love.graphics.circle("line", self.position.x, self.position.y, self.radius)
end

function Mover:update( dt )
    position:add(velocity)
    
end

function Mover:checkEdges()
    if(self.position.x > self.w_width or self.position.x < 0) then
        self.velocity.x = self.velocity.x * -1
    end
    
    if (self.position.y > self.w_height or self.position.y < 0) then
        self.velocity.y = self.velocity.y * -1
    end 
end