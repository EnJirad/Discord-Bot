-- เมื่อมีการย้ายเซิร์ฟเวอร์สำเร็จให้ใช้ฟังก์ชันนี้เพื่อเช็คและรันสคริปต์ที่ต้องการ
function onServerSwitched()
    -- ตรวจสอบเงื่อนไขสำหรับ map().TQ
    if game.GameId == 2960777560 or game.GameId == 2978518061 then
        loadScript(map().TQ[game.GameId])
    end

    -- ตรวจสอบเงื่อนไขสำหรับ map().LRW1
    if game.GameId == 7816227995 then
        loadScript(map().LRW1[game.GameId])
    end

    -- ตรวจสอบเงื่อนไขสำหรับ map().LRW2
    if game.GameId == 11650685514 then
        loadScript(map().LRW2[game.GameId])
    end

    -- ตรวจสอบเงื่อนไขสำหรับ map().LRWRaid
    if game.GameId == 8793520828 or game.GameId == 10127152911 then
        loadScript(map().LRWRaid[game.GameId])
    end
end

-- ฟังก์ชันสำหรับโหลดและรันสคริปต์
function loadScript(scriptUrl)
    -- สร้างตัวแปรเก็บสคริปต์
    local script = Instance.new("Script")
    script.Name = "CustomScript"
    script.Source = game:HttpGet(scriptUrl)
    
    -- เรียกใช้งานสคริปต์
    script.Parent = game:GetService("ServerScriptService")
end

-- เช็คและรันสคริปต์เมื่อมีการย้ายเซิร์ฟเวอร์
onServerSwitched()
