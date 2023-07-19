repeat wait() until game:IsLoaded()

local G = getgenv and getgenv() or _G or shared
G.Get = setmetatable({}, {__index = function(A, B) return game:GetService(B) end})

G.Player = Players.LocalPlayer
G.wait = task.wait

G.Teleport = function(A, B, Toggle)
    if Toggle and A and B then
        A.CFrame = B
    end
    return A, B, Toggle
end

G.NoClip = function(A)
    return A:ChangeState(11)
end

G.NoClip2 = function(A)
    for i,v in next, A:GetDescendants() do
        if v:IsA("BasePart") then
            v.CanCollide = false 
        end
    end
end

for i,v in ipairs({"Error", "MessageOut", "Idled"}) do
    G[v] = nil
end

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

G.Save = function()
    pcall(function()
        writefile("V.G Hub//" .. Name, HttpService:JSONEncode(Settings))
    end)
end

G.ServerHop = function()
    spawn(function()
        while wait(4) do
            pcall(function()
                local Servers = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
                for i,v in ipairs(Servers.data) do
                    if v.playing < v.maxPlayers then
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, Player)
                        break
                    end
                end
            end)
        end
    end)
end

for i,v in next, Disables do 
    for i,v in next, getconnections(v) do
        v:Disable()
    end
end

ScriptContext:SetTimeout(0)

local getconstants = debug.getconstants or getconstants
local hookfunc = hookfunction or hookfunc or detour_function

for a,b in next,getgc() do
    if type(b) == "function" and islclosure(b) then
        local c = getconstants(b)
        if table.find(c, "Detected") and table.find(c, "crash") then
            hookfunc(b, function()
                return task.wait(math.huge)
            end)
        end
    end
end
