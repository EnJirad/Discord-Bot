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


ScriptContext:SetTimeout(0)
local getconstants=debug.getconstants or getconstants;local getidentity=get_thread_context or getthreadcontext or getidentity or syn.get_thread_identity;local setidentity=set_thread_context or setthreadcontext or setidentity or syn.set_thread_identity;local hookfunc=hookfunction or hookfunc or detour_function;for a,b in next,getgc()do if type(b)=="function"and islclosure(b)then local c=getconstants(b)if table.find(c,"Detected")and table.find(c,"crash")then hookfunc(b,function()return task.wait(math.huge)end)end end end
