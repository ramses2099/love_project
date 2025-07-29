local Manager = require "entities"

local EntityRenderer = Manager:filter({"body", "drawable" })

-- overrider 
function EntityRenderer:render(entity)
    local drawable = entity:get "drawable"
    local body = entity:get "body"

    if drawable.type == "rect" then
        love.graphics.setColor(drawable.color)
        love.graphics.rectangle("fill", body.x, body.y, body.width, body.height)
    else
        assert(false, string.format("Entity renderer does not support the drawable type [%s]", drawable.type))
    end
end