game:GetService("TeleportService").TeleportInitFailed:Connect(function(player, teleportResult, errorMessage)
    -- ตรวจสอบว่าผู้เล่นที่ย้ายเซิร์ฟเวอร์เป็นผู้เล่นปัจจุบันหรือไม่
    if player == game.Players.LocalPlayer then
        -- เมื่อเกิดการล้มเหลวในการเชื่อมต่อเซิร์ฟเวอร์ใหม่
        print("เกิดข้อผิดพลาดในการเชื่อมต่อเซิร์ฟเวอร์ใหม่: " .. errorMessage)
        -- รันสคริปต์ตามที่คุณต้องการทำ
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Script-Roblox/main/Treasure-Quest'))()
    end
end)
