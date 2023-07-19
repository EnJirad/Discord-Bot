repeat
    wait()
until game:IsLoaded()

local A,B = pcall(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EnJirad/Script-Roblox/main/Treasure-Quest'))()
end)

if A == false then
    print(B)
end
