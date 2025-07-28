-- entity
Entity = {}
Entity.__index = Entity

function Entity.new()
    local self = setmetatable({}, Entity)
    self.components = {}
    self.remove = false
    self.loaded = false
    return self
end

function Entity:add_component(componet)
    table.insert( self.components, componet)
end

function Entity:get_component(id)
    for _, component in ipairs(self.components) do
        if component.id == id then
            return component        
        end
    end
    return nil
end

function Entity:remove_component(id)
    for i, component in ipairs(self.components) do
        if component.id == id then            
            table.remove( self.components, i)
            return true       
        end
    end
    return false
end

function Entity:has_component(id)
    for i, component in ipairs(self.components) do
        if component.id == id then            
            return true       
        end
    end
    return false
end

function Entity:length_components()
    return #self.components
end

function Entity:is_empty_components()
    return #self.components == 0
end

function Entity:destroy()
    self.remove = true        
end

return Entity