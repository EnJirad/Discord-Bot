repeat wait() until game:IsLoaded()

gamemap().TQ = {
    [2960777560] = "https://raw.githubusercontent.com/EnJirad/Script-Roblox/main/Treasure-Quest",
    [2978518061] = "https://raw.githubusercontent.com/EnJirad/Script-Roblox/main/Treasure-Quest"
}

if gamemap().TQ[game.PlaceId] then
    loadstring(game:HttpGet(gamemap().TQ[game.PlaceId]))()
end

local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport
queue_on_teleport([[repeat wait() until game:IsLoaded() 
print("Server Hopped or rejoined") 
loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/TQ/1.TQ.lua'))()
]])
