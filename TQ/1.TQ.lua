repeat wait() until game:IsLoaded()

gamemap().TQ = {
    [2960777560] = "https://raw.githubusercontent.com/EnJirad/Script-Roblox/main/Treasure-Quest",
    [2978518061] = "https://raw.githubusercontent.com/EnJirad/Script-Roblox/main/Treasure-Quest"
}

if gamemap().TQ[game.PlaceId] then
    loadstring(game:HttpGet(gamemap().TQ[game.PlaceId]))()
end
