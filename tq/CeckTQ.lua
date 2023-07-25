local HttpService = game:GetService("HttpService")
local whitelistURL = "https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/tq/usertq.json"

local function CheckKey()
    local jsonText = game:HttpGet(whitelistURL)
    local success, whitelist = pcall(HttpService.JSONDecode, HttpService, jsonText)

    if not success then
        return false
    end

    if type(whitelist) == "table" and whitelist.users then
        local keyLength = string.len(_G.Key)
        if keyLength == 16 then
            for _, user in pairs(whitelist.users) do
                if _G.Key == user.Key then
                    return true
                end
            end
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
