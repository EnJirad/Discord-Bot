repeat wait() until game:IsLoaded()

local TQ = getgenv().TQ
local queue_on_teleport = queue_on_teleport or (syn and syn.queue_on_teleport)

if TQ then
    for placeId, scriptUrl in pairs(TQ) do
        if placeId == game.PlaceId then
            loadstring(game:HttpGet(scriptUrl))()
        end
    end
end

queue_on_teleport(function()
    repeat wait() until game:IsLoaded()
    print("Server Hopped or rejoined")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/MainXhub.lua'))()
end)
