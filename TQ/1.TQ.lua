repeat
    task.wait()
until game:IsLoaded()

loadstring(game:HttpGet("https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/Anti-Cheat.lua"))()
local A = loadstring(game:HttpGet("https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/games.lua"))()

for i, v in pairs(map().TQ) do
    if i == game.PlaceId then
        loadstring(game:HttpGet(v))()
    end
end

local queue_on_teleport = queue_on_teleport

queue_on_teleport([[
    repeat
        wait()
    until game:IsLoaded()
    print("Server Hopped or rejoined")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/TQ/1.TQ.lua'))()
]])
