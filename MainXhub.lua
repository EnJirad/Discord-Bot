repeat task.wait() until game:IsLoaded()

loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/Anti-Cheat"))()
local A = loadstring(game:HttpGet("https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/games.lua"))()

local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport 
queue_on_teleport[[repeat wait() until game:IsLoaded() print("ServerHoped or rejoined") loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/MainXhub.lua'))()]]

for i, v in pairs(Games) do
    if i == game.PlaceId then
        loadstring(game:HttpGet(v))()
    end
end
