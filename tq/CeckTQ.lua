local HttpService = game:GetService("HttpService")
local whitelistURL = "https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/tq/usertq.json"
local Key = _G.Key

local function CheckKey(Key)
    local result = game:HttpGet(whitelistURL)
    local keys = result:split("\n")
    for i = 1, #keys do
        if string.match(keys[i], Key) and string.len(Key) == 16 then
            return true
        end
    end
    return false
end


local function HUB()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Script-Roblox/main/Treasure-Quest'))()
end

if CheckKey(Key) then
    print("Yes")
    HUB()
else
    print("No")
end
