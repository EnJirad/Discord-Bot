repeat wait() until game:IsLoaded()

local G = getgenv and getgenv() or _G or shared
G.Get = setmetatable({}, {__index = function(A, B) return game:GetService(B) end})

for _, v in pairs(game:GetChildren()) do
    G[v.ClassName] = v
end

G.Player = game.Players.LocalPlayer
G.wait = task.wait
G.spawn = task.spawn
G.Heartbeat = game:GetService("RunService").Heartbeat
G.Stepped = game:GetService("RunService").Stepped
G.RenderStepped = game:GetService("RunService").RenderStepped
G.Error = script.ScriptContext.Error
G.MessageOut = game:GetService("LogService").MessageOut
G.Kick = game.Players.LocalPlayer.Kick
G.Idled = game.Players.LocalPlayer.Idled

local Name = game.PlaceId .. ".json"
local Settings = {}

if not isfile("V.G Hub") then
    makefolder("V.G Hub")
end

local Pcall, HttpService = pcall, game:GetService("HttpService")
Pcall(function()
    if isfile("V.G Hub/" .. Name) then
        Settings = HttpService:JSONDecode(readfile("V.G Hub/" .. Name))
    else
        writefile("V.G Hub/" .. Name, HttpService:JSONEncode(Settings))
    end
end)

local Yes = {
    "Kick",
    "kick",
}

local Disables = {
    G.Error,
    G.MessageOut,
    G.Idled
}

local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(...)
    local Args = {...}
    local A = ...
    if table.find(Yes, getnamecallmethod()) and A == G.Player then
        return
    end
    if type(A) ~= "Instance" then
        return OldNameCall(...)
    end
    return OldNameCall(...)
end)

if setfflag then
    setfflag("HumanoidParallelRemoveNoPhysics", false)
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", false)
end

if setfpscap then
    setfpscap(100)
end

G.GetFunction = function(A)
    for _, v in ipairs(getgc()) do
        if type(v) == "function" and getinfo(v).name == A and islclosure(v) then
            return v 
        end
    end
end

G.Teleport = function(A, B, Toggle)
    if Toggle and A and B then
        A.CFrame = B
    end
    return A, B, Toggle
end

G.DisableConnection = function(A)
    for _, v in ipairs(getconnections(A)) do 
        v:Disable()
    end
    return A
end

G.FireConnection = function(A)
    for _, v in ipairs(getconnections(A)) do
        v:Fire()
    end
end

G.Tween = function(A, B, C)
    if A and B then
        local Time = (B.Position - A.Position).Magnitude / C 
        local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
        local Tween = game:GetService("TweenService"):Create(A, Info, {CFrame = CFrame.new(B.Position)})
        Tween:Play()
        if Tween.Completed then
            Tween.Completed:Wait()
        end
    end
    return A, B, C
end

G.Save = function()
    pcall(function()
        writefile("V.G Hub/" .. Name, HttpService:JSONEncode(Settings))
    end)
end

G.ServerHop = function()
    spawn(function()
        while wait() do
            pcall(function()
                local Response = game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100')
                local Data = HttpService:JSONDecode(Response)
                for _, v in ipairs(Data.data) do
                    if v.playing < v.maxPlayers then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id, G.Player)
                        break
                    end
                end
            end)
            wait(4)
        end
    end)
end

G.Rejoin = function()
    return game:GetService("TeleportService"):Teleport(game.PlaceId, G.Player)
end

G.NoClip = function(A)
    return A:ChangeState(Enum.HumanoidStateType.Jumping)
end

G.NoClip2 = function(A)
    for _, v in ipairs(A:GetChildren()) do
        if v:IsA("BasePart") then
            v.CanCollide = false 
        end
    end
end

G.SendNotification = function(Title, Text, Icon, Duration)
    return game:GetService("StarterGui"):SetCore("SendNotification", {Title = Title, Text = Text, Icon = Icon, Duration = Duration})
end

G.Mag = function(A, B)
    return (A.Position - B.Position).Magnitude
end

for _, v in ipairs(Disables) do 
    for _, connection in ipairs(getconnections(v)) do
        connection:Disable()
    end
end

script.ScriptContext:SetTimeout(0)

local getconstants = debug.getconstants or getconstants
local getidentity = get_thread_context or getthreadcontext or getidentity or syn.get_thread_identity
local setidentity = set_thread_context or setthreadcontext or setidentity or syn.set_thread_identity
local hookfunc = hookfunction or hookfunc or detour_function

for _, func in ipairs(getgc()) do
    if type(func) == "function" and islclosure(func) then
        local constants = getconstants(func)
        if table.find(constants, "Detected") and table.find(constants, "crash") then
            hookfunc(func, function()
                return task.wait(math.huge)
            end)
        end
    end
end
