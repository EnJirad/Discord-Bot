local currentGameId = game.PlaceId
local games = require(script.Parent.games)

local function RunScript(scriptUrl)
    local script = game:HttpGet(scriptUrl)
    loadstring(script)()
end

local scriptUrl = games[currentGameId]
if scriptUrl then
    RunScript(scriptUrl)
end
