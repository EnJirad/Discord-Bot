local webhookUrl = "https://discord.com/api/webhooks/1125306596193472544/ckXWBIPv8KCHYDfeNYHaJMcgQfngsnsVMQphrr5EPwsHJF5hjSewxlJfjD_i9_cK2yL8"

-- เรียกใช้งานฟังก์ชันเพื่อส่ง Webhook
local function sendWebhook(content)
    local httpService = game:GetService("HttpService")
    local data = {
        ["content"] = content
    }
    
    local headers = {
        ["Content-Type"] = "application/json"
    }
    
    local requestData = httpService:JSONEncode(data)
    
    httpService:PostAsync(webhookUrl, requestData, headers)
end

-- เรียกใช้งาน Webhook เพื่อเช็ค ID
local function checkID()
    local player = game.Players.LocalPlayer
    if player then
        local playerId = player.UserId
        _G.ID = tostring(playerId)
        
        local message = "ID: " .. _G.ID
        sendWebhook(message)
        
        print("ID checked and saved.")
    end
end

-- เรียกใช้งานฟังก์ชัน checkID
checkID()
