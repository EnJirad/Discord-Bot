local G = getgenv and getgenv() or _G or shared

G.Player = Players.LocalPlayer
G.wait = task.wait

local Name = game.PlaceId .. ".json"
G.Settings = {}

if isfile("V.G Hub//" .. Name) then
    G.Settings = HttpService:JSONDecode(readfile("V.G Hub//" .. Name))
end

local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(...)
    return OldNameCall(...)
end)

G.NoClip = function(A)
    return A:ChangeState(11)
end

G.NoClip2 = function(A)
    for i,v in ipairs(A:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false 
        end
    end
end

G.Save = function()
    pcall(function()
        writefile("V.G Hub//" .. Name, HttpService:JSONEncode(G.Settings))
    end)
end

local ServerHopping = false -- เพิ่มตัวแปรเพื่อควบคุมการ Server Hopping

G.ServerHop = function()
    if ServerHopping then -- เช็คว่ากำลัง Server Hopping อยู่หรือไม่
        return
    end

    ServerHopping = true -- เริ่ม Server Hopping
    spawn(function()
        while true do
            pcall(function()
                local Servers = HttpService:JSONDecode(game:HttpGetAsync('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
                for i,v in ipairs(Servers.data) do
                    if v.playing < v.maxPlayers then
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, Player)
                        break
                    end
                end
            end)
            task.wait(4)
        end
    end)
end

game:GetService("TeleportService").TeleportInitFailed:Connect(function(Player, TeleportResult)
    if TeleportResult == Enum.TeleportResult.GameEnded or TeleportResult == Enum.TeleportResult.LeaveGame then
        ServerHopping = false -- รีเซ็ตตัวแปร ServerHopping เมื่อการเปลี่ยนเซิร์ฟเวอร์สิ้นสุดลง
    end
end)
