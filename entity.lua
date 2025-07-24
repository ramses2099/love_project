-- entity
return {
    new = function()
        -- entity objects --
        local entity = {
            components = {},
            tags = {},
            remove = false,
            loaded = false
        }
        -- method add componenet --
        function entity:add_component(component)
            assert(component.__id)
            self.components[component.__id] = component
        end

        function entity:get_component(id)
            return self.components[id]        
        end

        function entity:destroy()
            self.remove = true        
        end

        return entity
    end

}