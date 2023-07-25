local HttpService = game:GetService("HttpService")
local whitelistURL = "https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/tq/usertq.json"

local function CheckKey()
    local whitelist = HttpService:JSONDecode(game:HttpGet(whitelistURL))
    for _, user in pairs(whitelist.users) do
        if _G.Key == user.Key and string.len(_G.Key) == 16 then
            return true
        end
    end
    return false
end

local function HUB()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Script-Roblox/main/Treasure-Quest'))()
end

if CheckKey() then
    print("Yes")
    HUB()
else
    print("No")
end
