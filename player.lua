local createComp = require "comp"

local function createPlayer()
    return createComp({
        _name = "player"
    })

end

return createPlayer