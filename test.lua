local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local Packets = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Packets"))

-- DATA WAYPOINTS BARU LU BRO
local waypoints = {
    {Vector3.new(-147.73, -30.07, -165.87), nil, true},
    {Vector3.new(-109.24, -24.17, -187.50), nil, true},
    {Vector3.new(-128.69, -35.00, -183.10), 0.01, false},
    {Vector3.new(-141.02, -11.87, -188.26), 0.01, false},
    {Vector3.new(-126.94, -7.79, -206.08), nil, true},
    {Vector3.new(-126.00, -3.75, -215.39), 0.01, false},
    {Vector3.new(102.89, -3.00, -326.25), 0.01, false},
    {Vector3.new(186.08, -3.47, -233.67), 0.01, false},
    {Vector3.new(223.61, -3.00, -204.31), 0.01, false},
    {Vector3.new(411.89, -3.67, 128.87), 0.01, false},
    {Vector3.new(453.57, 6.36, 139.23), 0.01, false},
    {Vector3.new(461.60, 16.56, 142.94), 0.01, false},
    {Vector3.new(478.62, 15.39, 150.73), nil, true},
    {Vector3.new(504.06, 12.74, 188.21), 0.01, false},
    {Vector3.new(467.13, 15.30, 238.22), nil, true},
    {Vector3.new(509.99, 12.53, 164.11), 0.01, false},
    {Vector3.new(519.12, -3.00, 147.19), 0.01, false},
    {Vector3.new(621.35, -3.27, -143.44), 0.01, false},
    {Vector3.new(624.31, 18.55, -164.57), 0.01, false},
    {Vector3.new(632.99, 29.21, -174.60), 0.01, false},
    {Vector3.new(663.02, 36.08, -189.45), nil, true},
    {Vector3.new(697.37, 27.11, -182.30), 0.01, false},
    {Vector3.new(727.39, 24.90, -221.17), 0.01, false},
    {Vector3.new(740.64, 20.49, -277.09), 0.01, false},
    {Vector3.new(699.72, 34.09, -297.40), 0.01, false},
    {Vector3.new(678.81, 52.51, -317.05), 0.01, false},
    {Vector3.new(682.06, 80.56, -372.30), 0.01, false},
    {Vector3.new(677.09, 78.95, -381.96), nil, true},
    {Vector3.new(633.86, 48.47, -357.08), 0.01, false},
    {Vector3.new(580.62, 13.45, -350.00), 0.01, false},
    {Vector3.new(609.73, -6.18, -353.38), nil, true},
    {Vector3.new(622.33, -6.21, -359.16), nil, true},
    {Vector3.new(636.71, -7.20, -375.39), nil, true},
    {Vector3.new(613.61, -6.25, -384.32), nil, true},
    {Vector3.new(557.05, 11.62, -393.43), 0.01, false},
    {Vector3.new(506.29, -4.67, -385.39), 0.01, false},
    {Vector3.new(22.75, -3.11, -523.12), 0.01, false},
    {Vector3.new(-65.09, -3.11, -527.69), 0.01, false},
    {Vector3.new(-79.71, 5.00, -533.88), 0.01, false},
    {Vector3.new(-202.26, 6.74, -622.02), 0.01, false},
    {Vector3.new(-212.27, 25.33, -625.94), nil, true},
    {Vector3.new(-232.01, -2.78, -638.53), 0.01, false},
    {Vector3.new(-262.32, -39.11, -656.54), 0.01, false},
    {Vector3.new(-226.31, -38.97, -633.08), 0.01, false},
    {Vector3.new(-149.40, -23.31, -563.70), 0.01, false},
    {Vector3.new(-118.20, -39.51, -611.25), 0.01, false},
    {Vector3.new(-146.85, -54.88, -631.76), 0.01, false},
    {Vector3.new(-177.84, -64.19, -608.29), 0.01, false},
    {Vector3.new(-211.72, -57.96, -629.11), nil, true},
    {Vector3.new(-177.84, -64.19, -608.29), 0.01, false},
    {Vector3.new(-158.42, -64.82, -591.58), 0.01, false},
    {Vector3.new(-175.88, -63.80, -553.14), 0.01, false},
    {Vector3.new(-164.27, -63.02, -521.57), 0.01, false},
    {Vector3.new(-190.30, -66.24, -464.96), 0.01, false},
    {Vector3.new(-166.16, -98.18, -452.94), 0.01, false},
    {Vector3.new(-91.88, -103.00, -425.60), 0.01, false},
    {Vector3.new(-50.10, -103.00, -430.36), 0.01, false},
    {Vector3.new(18.88, -99.85, -411.12), 0.01, false},
    {Vector3.new(25.49, -99.01, -373.50), 0.01, false},
    {Vector3.new(40.41, -95.68, -371.76), nil, true},
    {Vector3.new(57.69, -95.69, -355.40), nil, true}, -- Ganti koordinat target 61
    {Vector3.new(17.02, -98.66, -387.86), 0.01, false},
    {Vector3.new(18.76, -99.90, -416.97), 0.01, false},
    {Vector3.new(-87.45, -102.32, -431.01), 0.01, false},
    {Vector3.new(-122.78, -102.90, -335.43), 0.01, false},
    {Vector3.new(-112.94, -91.12, -279.20), 0.01, false},
    {Vector3.new(-153.35, -87.36, -257.07), 0.01, false},
    {Vector3.new(-224.83, -83.06, -259.45), 0.01, false},
    {Vector3.new(-245.45, -82.74, -245.67), nil, true},
    {Vector3.new(-224.83, -83.06, -259.45), 0.01, false},
    {Vector3.new(-245.03, -74.41, -297.54), 0.01, false},
    {Vector3.new(-252.99, -74.54, -314.63), 0.01, false},
    {Vector3.new(-303.95, -75.70, -371.95), nil, true},
    {Vector3.new(-252.99, -74.54, -314.63), 0.01, false},
    {Vector3.new(-245.03, -74.41, -297.54), 0.01, false},
    {Vector3.new(-224.83, -83.06, -259.45), 0.01, false},
    {Vector3.new(-153.35, -87.36, -257.07), 0.01, false},
    {Vector3.new(-89.26, -82.73, -218.67), 0.01, false},
    {Vector3.new(-49.30, -81.96, -213.02), 0.01, false},
    {Vector3.new(-10.98, -83.42, -182.03), 0.01, false},
    {Vector3.new(3.33, -80.45, -150.76), 0.01, false},
    {Vector3.new(46.73, -75.16, -141.67), 0.01, false},
    {Vector3.new(82.95, -71.91, -130.99), 0.01, false},
    {Vector3.new(92.68, -48.71, -48.34), 0.01, false},
    {Vector3.new(43.29, -36.63, -41.88), 0.01, false},
    {Vector3.new(-6.70, -32.38, -129.97), 0.01, false},
    {Vector3.new(-63.66, -35.00, -136.64), 3.5, false}, -- Durasi pangkas jadi 3.5 detik
    {Vector3.new(-65.00, -35.03, -97.20), 0.01, false},
    {Vector3.new(-96.43, -35.47, -105.77), 0.01, false},
    {Vector3.new(-122.10, -36.63, -129.21), 0.01, false},
}

