repeat wait() until game:IsLoaded()

local G = getgenv and getgenv() or _G or shared
G.Get = setmetatable({}, {__index = function(A, B) return game:GetService(B) end})

G.Player = Players.LocalPlayer
G.wait = task.wait

local Name = game.PlaceId .. ".json"
local Des = {}
if makefolder and not isfile("V.G Hub") then
    makefolder("V.G Hub")
end

G.Settings = {}
local Pcall = pcall(function()
    if isfile("V.G Hub//" .. Name) then
        readfile("V.G Hub//" .. Name)
    else
        writefile("V.G Hub//" .. Name, HttpService:JSONEncode(Des))
    end
end)

if isfile("V.G Hub//" .. Name) and readfile("V.G Hub//" .. Name) then
    G.Settings = HttpService:JSONDecode(readfile("V.G Hub//" .. Name))
end

local Disables = {
    G.Error,
    G.MessageOut,
    G.Idled
}

local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(...)
    local Args = {...}
    local A, B, C = ...
    if type(A) ~= "Instance" then
        return OldNameCall(...)
    end
    return OldNameCall(...)
end)

if setfflag then
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
end

G.NoClip = function(A)
    return A:ChangeState(11)
end

G.NoClip2 = function(A)
    for i,v in next, A:GetChildren() do
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

G.ServerHop = function()
    spawn(function()
        while wait() do
            pcall(function()
                local Servers = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
                for i,v in next, Servers.data do
                    if v.playing < v.maxPlayers then
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, Player)
                        break
                    end
                end
            end)
            wait(4)
        end
    end)
end

ScriptContext:SetTimeout(0)
