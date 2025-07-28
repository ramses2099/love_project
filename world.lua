local Entity = require("entity")

local World = {}
World.__index = World

function World.new()
    local self = setmetatable({}, World)
    self.entities = {}
    self.systems = {}
    return self
end

function World:register_system(system)
    if self:len_entities() > 0 then
        table.insert(self.systems, system)
    end
end

function World:register_entity(entity)
    table.insert(self.entities, entity)
end

function World:len_systems()
    return #self.systems
end

function World:len_entities()
    return #self.entities
end 

function World:update(dt)
    for i = #self.entities, 1, -1 do
        local entity = self.entities[i]
        if entity.remove then
            table.remove(self.entities, i)
        else            
            for i, system in ipairs(self.systems) do
               if system.id == "Update_System" then
                  if entity:has_component("Movable") then
                    local comp_update = entity:get_component("Movable")
                    if(comp_update.movable) then
                        system:update(entity)                    
                    end
                  end
               end                
            end            
        end
    end
end

function World:draw()
    for i = 1, #self.entities do
        local entity = self.entities[i]
        for i, system in ipairs(self.systems) do
            if system.id == "Draw_System" then
                if entity:has_component("Drawable") then
                    local comp_draw = entity:get_component("Drawable") 
                    if (comp_draw.visible) then
                        system:draw(entity)
                    end                    
                end
            end
        end
    end
end

return World