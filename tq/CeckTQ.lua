local HttpService = game:GetService("HttpService")
local whitelistURL = "https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/tq/usertq.json"
local Key = _G.Key

local function CheckKey(Key)
    local success, whitelist = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(whitelistURL))
    end)

    if success and type(whitelist) == "table" and whitelist.users then
        for _, user in ipairs(whitelist.users) do
            if Key == user.Key and string.len(Key) == 16 then
                return true
            end
        end
    end
    return false
end

local function HUB(Key)
    local scriptURL = 'https://raw.githubusercontent.com/EnJirad/Script-Roblox/main/Treasure-Quest'
    local scriptContent = game:HttpGet(scriptURL)
    loadstring(scriptContent)()
end

if CheckKey(Key) then
    HUB(Key)
    print("Yes")
else
    print("No")
end
