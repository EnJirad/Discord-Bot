local HttpService = game:GetService("HttpService")
local whitelistURL = "https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/LRW2/UserLRW2.json"
local Key = _G.Key

local function CheckKey(Key)
    local whitelist = HttpService:JSONDecode(game:HttpGet(whitelistURL))
    for _, user in pairs(whitelist.users) do
        if Key == user.Key and string.len(Key) == 16 then
            return true
        end
    end
    return false
end

local function HUB()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/LRW2/3.LRW2.lua'))()
end

if CheckKey(Key) then
    print("Yes")
    HUB()
else
    print("No")
end
