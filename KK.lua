-- เรียกใช้งานเซอร์วิส HttpService
local HttpService = game:GetService("HttpService")

-- URL ของ API Discord สำหรับการรับข้อมูลของผู้ใช้
local discordAPIUrl = "https://discord.com/api/v9/users/@me"

-- เช็ค ID และแสดงในคอนโซล
local function checkDiscordID()
    -- ขอข้อมูลผู้ใช้ Discord จาก API
    local headers = {
        ["Authorization"] = "MTEyMDU1MTQyODM1MjY1MTMwNQ.GmoBA5.6pguUsY5cPUDM_4rAA2qwPeH3KxuFpQG5prXFc"  -- แทนที่ YOUR_DISCORD_TOKEN ด้วย Discord Token ของคุณ
    }
    
    local response = HttpService:GetAsync(discordAPIUrl, false, headers)
    local userData = HttpService:JSONDecode(response)
    
    -- ตรวจสอบว่าข้อมูลผู้ใช้ Discord ถูกต้อง
    if userData and userData.id then
        local discordID = userData.id
        print("Discord ID: " .. discordID)
    else
        print("Failed to retrieve Discord ID.")
    end
end

-- เรียกใช้งานฟังก์ชัน checkDiscordID
checkDiscordID()
