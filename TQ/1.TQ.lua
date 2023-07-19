repeat task.wait() until game:IsLoaded()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/Anti-Cheat.lua"))()
local A = loadstring(game:HttpGet("https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/games.lua"))()

for i, v in pairs(TQ) do
    if i == game.PlaceId then
        loadstring(game:HttpGet(v))()
    end
end

local function checkGameLoaded()
    if game:IsLoaded() then
        print("Server hopped or rejoined")
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/TQ/1.TQ.lua'))()
    else
        spawn(checkGameLoaded)
    end
end

checkGameLoaded()
