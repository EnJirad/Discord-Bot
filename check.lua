local HttpService = game:GetService("HttpService")
local whitelistURL = "https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/UserTQ.json"
local Key = _G.Key
local ID = _G.ID

local function CheckKey(Key)
    local whitelist = HttpService:JSONDecode(game:HttpGet(whitelistURL))
    for _, user in pairs(whitelist.users) do
        if Key == user.Key and string.len(Key) == 16 then
            return true
        end
    end
    return false
end

local function CheckID(ID)
    local whitelist = HttpService:JSONDecode(game:HttpGet(whitelistURL))
    for _, user in pairs(whitelist.users) do
        if ID == user.ID then
            return true
        end
    end
    return false
end

local function HUB()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/1.TQ.lua'))()
end

if CheckKey(Key) and CheckID(ID) then
    print("Yes")
    HUB()
else
    print("No")
    game.Players.LocalPlayer:Kick("ID and Key not found in whitelist.")
end
