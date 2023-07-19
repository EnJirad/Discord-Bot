repeat task.wait() until game:IsLoaded()
loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/Anti-Cheat.lua"))()
local A = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/games.lua"))()

for i, v in pairs(TQ) do
    if i == game.PlaceId then
        loadstring(game:HttpGetAsync(v))()
    end
end

local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport 
queue_on_teleport([[repeat wait() until game:IsLoaded() 
print("ServerHopped or rejoined") 
loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/TQ/1.TQ.lua'))()
]])
