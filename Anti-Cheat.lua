repeat wait() until game:IsLoaded()
local G = getgenv and getgenv() or _G or shared
G.Get = setmetatable({}, {__index = function(A, B) return game:GetService(B) end})

G.Player = Players.LocalPlayer
G.wait = task.wait
G.spawn = task.spawn
G.Stepped = RunService.Stepped
G.Idled = Player.Idled

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
    Settings = HttpService:JSONDecode(readfile("V.G Hub//" .. Name))
end

local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(...)
    local Args = {...}
    local A, B, C = ...
    if table.find(Yes, getnamecallmethod()) and A == Player then
        return
    end
    if table.find(Nos, getnamecallmethod()) then
        return
    end
    if type(A) ~= "Instance" then
        return OldNameCall(...)
    end
    return OldNameCall(...)
end)


G.GetFunction = function(A)
    for i,v in next, getgc() do
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
    for i,v in next, getconnections(A) do 
        v:Disable()
    end
    return A
end

G.FireConnection = function(A)
    for i,v in next, getconnections(A) do
        v:Fire()
    end
end

G.Save = function()
    pcall(function()
        writefile("V.G Hub//" .. Name, HttpService:JSONEncode(Settings))
    end)
end
