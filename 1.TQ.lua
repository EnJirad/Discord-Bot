repeat wait() until game:IsLoaded()

local TQ = getgenv().TQ
local queue_on_teleport = queue_on_teleport or (syn and syn.queue_on_teleport)

if TQ then
    local placeId = game.PlaceId
    local scriptUrl = TQ[placeId]
    if scriptUrl then
        loadstring(game:HttpGet(scriptUrl))()
    end
end

queue_on_teleport(function()
    repeat wait() until game:IsLoaded()
    print("Server Hopped or rejoined")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/MainXhub.lua'))()
end)
