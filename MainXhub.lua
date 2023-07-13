repeat task.wait() until game:IsLoaded()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/Anti-Cheat.lua"))()

local A = "https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/games.lua"

local function RunScript(scriptUrl)
    local script = game:HttpGet(scriptUrl)
    loadstring(script)()
end

local games = loadstring(game:HttpGet(gamesUrl))()
local scriptUrl = games[currentGameId]

if scriptUrl then
    RunScript(A)
else
    print("No")
end

local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport 
queue_on_teleport[[repeat wait() until game:IsLoaded() print("ServerHoped or rejoined") loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/MainXhub.lua'))()]]
