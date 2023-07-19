local function runScript(scriptUrl)
    local script = game:HttpGet(scriptUrl)
    local runScript = loadstring(script)
    coroutine.wrap(runScript)()
end

local function main()
    repeat wait() until game:IsLoaded()
    
    local process1 = coroutine.create(function()
        runScript("https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/Anti-Cheat.lua")
    end)
    
    local process2 = coroutine.create(function()
        runScript("https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/games.lua")
        for i, v in pairs(getgenv().TQ) do
            if i == game.PlaceId then
                runScript(v)
            end
        end
    end)
    
    local process3 = coroutine.create(function()
        local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport 
        queue_on_teleport([[repeat wait() until game:IsLoaded() 
            print("ServerHoped or rejoined") 
            runScript('https://raw.githubusercontent.com/EnJirad/Discord-Bot/main/TQ/1.TQ.lua')
        ]])
    end)
    
    coroutine.resume(process1)
    coroutine.resume(process2)
    coroutine.resume(process3)
end

main()
