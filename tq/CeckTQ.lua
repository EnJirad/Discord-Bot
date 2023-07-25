local HttpService = game:GetService("HttpService")
local whitelistURL = "https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/tq/usertq.json"
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
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Script-Roblox/main/Treasure-Quest'))()
end

-- ฟังก์ชันในการแปลง JSON เป็นตาราง (table)
local function JSONToTable(jsonString)
    return HttpService:JSONDecode(jsonString)
end

-- โหลด JSON จาก URL
local jsonStr = game:HttpGet(whitelistURL)

-- เรียกใช้ฟังก์ชันในการแปลง JSON เป็นตาราง
local whitelistTable = JSONToTable(jsonStr)

-- เช็คค่า Key ในตาราง
if CheckKey(Key) then
    print("Yes")
    HUB()
else
    print("No")
end
