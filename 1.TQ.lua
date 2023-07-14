repeat wait() until game:IsLoaded()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/Anti-Cheat.lua"))()

local TQScripts = {
    [2960777560] = "https://raw.githubusercontent.com/EnJirad/Script-Roblox/main/Treasure-Quest",
    [2978518061] = "https://raw.githubusercontent.com/EnJirad/Script-Roblox/main/Treasure-Quest"
}

local TQScriptURL = TQScripts[game.PlaceId]

if TQScriptURL then
    loadstring(game:HttpGet(TQScriptURL))()
end

local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport 
queue_on_teleport[[repeat wait() until game:IsLoaded() 
print("Server Hopped or rejoined") 
loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/MainXhub.lua'))()
]]
