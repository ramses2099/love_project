local Systems = {}
Systems.__index = Systems

function Systems.new(id)
    local self = { id = id}
    setmetatable(self, Systems)
    return self
end

----------------------------------------------------
-- System 1: Draw
----------------------------------------------------
local Draw = {}
Draw.__index = Draw

function Systems.Draw()
    local self = Systems.new("Draw_System")
    setmetatable(self, Draw)
    return self
end

function Draw:draw(entity)
    if entity:length_components() > 0 then
        if entity:has_component("Position")then
            local pos = entity:get_component("Position")
            love.graphics.rectangle("fill", pos.x, pos.y, 32, 32)
        end
    end
end

----------------------------------------------------
-- System 2: Update
----------------------------------------------------
local Update = {}
Update.__index = Update

function Systems.Update()
    local self = Systems.new("Update_System")
    setmetatable(self, Update)
    return self
end

function Update:update(entity)
    if entity:length_components() > 0 then
        if entity:has_component("Position")then
            local pos = entity:get_component("Position")
            pos.y = pos.y + 2
        end
    end
end

return Systems