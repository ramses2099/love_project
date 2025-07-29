local id = 0

local Manager = {
    entities = {},
    filters = {}
}

function Manager:update(dt)
    for _, ent in ipairs(self.entities) do
        for j, filter in ipairs(self.filters) do
            if filter:matches(ent) then
                filter:update(ent, dt)
                if not ent.loaded then
                    filter:load(ent)
                end
            end
        end
        ent.loaded = true
    end
end

function Manager:physics(dt)
    for _, ent in ipairs(self.entities) do
        for j, filter in ipairs(self.filters) do
            if filter:matches(ent) then
               filter:update(ent, dt)                
            end
        end        
    end
end

function Manager:render()
    for _, ent in ipairs(self.entities) do
        for j, filter in ipairs(self.filters) do
            if filter:matches(ent) then
                filter:render(ent)                
            end
        end       
    end
end

function Manager:filter(matchList)
    local filter = {
        matchList = matchList or {},
        load = function (self, entity) end,
        update = function (self, entity, dt) end,
        render = function (self, entity) end,
        destroy = function (self, entity) end
    }

    function filter:matches(entity)
        for _, match in ipairs(self.matchList) do
            if not entity:has(match) then
                return false
            end
        end
        return true
    end

    table.insert(self.filters, filter)

    return filter
end

function Manager:create()
    local entity = {
        loaded = false,
        id = id,
        components = {},
    }
    id = id  + 1
    table.insert(self.entities, entity)
    
    function entity:add(comp)
        self.components[comp._name] = comp              
    end
    
    function entity:get(name)
        return self.components[name]
    end

    function entity:has(name)
        return self.components[name] ~= nil
    end
   
    return entity
end

return Manager