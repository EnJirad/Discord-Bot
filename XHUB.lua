local currentGameId = game.PlaceId
local gamesUrl = "https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/games.lua"
local xhubScriptUrl = "https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/XHUB.lua"

local function RunScript(scriptUrl)
    local script = game:HttpGet(scriptUrl)
    loadstring(script)()
end

local games = loadstring(game:HttpGet(gamesUrl))()
local scriptUrl = games[currentGameId]
if scriptUrl then
    RunScript(scriptUrl)
else
    RunScript(xhubScriptUrl)
end
