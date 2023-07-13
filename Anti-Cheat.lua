repeat wait() until game:IsLoaded()
local G = getgenv and getgenv() or _G or shared
G.Get = setmetatable({}, {__index = function(A, B) return game:GetService(B) end})

G.Player = Players.LocalPlayer
G.wait = task.wait
G.spawn = task.spawn
G.Heartbeat = RunService.Heartbeat
G.Stepped = RunService.Stepped
G.RenderStepped = RunService.RenderStepped
G.Idled = Player.Idled

local Name = game.PlaceId .. ".json"
local Des = {}
if makefolder and not isfile("V.G Hub") then
    makefolder("V.G Hub")
end