-- FUNGSI HIT AURA (Mencari dan Memukul Gold Node)
local function doHitAura()
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local myPos = char.HumanoidRootPart.Position

    -- Cari objek bernama Gold Node di seluruh Workspace
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "Gold Node" and obj:IsA("BasePart") then
            local distance = (obj.Position - myPos).Magnitude
            
            -- Jika jaraknya dekat (masuk radius hit 15 studs)
            if distance <= 15 then
                -- Kita coba tembak server pake 3 tebakan struktur table terkuat:
                pcall(function()
                    -- Tebakan 1: Kirim CFrame posisi target
                    Packets.SwingTool.send({CFrame = obj.CFrame, Target = obj})
                    -- Tebakan 2: Kirim CFrame posisi kita sendiri + Target
                    Packets.SwingTool.send({CFrame = char.HumanoidRootPart.CFrame, Node = obj})
                    -- Tebakan 3: Format bungkus standar game survival
                    Packets.SwingTool.send({target = obj, cframe = obj.CFrame})
                end)
            end
        end
    end
end

-- Loop utama Hit Aura (berjalan di background setiap 0.2 detik)
task.spawn(function()
    while true do
        doHitAura()
        task.wait(0.2)
    end
end)

-- LOGIC AUTO WALK (Waypoints)
local speed = 16
for i, wp in ipairs(waypoints) do
    local targetPos = wp[1]
    local delayTime = wp[2]
    
    local char = player.Character
    while not char or not char:FindFirstChild("HumanoidRootPart") do
        task.wait(0.5)
        char = player.Character
    end
    
    local hrp = char.HumanoidRootPart
    local currentPos = hrp.Position
    local distance = (targetPos - currentPos).Magnitude
    local duration = distance / speed
    
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(targetPos)})
    tween:Play()
    tween.Completed:Wait()
    
    if delayTime then
        task.wait(delayTime)
    end
end
