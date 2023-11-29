-- button Gui
-- Create a ScreenGui
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui
gui.ResetOnSpawn = false

-- Create a TextButton
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 100, 0, 50)
button.Position = UDim2.new(0, 10, 0.2, -25)  -- Adjusted position to be on the left
button.Text = "Toggle"
button.Parent = gui

-- Function to send the virtual key event
local function sendKeyEvent()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "N", false, game)
end

-- Connect the function to the button's MouseClick event
button.MouseButton1Click:Connect(sendKeyEvent)

-- instances
getgenv().Get =
    setmetatable(
    {},
    {
        __index = function(A, B)
            return game:GetService(B)
        end
    }
)

print("-- Unknown TQ Hub 1/5: Checking Game...")

wait(2)

print("-- Unknown TQ Hub 2/5: Getting Service...")

wait(1)

-- Test literally
local request = http_request or request or HttpPost

-- waiting for game load
while not game:IsLoaded() do
    RunService.Heartbeat:Wait()
end

-- Valuable 1
repeat wait() until game:IsLoaded()
local ReplicatedStorage = Get.ReplicatedStorage
local Players = Get.Players
local RunService = Get.RunService
local TweenService = Get.TweenService
local Workspace = Get.Workspace
local HttpService = Get.HttpService
local Player = Players.LocalPlayer
local InventoryController = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("Shared"):WaitForChild("Client"):WaitForChild("InventoryController"))

print("-- Unknown TQ Hub 3/5: Bypassing Random Name...")

wait(0.5)

print("-- Unknown TQ Hub 3.5/5: Bypassing... *DumbExploiterController* ")

-- Valuable Servers
local isWaveDefense
local isPumpkinEvent
local isLobby = game.PlaceId == 2960777560

function bypassAntiCheat()
    local exploiterController = game:GetService("Players").LocalPlayer.PlayerScripts.Shared.Client:WaitForChild(
        'DumbExploiterController')

    -- bypass anti-cheat
    local cheat = require(exploiterController)
    cheat._Update = function()
        return
    end

    cheat._SetupDummyRemotes = function()
        return
    end

    while not game:GetService("Players") do
        wait()
    end

    while not game:GetService("ReplicatedStorage") do
        wait()
    end

    task.wait(2)

    game:GetService("Players").Name = 'Players'
    game:GetService("ReplicatedStorage").Name = 'ReplicatedStorage'
    workspace.Name = 'Workspace'

    if isLobby then
        return
    end

    workspace:GetChildren()[5].Name = 'Dungeon'

    -- Wave defense
    if workspace.Dungeon:FindFirstChild("EnemySpawns") then
        workspace.Dungeon:GetChildren()[5].Name = 'Enemies'
        isWaveDefense = workspace.Dungeon:FindFirstChild("EnemySpawns")
        return
    end

    -- Nomal dungeon
    workspace.Dungeon:GetChildren()[1].Name = 'Enemies'
    workspace.Dungeon:GetChildren()[2].Name = 'Rooms'

    -- Pumpkin Event
    if workspace.Dungeon.Rooms:FindFirstChild("Start"):FindFirstChild("Traps") then
        isPumpkinEvent = true
    end
end

bypassAntiCheat()

function getPlayer()
    while not game:GetService('Players').LocalPlayer do
        RunService.Heartbeat:Wait()
    end
    while not game:GetService('Players').LocalPlayer.Character do
        RunService.Heartbeat:Wait()
    end
    while not game:GetService('Players').LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
        RunService.Heartbeat:Wait()
    end
    while not game:GetService('Players').LocalPlayer.Character:FindFirstChild("Humanoid") do
        RunService.Heartbeat:Wait()
    end

    local player = game:GetService('Players').LocalPlayer
    local cha = game:GetService('Players').LocalPlayer.Character
    local plr = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
    local hum = game:GetService('Players').LocalPlayer.Character.Humanoid
    return player, cha, plr, hum
end

-- Function to get dungeon components
function getDungeon()

    while not game:GetService("Workspace"):FindFirstChild("Dungeon") do
        RunService.Heartbeat:Wait()
    end
    while not game:GetService("Workspace"):FindFirstChild("Dungeon"):FindFirstChild("Rooms") do
        RunService.Heartbeat:Wait()
    end
    while not game:GetService("Workspace"):FindFirstChild("Dungeon"):FindFirstChild("Enemies") do
        RunService.Heartbeat:Wait()
    end
    while not game:GetService("Workspace"):FindFirstChild("Dungeon"):FindFirstChild("Shrines") do
        RunService.Heartbeat:Wait()
    end

    local dungeon = game:GetService("Workspace").Dungeon
    local rooms = dungeon.Rooms
    local enemies = dungeon.Enemies
    local shrines = dungeon.Shrines
    return dungeon, rooms, enemies, shrines
end

function killAura(monster)
    for _, damage in ipairs(game:GetService("Workspace").Ignore:GetDescendants()) do
           if damage.ClassName ~= "Model" then
               pcall(function()
                   damage.Transparency = 1
                   damage.CFrame = CFrame.new(monster.HumanoidRootPart.Position)
                      damage.Position = monster.HumanoidRootPart.Position
               end)
           end
        pcall(function()
            if damage.ClassName ~= "Model" and damage.ClassName ~= "Explosion" then
                game:GetService("TweenService"):Create(damage, TweenInfo.new(1), {
                    CFrame = monster.HumanoidRootPart.CFrame
                }):Play()
            end
            if damage:FindFirstChild("Hitbox") then
                game:GetService("TweenService"):Create(damage.Hitbox, TweenInfo.new(1), {
                    CFrame = monster.HumanoidRootPart.CFrame
                }):Play()
            end
        end)
    end
end

local h = require(ReplicatedStorage.Shared.Modules.DungeonLibrary)

local Settings = {}

local Dungeons = {}
for i, v in pairs(h.Dungeons) do
    table.insert(Dungeons, i)
end
GameModes = {}
for i, v in pairs(h.GameModes) do
    table.insert(GameModes, i)
end
Difficulties = {}
for i, v in pairs(h.Difficulties) do
    table.insert(Difficulties, i)
end

local function GetClosestt()
    local TargetDistance = math.huge
    local Target
    for i, v in pairs(Workspace:GetChildren()) do
        if v.ClassName == "Folder" then
            for i, x in pairs(v:GetChildren()) do
                if x.ClassName == "Folder" then
                    for i, c in pairs(x:GetChildren()) do
                        if
                            c.ClassName == "Model" and c:FindFirstChild("EvilHumanoid") and
                                c:FindFirstChildOfClass("Humanoid").Health ~= 0 and
                                c ~= nil
                         then
                            local mag =
                                (Player.Character.HumanoidRootPart.Position -
                                c.HumanoidRootPart.Position).magnitude
                            if mag < TargetDistance then
                                TargetDistance = mag
                                Target = c
                            end
                        end
                    end
                end
            end
        end
    end
    return Target
end

local Noclip = function(A)
    return A:ChangeState(11)
end 

local TweenService = game:GetService("TweenService")

local Tween = function(A,B,C)
    if A and B and C then
        return TweenService:Create(A, TweenInfo.new((B.Position + Vector3.new(x,y,z) - A.Position).magnitude / C, Enum.EasingStyle.Linear),{CFrame = CFrame.new(B.Position + Vector3.new(x,y,z))}):Play()
    end 
end
local Script = require(Player.PlayerScripts.Shared.Client.CombatController)
local ScriptFunction = Script.BasicAttack
local ScriptFunction2 = Script.UseAbility

speed = 50

x = 0

y = 0

z = -2

-- Valuable from autoleave
local cha = game:GetService('Players').LocalPlayer.Character
local mainFrame = game:GetService("Players")[cha.Name].PlayerGui:WaitForChild("MainGui"):WaitForChild("MainFrame")
local rightSideFrame = mainFrame:WaitForChild("Right")
local topSideFrame = mainFrame:WaitForChild("Top")
local playerCard = mainFrame:WaitForChild("Bottom"):WaitForChild("PlayerCard")

if game.PlaceId == 2960777560 then
pcall(function()
ReplicatedStorage.Lobby.Remotes.ClaimDailyReward:FireServer()
ReplicatedStorage.Lobby.Remotes.ClaimTreasureReward:FireServer()
end)
end

game:GetService("Workspace"):FindFirstChild("Map")

print("-- Unknown TQ Hub 4/5: Checking Exploit Support...")

wait(2)

if not require then
    return game.Players.LocalPlayer:Kick("Your Exploit doesn't support")
end

if not firetouchinterest then
    return game.Players.LocalPlayer:Kick("Your Exploit doesn't support")
end

print("-- Unknown TQ Hub 5/5: Loaded, Pls Wait for Few Seconds...")

wait(2)

-- Troubleshooting Ui library
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

Fluent:Notify({
        Title = "Made by Unknownproooolucky",
        Content = "",
        SubContent = "", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })
   
Fluent:Notify({
        Title = "Announcement Notification",
        Content = "Fixed Little Bug",
        SubContent = "Small Update: Fixed Low device Fast Farming Not killing Monsters", -- Optional
        Duration = 10 -- Set to nil to make the notification not disappear
    })
   
Fluent:Notify({
        Title = "Quick Optimzer",
        Content = "Done!",
        SubContent = "", -- Optional
        Duration = 10 -- Set to nil to make the notification not disappear
    })
   
local Window = Fluent:CreateWindow({
    Title = "Unknown TQ Hub",
    SubTitle = "V3 (Fluent)",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.N -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Auto Farms", Icon = "" }),
}

local Toggle1 = Tabs.Main:AddToggle("AutokillMob", {Title = "Auto Kill Mobs", Default = false })

Toggle1:OnChanged(function(State)
    Settings.H = State
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            if Settings.H then
                ScriptFunction(Script)
                ScriptFunction2(Script, GetClosestt().PrimaryPart.Position)
                Noclip(Player.Character:WaitForChild("Humanoid"))
            end
        end)
    end)
    spawn(function()
        while wait() and Settings.H do 
            pcall(function()
                ReplicatedStorage.Dungeon.Remotes.StartDungeon:FireServer()
                ReplicatedStorage.Dungeon.Remotes.StartDungeon:FireServer()
                ReplicatedStorage.Dungeon.Remotes.StartWaveDefense:FireServer()
                ReplicatedStorage.Shared.Remotes.Data.ClaimPrizes:FireServer()
                for i, v in pairs(Workspace:GetChildren()) do
                    if v:FindFirstChild("FinishRoom", true) and v:FindFirstChild("FinishRoom", true):FindFirstChild("Hitbox", true) then
                        firetouchinterest(Player.Character:FindFirstChild("HumanoidRootPart", true),v:FindFirstChild("FinishRoom",true):FindFirstChild("Hitbox",true):FindFirstChild("Part",true),0)
                        firetouchinterest(Player.Character:FindFirstChild("HumanoidRootPart", true),v:FindFirstChild("FinishRoom",true):FindFirstChild("Hitbox",true):FindFirstChild("Part",true),1)
                    end 
                end 
                if GetClosestt():FindFirstChildWhichIsA("Humanoid",true).Health ~= 0 then
                    Tween(Player.Character:FindFirstChild("HumanoidRootPart",true),GetClosestt().HumanoidRootPart,speed)
                end 
            end)
        end
    end)
end)

local function StartDungeon()
    local hasHumanoidRootPart = false
    for _, v in ipairs(game:GetService("Workspace"):GetChildren()) do
        if v.ClassName == "Folder" then
            for _, x in ipairs(v:GetChildren()) do
                if x.ClassName == "Folder" then
                    for _, c in ipairs(x:GetChildren()) do
                        if c:IsA("Model") and c:FindFirstChild("HumanoidRootPart") then
                            hasHumanoidRootPart = true
                            break
                        end
                    end
                end
                if hasHumanoidRootPart then
                    break
                end
            end
        end
        if hasHumanoidRootPart then
            break
        end
    end

    if not hasHumanoidRootPart then
        wait(1.5)
        game.ReplicatedStorage.Dungeon.Remotes.StartDungeon:FireServer()
        game.ReplicatedStorage.Dungeon.Remotes.StartWaveDefense:FireServer()
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------

local visitedChests = {}
local lastVisitedChest = nil

local function findNewChestInWorkspace(parent)
    for _, child in pairs(parent:GetChildren()) do
        if child:IsA("Folder") and child.Name == "Chests" then
            for _, grandchild in pairs(child:GetChildren()) do
                if grandchild:IsA("Model") and grandchild.Name == "Chest" then
                    local ChestPart = grandchild:FindFirstChild("Hitbox")
                    if ChestPart and not visitedChests[grandchild] then
                        visitedChests[grandchild] = true
                        lastVisitedChest = grandchild
                        return ChestPart
                    end
                end
            end
        end

        local foundPart = findNewChestInWorkspace(child)
        if foundPart then
            return foundPart
        end
    end

    return nil
end

-----------------------------------------------------------------------------------------------------------------------------------------------------

local function findFinishPartInWorkspace(workspace)
    local function searchInChildren(parent)
        for _, child in pairs(parent:GetChildren()) do
            if child:IsA("Model") and child.Name == "FinishRoom" then
                local finishPart = child:FindFirstChild("Hitbox")
                local HitboxPart = finishPart and finishPart:FindFirstChildWhichIsA("BasePart")
                if HitboxPart then
                    return HitboxPart
                end
            end

            local foundPart = searchInChildren(child)
            if foundPart then
                return foundPart
            end
        end

        return nil
    end

    return searchInChildren(workspace)
end

--------------------------------------------------------------------------------------------------------------------------------------------

local function findBossRoomInWorkspace(workspace)
    local function searchInChildren(parent)
        for _, child in pairs(parent:GetChildren()) do
            if child:IsA("Model") and child.Name == "BossRoom" then
                local BossPart = child:FindFirstChild("PlayerSpawn")
                if BossPart then
                    return BossPart
                end
            end

            local foundPart = searchInChildren(child)
            if foundPart then
                return foundPart
            end
        end

        return nil
    end

    return searchInChildren(workspace)
end

local BossPartInstance = nil

local function CreateBossPart()
    local partSize = Vector3.new(20000, 10, 20000)

    if BossPartInstance and BossPartInstance:IsDescendantOf(workspace) then
        BossPartInstance:Destroy()
    end

    local createdPart = Instance.new("Part")
    createdPart.Name = "PartฺBossGGez"
    createdPart.Size = partSize

    local PlayerSpawn = findBossRoomInWorkspace(workspace)
    if PlayerSpawn then
        createdPart.Position = PlayerSpawn.Position - Vector3.new(0, 10, 0)
    else
        createdPart.Position = Vector3.new(0, -10, 0)
    end
    createdPart.Anchored = true
    createdPart.Parent = workspace

    BossPartInstance = createdPart

    local HitboxPart = findFinishPartInWorkspace(workspace)
    if HitboxPart then
        for _, part in pairs(workspace:GetChildren()) do
            if part:IsA("Part") and part.Name == "PartฺBossGGez" then
                part:Destroy()
            end
        end
    end
    return createdPart
end

local function MoveOutFromBossRoom()
    CreateBossPart()
    wait(3)
    local PlayerSpawn = findBossRoomInWorkspace(workspace)
    if PlayerSpawn then
        local targetPosition = PlayerSpawn.Position - Vector3.new(0, 0, -75)
        local movementSpeed = 70

        local TweenService = game:GetService("TweenService")
        local HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart

        local distance = (targetPosition - HumanoidRootPart.Position).Magnitude
        local duration = distance / movementSpeed

        local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
        local tween = TweenService:Create(HumanoidRootPart, tweenInfo, {
            CFrame = CFrame.new(targetPosition)
        })

        tween:Play()
    end
end

---------------------------------------------------------------------------------------------------------------------------------

local function Wskill()
    local Skill = {"Fireball", "Tsunami", "Freeze", "Heal", "HealBlast", "Shockwave", "LaserBeam", "LightningStrike",
                   "Sandstorm", "Earthquake", "IceSpikes", "PolarVortex", "TeamHeal", "RainbowBlast", "PumpkinBlast",
                   "Random", "Camouflage", "Tumble", "Flurry", "Boomerang", "ShockArrows", "ShocFlameArrowskwave",
                   "BoomArows", "FrostArrows", "WeaponThrow", "WaveBlast", "InfernoWave", "SpikeField", "Berserk",
                   "Pulsefire", "Cyclone", "BlackHole", "QuickSlash", "MeteorShower", "MeteorBlast", "Stomp"}

    for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if table.find(Skill, v.Name) then
            local SKK = table.find(Skill, v.Name)
            local AllPart = v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("Part")
            if (SKK or AllPart) then
                v.Transparency = 1
            end
        end
    end
end

local function visibleskill()
    local Skill = {"Fireball", "Tsunami", "Freeze", "Heal", "HealBlast", "Shockwave", "LaserBeam", "LightningStrike",
                   "Sandstorm", "Earthquake", "IceSpikes", "PolarVortex", "TeamHeal", "RainbowBlast", "PumpkinBlast",
                   "Random", "Camouflage", "Tumble", "Flurry", "Boomerang", "ShockArrows", "ShocFlameArrowskwave",
                   "BoomArows", "FrostArrows", "WeaponThrow", "WaveBlast", "InfernoWave", "SpikeField", "Berserk",
                   "Pulsefire", "Cyclone", "BlackHole", "QuickSlash", "MeteorShower", "MeteorBlast", "Stomp"}

    for _, v in pairs(game:GetService("Workspace").Ignore:GetChildren()) do
        if table.find(Skill, v.Name) then
            local SKK = table.find(Skill, v.Name)
            local AllPart = v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("Part")
            if (SKK or AllPart) then
                v.Transparency = 1
            end
        end
    end
end

local function visiblemob()
    local visible = {"LeftHand", "LeftLowerArm", "LeftUpperArm", "RightHand", "RightLowerArm", "RightUpperArm",
                     "UpperTorso", "LeftFoot", "LeftLowerLeg", "LeftUpperLeg", "RightFoot", "RightLowerLeg",
                     "RightUpperLeg", "LowerTorso", "Head", "Body Colors", "FakeHead", "+Appearance", "Hat"}

    for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v.ClassName == "Folder" then
            for _, x in pairs(v:GetChildren()) do
                if x.ClassName == "Folder" then
                    for _, c in pairs(x:GetChildren()) do
                        if c:IsA("Model") then
                            for _, f in pairs(c:GetChildren()) do
                                if table.find(visible, f.Name) then
                                    f:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

local function allvis()
    Wskill()
    visibleskill()
    visiblemob()
end

---------------------------------------------------------------------------------------------------------------------------------

local Script = require(Player.PlayerScripts.Shared.Client.CombatController)
local ScriptFunction = Script.BasicAttack
local ScriptFunction2 = Script.UseAbility

Tabs.Main:AddParagraph({
        Title = "Warrior Weapon",
        Content = "Yes"
    })

Tabs.Main:AddParagraph({
        Title = "Archer Weapon",
        Content = "No"
    })

Tabs.Main:AddParagraph({
        Title = "Magic Weapon",
        Content = "Yes"
    })

local Toggle4 = Tabs.Main:AddToggle("FastFarmingHigh", {Title = "Fast Auto-Farming (High Device)", Default = false })

    Toggle4:OnChanged(function(vaf)
        AutoMobs = vaf

        if AutoMobs then



while AutoMobs do

    StartDungeon()
    killAura(monster)
  
    spawn(function()

        while AutoMobs do

            wait(1)

            local dungeon, rooms, enemies, shrines = getDungeon()

            for _, monster in ipairs(enemies:GetChildren()) do

                if monster:FindFirstChild("EvilHumanoid") and monster:FindFirstChild("HumanoidRootPart") and

                        monster.EvilHumanoid.Health >= 0 then

                    local monsterRootPart = monster.HumanoidRootPart

                    if monsterRootPart.Size ~= Vector3.new(500000, 10000, 500000) then

                        monsterRootPart.Size = Vector3.new(500000, 10000, 500000)

                        monsterRootPart.Transparency = 0.9

                        for _, v in ipairs(Workspace:GetChildren()) do

                            if v.ClassName == "Folder" then

                                for _, x in ipairs(v:GetChildren()) do

                                    if x.ClassName == "Folder" then

                                        for _, c in ipairs(x:GetChildren()) do

                                            if c:IsA("Model") and c:FindFirstChild("EvilHumanoid") then

                                                local EvilHumanoid = c:FindFirstChild("EvilHumanoid")

                                                local humanoidRootPart = c:FindFirstChild("HumanoidRootPart")



                                                if EvilHumanoid and humanoidRootPart then

                                                    local monsterPos = humanoidRootPart.Position

                                                    local player = game.Players.LocalPlayer

                                                    local playerPos = player.Character and

                                                            player.Character:FindFirstChild(

                                                                    "HumanoidRootPart") and

                                                            player.Character.HumanoidRootPart.Position



                                                    if playerPos and EvilHumanoid.Health > 0 then

                                                        local direction = (playerPos - monsterPos).unit

                                                        local distanceToTeleport = 3

                                                        local teleportPos = playerPos + direction * distanceToTeleport

                                                        humanoidRootPart.Position = teleportPos

                                                    end

                                                end

                                            end

                                        end

                                    end

                                end

                            end

                        end

                    end

                end

            end

            wait()

        end

    end)





                local function PerformAttack()

                    pcall(function()

                        if AutoMobs then

                            ScriptFunction(Script)

                            ScriptFunction2(Script)

                        end

                    end)

                end

                game:GetService("RunService").Stepped:Connect(PerformAttack)



                spawn(function()

                    while AutoMobs do

                        allvis()

                        wait(0.01)

                    end

                end)



                spawn(function()

                    while AutoMobs do

                        MoveOutFromBossRoom()

                        wait(0.01)

                    end

                end)



                spawn(function()

                    while AutoMobs do

                        local finishPart = findFinishPartInWorkspace(game:GetService("Workspace"))

                        if finishPart then

                            local character = game.Players.LocalPlayer.Character

                            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

                            if humanoidRootPart then

                                local ChestPart = findNewChestInWorkspace(game:GetService("Workspace"))

                                if ChestPart then

                                    humanoidRootPart.CFrame = ChestPart.CFrame

                                    wait(3)

                                    humanoidRootPart.CFrame = finishPart.CFrame

                                end

                            end

                        end

                        wait(0.1)

                    end

                end)

                wait(0.01)

            end

        end

    end)
   

Tabs.Main:AddParagraph({
        Title = "Magic Weapon (Only)",
        Content = ""
    })

local Toggle5 = Tabs.Main:AddToggle("FastFarmingLow", {Title = "Fast Auto-Farming (Low Device)", Default = false })

    Toggle5:OnChanged(function(value)
AutoMobs2 = value
        if AutoMobs2 then
            while AutoMobs2 do
                StartDungeon()
                spawn(function()
                    while AutoMobs2 do
                        wait(0.01)
                        for _, v in ipairs(workspace:GetChildren()) do
                            if v.ClassName == "Folder" then
                                for _, x in ipairs(v:GetChildren()) do
                                    if x.ClassName == "Folder" then
                                        for _, c in ipairs(x:GetChildren()) do
                                            if c:IsA("Model") and c:FindFirstChild("EvilHumanoid") then
                                                local EvilHumanoid = c:FindFirstChild("EvilHumanoid")
                                                local monsterPos = c:FindFirstChild("HumanoidRootPart").Position
                                                local dungeon, rooms, enemies, shrines = getDungeon()
                                                for _, monster in ipairs(enemies:GetChildren()) do
                                                    if monster:FindFirstChild("EvilHumanoid") and monster:FindFirstChild("HumanoidRootPart") and
                                                        monster.EvilHumanoid.Health > 0 then
                                                        local monsterRootPart = monster.HumanoidRootPart
                                                        if monsterRootPart.Size ~= Vector3.new(50, 30, 50) then
                                                            monsterRootPart.Size = Vector3.new(50, 30, 50)
                                                            monsterRootPart.Transparency = 1
                                                        end
                                                    end
                                                end

                                                if EvilHumanoid then
                                                    spawn(function()
                                                        while AutoMobs2 do
                                                            local Skill = {"Fireball", "Tsunami", "Freeze", "Heal", "HealBlast",
                                                                "Shockwave", "LaserBeam", "LightningStrike",
                                                                "Sandstorm", "Earthquake", "IceSpikes", "PolarVortex",
                                                                "TeamHeal", "RainbowBlast", "PumpkinBlast", "Random",
                                                                "Camouflage", "Tumble", "Flurry", "Boomerang",
                                                                "ShockArrows", "ShocFlameArrowskwave", "BoomArows",
                                                                "FrostArrows", "WeaponThrow", "WaveBlast",
                                                                "InfernoWave", "SpikeField", "Berserk", "Pulsefire",
                                                                "Cyclone", "BlackHole", "QuickSlash", "MeteorShower",
                                                                "MeteorBlast", "Stomp"}

                                                            for _, v in pairs(game:GetService("Workspace").Ignore:GetChildren()) do
                                                                if v.Name ~= "Medkit" or table.find(Skill, v.Name) and
                                                                    v:IsA("BasePart") and v:IsA("MeshPart") and
                                                                    v:IsA("Part") then
                                                                    local SKK = table.find(Skill, v.Name)
                                                                    if SKK and EvilHumanoid.Health > 0 then
                                                                        v.CFrame = CFrame.new(monsterPos)
                                                                        v.Position = monsterPos
                                                                    end
                                                                end
                                                            end
                                                            wait(0.01)
                                                        end
                                                    end)

                                                    spawn(function()
                                                        while AutoMobs2 do
                                                            local Skill1 = {"Fireball", "Tsunami", "Freeze", "Heal", "HealBlast",
                                                                "Shockwave", "LaserBeam", "LightningStrike",
                                                                "Sandstorm", "Earthquake", "IceSpikes", "PolarVortex",
                                                                "TeamHeal", "RainbowBlast", "PumpkinBlast", "Random",
                                                                "Camouflage", "Tumble", "Flurry", "Boomerang",
                                                                "ShockArrows", "ShocFlameArrowskwave", "BoomArows",
                                                                "FrostArrows", "WeaponThrow", "WaveBlast",
                                                                "InfernoWave", "SpikeField", "Berserk", "Pulsefire",
                                                                "Cyclone", "BlackHole", "QuickSlash", "MeteorShower",
                                                                "MeteorBlast", "Stomp", "Bullet"}

                                                            for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
                                                                if table.find(Skill1, v.Name) then
                                                                    local SKK1 = table.find(Skill1, v.Name)
                                                                    if SKK1 and EvilHumanoid.Health > 0 then
                                                                        v.CFrame = CFrame.new(monsterPos)
                                                                        v.Position = monsterPos
                                                                    end
                                                                end
                                                            end
                                                            wait(0.01)
                                                        end
                                                    end)

                                                    spawn(function()
                                                        while AutoMobs2 do
                                                            for _, v in pairs(game:GetService("Workspace").Ignore:GetChildren()) do
                                                                if v:IsA("Model") then
                                                                    for _, c in pairs(v:GetChildren()) do
                                                                        if c:IsA("BasePart") or c:IsA("MeshPart") or
                                                                            c:IsA("Part") then
                                                                            local AllPart = c:IsA("BasePart") or
                                                                                                c:IsA("MeshPart") or
                                                                                                c:IsA("Part")
                                                                            if AllPart and EvilHumanoid.Health > 0 then
                                                                                c.CFrame = CFrame.new(monsterPos)
                                                                                c.Position = monsterPos
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                            wait(0.01)
                                                        end
                                                    end)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)

                local function PerformAttack()
                    pcall(function()
                        if AutoMobs2 then
                            ScriptFunction(Script)  -- Make sure these functions are defined or imported
                            ScriptFunction2(Script)  -- Make sure these functions are defined or imported
                        end
                    end)
                end
                game:GetService("RunService").Stepped:Connect(PerformAttack)

                spawn(function()
                    while AutoMobs2 do
                        allvis()  -- Make sure this function is defined or imported
                        wait(0.01)
                    end
                end)

                spawn(function()
                    while AutoMobs2 do
                        MoveOutFromBossRoom()  -- Make sure this function is defined or imported
                        wait(0.01)
                    end
                end)

                spawn(function()
                    while AutoMobs2 do
                        local finishPart = findFinishPartInWorkspace(game:GetService("Workspace"))  -- Make sure this function is defined or imported
                        if finishPart then
                            local character = game.Players.LocalPlayer.Character
                            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                            if humanoidRootPart then
                                local ChestPart = findNewChestInWorkspace(game:GetService("Workspace"))  -- Make sure this function is defined or imported
                                if ChestPart then
                                    humanoidRootPart.CFrame = ChestPart.CFrame
                                    wait(3)
                                    humanoidRootPart.CFrame = finishPart.CFrame
                                end
                            end
                        end
                        wait(0.1)
                    end
                end)
                wait(0.01)
            end
        end
    end)

-- Create a toggle variable
local autofarmEnabled = false

-- Function to handle the autofarm
local function autofarm()
    while autofarmEnabled do
        wait()
        getgenv().xspin = getgenv().Settings.Tween_Dodge_Offset
        getgenv().zspin = 0
        wait(getgenv().Settings.Tween_Dodge_speed)
        getgenv().xspin = 0
        getgenv().zspin = getgenv().Settings.Tween_Dodge_Offset
        wait(getgenv().Settings.Tween_Dodge_speed)
        getgenv().xspin = getgenv().Settings.Tween_Dodge_Offset - getgenv().Settings.Tween_Dodge_Offset * 2
        getgenv().zspin = 0
        wait(getgenv().Settings.Tween_Dodge_speed)
        getgenv().xspin = 0
        getgenv().zspin = getgenv().Settings.Tween_Dodge_Offset - getgenv().Settings.Tween_Dodge_Offset * 2
        wait(getgenv().Settings.Tween_Dodge_speed)
        getgenv().xspin = 0
        getgenv().zspin = 0
        wait(getgenv().Settings.Tween_Dodge_speed)
    end
end

-- Toggle function
local function toggleAutofarm()
    autofarmEnabled = not autofarmEnabled
end

-- Example of how to use the toggle in your UI (replace this with your actual UI code)
local ToggleAutofarmButton = Tabs.Main:AddToggle("Toggle Autofarm", {Title = "Auto Dodge", Default = false })

ToggleAutofarmButton:OnChanged(function(Value)
    toggleAutofarm()
end)

-- Start the autofarm when the script runs (you can adjust this based on your needs)
autofarm()

Tabs.Main:AddParagraph({
        Title = "Auto Collects",
        Content = ""
    })

local Toggle2 = Tabs.Main:AddToggle("AutoChest", {Title = "Auto Collect Chest", Default = false })

Toggle2:OnChanged(function(State)
    Settings.Treasure = State
    spawn(function()
        while wait() and Settings.Treasure do 
            pcall(function()
                for i, v in pairs(Workspace:GetDescendants()) do
                    if v.Name == "Chest"  then
                        firetouchinterest(Player.Character:FindFirstChild("HumanoidRootPart",true),v:FindFirstChild("Hitbox"),0)
                        firetouchinterest(Player.Character:FindFirstChild("HumanoidRootPart",true),v:FindFirstChild("Hitbox"),1)
                    end 
                end 
            end)
        end 
    end)
end)

local Toggle3 = Tabs.Main:AddToggle("AutoMedkits", {Title = "Auto Collect Medkits", Default = false })

Toggle3:OnChanged(function(State)
    Settings.Med = State
    spawn(function()
        while wait() and Settings.Med do
            pcall(function()
                for i, v in pairs(Workspace.Ignore:GetChildren()) do
                    if v.Name == "Medkit" and v:FindFirstChildWhichIsA("TouchTransmitter",true) then
                        if Player.Character.Humanoid.Health < Player.Character.Humanoid.MaxHealth then
                            firetouchinterest(Player.Character:FindFirstChild("HumanoidRootPart",true), v, 0)
                            firetouchinterest(Player.Character:FindFirstChild("HumanoidRootPart",true), v, 1)
                        end 
                    end 
                end
            end)
        end 
    end)
end)

Tabs.Main:AddParagraph({
        Title = "Tween Settings",
        Content = "Edit it, if u want"
    })

    local Input = Tabs.Main:AddInput("Input", {
        Title = "Tween Speed",
        Default = "50",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(speedtw)
speed = speedtw
        end
    })


    local Input = Tabs.Main:AddInput("Input", {
        Title = "Tween Position X",
        Default = "0",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(xtw)
x = xtw
        end
    })


    local Input = Tabs.Main:AddInput("Input", {
        Title = "Tween Position Y",
        Default = "0",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(ytw)
y = ytw
        end
    })

    local Input = Tabs.Main:AddInput("Input", {
        Title = "Tween Position Z",
        Default = "-2",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(ztw)
z = ztw
        end
    })
   
Tabs.Main:AddParagraph({
        Title = "Pumpkin Patch",
        Content = ""
    })

local Toggle1 = Tabs.Main:AddToggle("Autopumpkin", {Title = "Auto Kill Pumpkin Mobs", Default = false })

Toggle1:OnChanged(function(State)
    Settings.Re = State
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            if Settings.Re then
                ScriptFunction(Script)
                ScriptFunction2(Script, GetClosestt().PrimaryPart.Position)
                Noclip(Player.Character:WaitForChild("Humanoid"))
            end
        end)
    end)
    spawn(function()
        while wait() and Settings.Re do 
            pcall(function()
                ReplicatedStorage.Dungeon.Remotes.StartDungeon:FireServer()
                ReplicatedStorage.Dungeon.Remotes.StartDungeon:FireServer()
                ReplicatedStorage.Dungeon.Remotes.StartWaveDefense:FireServer()
                ReplicatedStorage.Shared.Remotes.Data.ClaimPrizes:FireServer()
                for i, v in pairs(Workspace:GetChildren()) do
                    if v:FindFirstChild("FinishRoom", true) and v:FindFirstChild("FinishRoom", true):FindFirstChild("Hitbox", true) then
                        firetouchinterest(Player.Character:FindFirstChild("HumanoidRootPart", true),v:FindFirstChild("FinishRoom",true):FindFirstChild("Hitbox",true):FindFirstChild("Part",true),0)
                        firetouchinterest(Player.Character:FindFirstChild("HumanoidRootPart", true),v:FindFirstChild("FinishRoom",true):FindFirstChild("Hitbox",true):FindFirstChild("Part",true),1)
                    end 
                end 
                if GetClosestt():FindFirstChildWhichIsA("Humanoid",true).Health ~= 0 then
                    Tween(Player.Character:FindFirstChild("HumanoidRootPart",true),GetClosestt().HumanoidRootPart,speed)
                end 
            end)
        end
    end)
    spawn(function()
        while wait() and Settings.Re do
            local player, cha, plr, hum = getPlayer()
            local dungeon, rooms, enemies, shrines = getDungeon()
            for _, v in pairs(rooms:GetDescendants()) do
                if v:FindFirstChildWhichIsA("TouchTransmitter", true) and v.Name == "Trigger" then
                    v.Primary.CFrame = plr.CFrame
                    wait()
                end
            end
            wait()
        end
    end)
end)

Tabs.Main:AddButton({
        Title = "Teleport To Boss",
        Description = "Manual",
        Callback = function()
local CFrameEnd = CFrame.new(-912.5400390625, 366.51214599609375, 1953.9599609375) -- Place your coords in here
local Time = speed -- Time in seconds
local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
tween:Play()
tween.Completed:Wait()
        end
    })

local _G = {}
_G.loops = false -- Set the initial value to false

local function RunTween()
    local CFrameEnd = CFrame.new(-912.5400390625, 366.51214599609375, 1953.9599609375) -- Place your coords in here
    local Time = speed -- Time in seconds (you can change this)
    local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
    tween:Play()
    tween.Completed:Wait()
end

local Toggle = Tabs.Main:AddToggle("AutoKillPumpkinBoss", {Title = "Auto Teleport to Boss", Default = false })

    Toggle:OnChanged(function(Tswx)
        _G.loops = Tswx -- Set the global variable based on the toggle state
        if _G.loops then
            while _G.loops do
                RunTween()
                wait(timerx)
                print("Re-executed")
            end
        end
    end)

local Input = Tabs.Main:AddInput("Input", {
        Title = "Afk Teleport Time",
        Default = "430",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Xdsr)
timerx = Xdsr
        end
    })

local Tabs = {
    Main = Window:AddTab({ Title = "Hitbox Settings", Icon = "" }),
}

Tabs.Main:AddParagraph({
        Title = "Hitbox Toggle",
        Content = "This is Fixed Hitbox V2"
    })

local RunService = game:GetService("RunService")

-- Default hitbox values
local xhx, yhx, zhx, txx = 1, 1, 1, 0.5
local hitboxTest = false

-- Function to enable hitbox
local function enableHitbox(monsterRootPart)
    if monsterRootPart.Size ~= Vector3.new(xhx, yhx, zhx) then
        monsterRootPart.Size = Vector3.new(xhx, yhx, zhx)
        monsterRootPart.Transparency = txx
    end
end

-- Function to disable hitbox
local function disableHitbox(monsterRootPart)
    if monsterRootPart.Size ~= Vector3.new(5, 5, 5) then
        monsterRootPart.Size = Vector3.new(5, 5, 5)
        monsterRootPart.Transparency = 1
    end
end

-- Function to toggle hitbox state
local function toggleHitboxState()
    local dungeon, rooms, enemies, shrines = getDungeon()

    for _, monster in ipairs(enemies:GetChildren()) do
        if monster:FindFirstChild("EvilHumanoid") and monster:FindFirstChild("HumanoidRootPart") and
           monster.EvilHumanoid.Health > 0 then
            local monsterRootPart = monster.HumanoidRootPart

            if hitboxTest then
                enableHitbox(monsterRootPart)
            else
                disableHitbox(monsterRootPart)
            end
        end
    end
end

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Hitbox Toggle", Default = false })

    Toggle:OnChanged(function(Kxe)
   hitboxTest = Kxe
    end)

RunService.Heartbeat:Connect(function()
    toggleHitboxState(hitboxTest)
end)

local InputX = Tabs.Main:AddInput("InputX", {
        Title = "Hitbox Size X",
        Default = "1",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(jxk)
        xhx = tonumber(jxk) or 5
        end
      })

local InputY = Tabs.Main:AddInput("InputY", {
        Title = "Hitbox Size Y",
        Default = "1",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(gxk)
        yhx = tonumber(gxk) or 5
        end
      })
      
local InputZ = Tabs.Main:AddInput("InputZ", {
        Title = "Hitbox Size Z",
        Default = "1",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(rxk)
        zhx = tonumber(rxk) or 5
        end
     })

local InputTransparency = Tabs.Main:AddInput("InputTransparency", {
        Title = "Hitbox Transparency",
        Default = "0.5",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(xxk)
        txx = tonumber(xxk) or 0.5
        end
     })
     

Tabs.Main:AddParagraph({
        Title = "Hitbox Weapon Expander",
        Content = ""
    })

local isToggleEnabled = false
local normalHitboxSize = Vector3.new(10, 10, 10)
local wxhx, wyhx, wzhx = 10, 10, 10 -- Default size values
local wtxx = 0.5 -- Default transparency value
local translucentMaterial = BrickColor.new("Translucent")

local Toggle = Tabs.Main:AddToggle("HitboxWeapon", {Title = "Hitbox Weapon Toggle", Default = false })

    Toggle:OnChanged(function(Value)
isToggleEnabled = Value
        for i, v in pairs(game.Players.LocalPlayer.Character.FighterVisuals:GetDescendants()) do
            if v.Name == "Hitbox" then
                if isToggleEnabled then
                    -- Toggle is on, adjust hitbox size and transparency
                    v.Size = Vector3.new(wxhx, wyhx, wzhx)
                    v.BrickColor = translucentMaterial
                    v.Transparency = wtxx
                else
                    -- Toggle is off, revert hitbox size to normal and reset transparency
                    v.Size = normalHitboxSize
                    v.BrickColor = BrickColor.new("Bright red") -- Adjust the original color as needed
                    v.Transparency = 1 -- Reset transparency
                end
            end
        end
    end)


local Input = Tabs.Main:AddInput("Input", {
        Title = "Hitbox Size X",
        Default = "10",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
        wxhx = tonumber(Value) or wxhx
        end
    })

local Input = Tabs.Main:AddInput("Input", {
        Title = "Hitbox Size Y",
        Default = "10",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
        wyhx = tonumber(Value) or wyhx
        end
    })

local Input = Tabs.Main:AddInput("Input", {
        Title = "Hitbox Size Z",
        Default = "10",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
        wzhx = tonumber(Value) or wzhx
        end
    })
    
local Input = Tabs.Main:AddInput("Input", {
        Title = "Hitbox Transparency",
        Default = "0.5",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
        wtxx = math.clamp(tonumber(Value) or wtxx, 0, 1) -- Ensure the value is between 0 and 1
        end
    })

local Tabs = {
    Main = Window:AddTab({ Title = "Custom Visuals", Icon = "" }),
}

Tabs.Main:AddParagraph({
        Title = "Health (Visual) ",
        Content = ""
    })

local Input = Tabs.Main:AddInput("Input", {
        Title = "Min Health",
        Default = "100000",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Hmin)
game.Players.LocalPlayer.Character.Humanoid.Health = Hmin
        end
    })

local Input = Tabs.Main:AddInput("Input", {
        Title = "Max Health",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Hmax)
game.Players.LocalPlayer.Character.Humanoid.MaxHealth = Hmax
        end
    })

Tabs.Main:AddParagraph({
        Title = "Speed And Jump",
        Content = ""
    })

local Input = Tabs.Main:AddInput("Input", {
        Title = "WalkSpeed",
        Default = "16",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(WS)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WS
        end
    })
    
local Input = Tabs.Main:AddInput("Input", {
        Title = "Jump Height",
        Default = "50",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(JP)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = JP
        end
    })

Tabs.Main:AddButton({
        Title = "Legacy Graphic",
        Description = "",
        Callback = function()
local Lighting = game:FindService("Lighting")

setscriptable(Lighting, "Technology", true)
Lighting.Technology = Enum.Technology.Legacy

for _, v in next, workspace:GetDescendants() do
    if v:IsA("PointLight") or v:IsA("SpotLighting") or v:IsA("SurfaceLight") then
        local Light = v
        if not Light.Shadows then
            Light.Shadows = true
        end
    end
end
        end
    })

Tabs.Main:AddButton({
        Title = "Shadow Map Graphic",
        Description = "",
        Callback = function()
local Lighting = game:FindService("Lighting")

setscriptable(Lighting, "Technology", true)
Lighting.Technology = Enum.Technology.ShadowMap

for _, v in next, workspace:GetDescendants() do
    if v:IsA("PointLight") or v:IsA("SpotLighting") or v:IsA("SurfaceLight") then
        local Light = v
        if not Light.Shadows then
            Light.Shadows = true
        end
    end
end
        end
    })

Tabs.Main:AddButton({
        Title = "Future Graphic",
        Description = "",
        Callback = function()
local Lighting = game:FindService("Lighting")

setscriptable(Lighting, "Technology", true)
Lighting.Technology = Enum.Technology.Future

for _, v in next, workspace:GetDescendants() do
    if v:IsA("PointLight") or v:IsA("SpotLighting") or v:IsA("SurfaceLight") then
        local Light = v
        if not Light.Shadows then
            Light.Shadows = true
        end
    end
end
        end
    })

local Tabs = {
    Main = Window:AddTab({ Title = "Auto-Farm Settings", Icon = "settings" }),
}

Tabs.Main:AddParagraph({
        Title = "Toggles",
        Content = ""
    })

local Toggle = false  -- Default toggle state

local vu = game:GetService("VirtualUser")

local function ToggleAntiAfk()
    while true do
        if Toggle then
            vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        else
            wait(1)
        end
    end
end

local Toggle = Tabs.Main:AddToggle("AntiAfk", {Title = "Anti-AFK", Default = false })

    Toggle:OnChanged(function(State)
        Toggle = State
    end)

spawn(ToggleAntiAfk)

local function skipCutscene()
    local player, cha, plr, hum = getPlayer()
    local bossSpawn = player.PlayerScripts.Shared.Modules.Effects:FindFirstChild("BossSpawn") 
    if bossSpawn then
        bossSpawn:Destroy()
      end
 end

local Toggle = Tabs.Main:AddToggle("SkipCutscene", {Title = "Skip Cutscenes (Bug)", Default = false })

    Toggle:OnChanged(function(state)
       if state then
            skipCutscene()
        end
    end)

local InfiniteJumpEnabled = false

local Toggle = Tabs.Main:AddToggle("AirJump", {Title = "Air Jump", Default = false })

Toggle:OnChanged(function(State)
    InfiniteJumpEnabled = State
end)

local Player = game:GetService("Players").LocalPlayer
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        Player.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
    end
end)
  

local Toggle = Tabs.Main:AddToggle("Noclip", {Title = "Noclip", Default = false })

local NoClipx = false

local function Noclip()
    game:GetService('RunService').Stepped:Connect(function()
        if NoClipx then
            pcall(function()
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end)
        end
    end)
end

    Toggle:OnChanged(function(State)
NoClipx = State
    end)

Noclip()

Tabs.Main:AddParagraph({
        Title = "Auto-Farm Support",
        Content = ""
    })

Tabs.Main:AddButton({
        Title = "Fly Gui",
        Description = "Manual",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
        end
    })

local FLYING = false
local velocityHandlerName = "VelocityHandler"
local gyroHandlerName = "GyroHandler"
local mfly1, mfly2
local currentCharacter

local function getRoot(character)
    return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
end

local function unmobilefly(player)
    pcall(function()
        FLYING = false
        local character = player.Character
        if character then
            local root = getRoot(character)
            if root then
                local velocityHandler = root:FindFirstChild(velocityHandlerName)
                local gyroHandler = root:FindFirstChild(gyroHandlerName)

                if velocityHandler then
                    velocityHandler:Destroy()
                end

                if gyroHandler then
                    gyroHandler:Destroy()
                end

                local humanoid = character:FindFirstChildWhichIsA("Humanoid")
                if humanoid then
                    humanoid.PlatformStand = false
                end
            end
        end

        if mfly1 then
            mfly1:Disconnect()
        end

        if mfly2 then
            mfly2:Disconnect()
        end
    end)
end

local function mobilefly(player, vfly)
    unmobilefly(player)
    FLYING = true

    local character = player.Character
    local root = getRoot(character)

    if character and root then
        local camera = workspace.CurrentCamera
        local v3none = Vector3.new()
        local v3zero = Vector3.new(0, 0, 0)
        local v3inf = Vector3.new(9e9, 9e9, 9e9)

        local controlModule = require(player.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
        local bv = Instance.new("BodyVelocity")
        bv.Name = velocityHandlerName
        bv.Parent = root
        bv.MaxForce = v3zero
        bv.Velocity = v3zero

        local bg = Instance.new("BodyGyro")
        bg.Name = gyroHandlerName
        bg.Parent = root
        bg.MaxTorque = v3inf
        bg.P = 1000
        bg.D = 20

        mfly1 = player.CharacterAdded:Connect(function()
            unmobilefly(player)
            currentCharacter = player.Character
            mobilefly(player, vfly)
        end)

        mfly2 = RunService.RenderStepped:Connect(function()
            root = getRoot(player.Character)
            camera = workspace.CurrentCamera
            if player.Character:FindFirstChildWhichIsA("Humanoid") and root and root:FindFirstChild(velocityHandlerName) and root:FindFirstChild(gyroHandlerName) then
                local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")
                local VelocityHandler = root:FindFirstChild(velocityHandlerName)
                local GyroHandler = root:FindFirstChild(gyroHandlerName)

                if VelocityHandler and GyroHandler then
                    VelocityHandler.MaxForce = v3inf
                    GyroHandler.MaxTorque = v3inf

                    if not vfly and humanoid then
                        humanoid.PlatformStand = false
                    end

                    GyroHandler.CFrame = camera.CoordinateFrame
                    VelocityHandler.Velocity = v3none

                    local direction = controlModule:GetMoveVector()
                    if direction.X ~= 0 or direction.Z ~= 0 then
                        local moveVector = Vector3.new(direction.X, 0, direction.Z).unit
                        local rightVector = camera.CFrame.RightVector
                        local forwardVector = camera.CFrame.LookVector

                        local flyDirection = (rightVector * moveVector.X - forwardVector * moveVector.Z).unit

                        VelocityHandler.Velocity = flyDirection * (_G.flySpeed * 20)
                    end
                end
            end
        end)
    end
end

local function toggleFly(player, toggleValue)
    if toggleValue then
        mobilefly(player, true)
    else
        unmobilefly(player)
    end
end

-- Your loop structure
_G.loops = false

local function flyLoop()
    while wait(10) do
        if _G.loops then
            local player = game.Players.LocalPlayer
            if player and player.Character then
                mobilefly(player, true)
            end
        end
    end
end

local Toggle = Tabs.Main:AddToggle("MyToggle", { Title = "Fly Toggle", Default = false })

Toggle:OnChanged(function()
    local player = game.Players.LocalPlayer
    _G.loops = Toggle.Value
    toggleFly(player, Toggle.Value)
end)

_G.flySpeed = 20  -- Default fly speed

local FlySpeedInput = Tabs.Main:AddInput("FlySpeedInput", {
    Title = "Fly Speed (ignore about the error)",
    Default = tostring(_G.flySpeed),
    Placeholder = "Enter fly speed",
    Numeric = true,
    Finished = false,
    Callback = function(Value)
        _G.flySpeed = tonumber(Value) or 20
        toggleFly(player, Toggle.Value)
    end
})

-- Start the loop
spawn(flyLoop)

Tabs.Main:AddParagraph({
        Title = "Destroy Maps",
        Content = ""
    })

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Destroy Map", Default = false })

local toggleState = false -- Default state

local function destroyMap()
    for _, room in ipairs(workspace.Dungeon.Rooms:GetChildren()) do
        for _, child in ipairs(room:GetChildren()) do
            if child.Name == "Extra" or child.Name == "Extras" then
                workspace.Terrain:Clear()
                child:Destroy()
            end
        end
    end
end

    Toggle:OnChanged(function(Value)
toggleState = Value
        if toggleState then
            destroyMap()
        end
    end)
    
game:GetService("RunService").Heartbeat:Connect(function()
    if toggleState then
        destroyMap()
    end
end)

Tabs.Main:AddButton({
        Title = "Destroy Map (old)",
        Description = "",
        Callback = function()
_G.loopsMap1 = true
while wait(1) do
if _G.loopsMap1 == true then
    for _, value in pairs(workspace:GetDescendants()) do
        if value:IsA("Part") and value.Parent.Name ~= game.Players.LocalPlayer.Name then
            value.Transparency = 1
        end
    end
end
end
end
    })


Tabs.Main:AddButton({
        Title = "Destroy Map 2 (Old)",
        Description = "Make ur Item invisible",
        Callback = function()
_G.loopsMap2 = true
while wait(1) do
if _G.loopsMap2 == true then
    for _, value in pairs(workspace:GetDescendants()) do
        if value:IsA("BasePart") and value.Parent.Name ~= game.Players.LocalPlayer.Name then
            value.Transparency = 1
        end
    end
     -- Connected Script To remove MeshPart
    for _, value in pairs(workspace:GetDescendants()) do
        if value:IsA("MeshPart") and value.Parent.Name ~= game.Players.LocalPlayer.Name then
            value.Transparency = 1
        end
    end
end
end
        end
    })

local Tabs = {
    Main = Window:AddTab({ Title = "Auto-Dugeon", Icon = "" }),
}

-- Define toggle settings in _G
_G.Setting = {
    AutoSell = {
        Enabled = false,
        Common = false,
        Rare = false,
        Legendary = false,
        Mythical = false,
        Ultimate = false
    },
    AutoLeave = {
        WhenDied = {
            Enabled = false,
            Delay = 2
        },
        WhenInventoryFull = {
            Enabled = false,
            Delay = 2
        }
    }
}

Tabs.Main:AddParagraph({
        Title = "Pls Becareful u will lose ur items",
        Content = ""
    })

-- Function to auto-sell items based on rarity settings
function autoSell()
    if not _G.Setting.AutoSell.Enabled then
        return
    end

local itemToSell = {}
    for _, item in pairs(InventoryController.Inventory.Items) do
        local id = item.Data.ItemID
        local rarity = item.DatabaseInfo.Rarity

        if _G.Setting.AutoSell.Common and rarity == 'Common' then
            table.insert(itemToSell, id)
        end

        if _G.Setting.AutoSell.Rare and rarity == 'Rare' then
            table.insert(itemToSell, id)
        end

        if _G.Setting.AutoSell.Legendary and rarity == 'Legendary' then
            table.insert(itemToSell, id)
        end

        if _G.Setting.AutoSell.Mythical and rarity == 'Mythical' then
            table.insert(itemToSell, id)
        end

        if _G.Setting.AutoSell.Ultimate and rarity == 'Ultimate' then
            table.insert(itemToSell, id)
        end
    end

print('Selling Items:', table.unpack(itemToSell))
    -- Example: FireServer with the itemToSell table
    game:GetService("ReplicatedStorage").Lobby.Remotes.Sell:FireServer(itemToSell)
end

-- Example Toggle creation for auto-sell (Adjust according to your UI library)
function toggleCallback(toggleName, value)
    _G.Setting.AutoSell[toggleName] = value
    autoSell()  -- Call autoSell immediately when a toggle changes
end

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Auto Sell", Default = false })

    Toggle:OnChanged(function(Value)
        toggleCallback("Enabled", Value)
    end)
    
local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Sell Common", Default = false })

    Toggle:OnChanged(function(Value)
        toggleCallback("Common", Value)
    end)

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Sell Rare", Default = false })

    Toggle:OnChanged(function(Value)
        toggleCallback("Rare", Value)
    end)

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Sell Legendary", Default = false })

    Toggle:OnChanged(function(Value)
        toggleCallback("Legendary", Value)
    end)

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Sell Mythical", Default = false })

    Toggle:OnChanged(function(Value)
        toggleCallback("Mythical", Value)
    end)

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Sell Ultimate", Default = false })

    Toggle:OnChanged(function(Value)
        toggleCallback("Ultimate", Value)
    end)

Tabs.Main:AddParagraph({
        Title = "Auto-Leave",
        Content = ""
    })

local autoLeaveEnabled = false
local rightSideFrame = mainFrame:WaitForChild("Right")

local function leaveWhenInventoryFull(v)
    if autoLeaveEnabled and v == "Visible" then
        print('Leaving: InventoryFull')
        wait(_G.Setting.AutoLeave.WhenInventoryFull.Delay)
        game.ReplicatedStorage.Dungeon.Remotes.BackToLobby:FireServer()
    end
end

local ToggleLeave = Tabs.Main:AddToggle("AutoLeaveToggle", { Title = "Auto Leave When Inventory Full", Default = false })

ToggleLeave:OnChanged(function(Value)
    autoLeaveEnabled = Value
    _G.Setting.AutoLeave.WhenInventoryFull.Enabled = Value
end)

if rightSideFrame.Backpack:FindFirstChild("Capacity") then
    rightSideFrame.Backpack.Capacity.Changed:Connect(leaveWhenInventoryFull)
else
    print("rightSideFrame not found. Auto leave when inventory full is disabled.")
end

local autoLeaveWhenDiedEnabled = false
local mainFrame = game:GetService("Players")[cha.Name].PlayerGui:WaitForChild("MainGui"):WaitForChild("MainFrame")

local function leaveWhenDied(v)
    if autoLeaveWhenDiedEnabled and v then
        print('Leaving: Died')
        wait(_G.Setting.AutoLeave.WhenDied.Delay)
        game.ReplicatedStorage.Dungeon.Remotes.BackToLobby:FireServer()
    end
end

local ToggleLeaveWhenDied = Tabs.Main:AddToggle("AutoLeaveWhenDiedToggle", {Title = "Auto Leave When Died", Default = false })

ToggleLeaveWhenDied:OnChanged(function(Value)
    autoLeaveWhenDiedEnabled = Value
    _G.Setting.AutoLeave.WhenDied.Enabled = Value
end)

if mainFrame and mainFrame.Bottom and mainFrame.Bottom.DeadCard then
    mainFrame.Bottom.DeadCard.Changed:Connect(leaveWhenDied)
else
    print("MainFrame or DeadCard not found. Auto leave when died is disabled.")
end

Tabs.Main:AddParagraph({
        Title = "Auto buy",
        Content = "make sure u encounter the mystery shop!"
    })

Tabs.Main:AddParagraph({
        Title = "Coral Kingdom",
        Content = ""
    })

local BuyitemCK = false
local selectedAmountCK = 1
local selectedShopCK = "Aquatic Chest"

local shopDataCK = {
    ["Aquatic Chest"] = {
        [1] = "AquaticArsenal",
        [2] = "0",
        [3] = selectedAmountCK
    },
    ["Bubble Effect"] = {
        [1] = "AquaticArsenal",
        [2] = "1",
        [3] = selectedAmountCK
    },
    ["Speed Potion"] = {
        [1] = "AquaticArsenal",
        [2] = "2",
        [3] = selectedAmountCK
    },
    ["Ability Potion"] = {
        [1] = "AquaticArsenal",
        [2] = "3",
        [3] = selectedAmountCK
    }
}

local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Aquatic Shop",
        Values = {"Aquatic Chest", "Bubble Effect", "Speed Potion", "Ability Potion"},
        Multi = false,
        Default = selectedShopCK,
    })
    
Dropdown:OnChanged(function(value)
        selectedShopCK = value
    end)

local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Amount",
        Values = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "15", "20", "25"},
        Multi = false,
        Default = tostring(selectedAmountCK),
    })

Dropdown:OnChanged(function(value)
        selectedAmountCK = tonumber(value) or 1
    end)

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Buy item", Default = false })

    Toggle:OnChanged(function(value)
BuyitemCK = value
        if BuyitemCK then
            local args = shopDataCK[selectedShopCK]
            args[3] = selectedAmountCK
            game:GetService("ReplicatedStorage").Lobby.Remotes.ShopPurchase:FireServer(args[1], args[2], args[3])
            wait(0.1)
            game:GetService("ReplicatedStorage").Shared.Remotes.Data.ClaimPrizes:FireServer()
        end
    end)

Tabs.Main:AddParagraph({
        Title = "Daring Dojo",
        Content = ""
    })

local BuyitemDD = false
local selectedAmountDD = 1
local selectedShopDD = "Daring Chest"

local shopDataDD = {
    ["Daring Chest"] = {
        [1] = "SilentStash",
        [2] = "0",
        [3] = selectedAmountDD
    },
    ["Stealth Effect"] = {
        [1] = "SilentStash",
        [2] = "1",
        [3] = selectedAmountDD
    },
    ["Jump Potion"] = {
        [1] = "SilentStash",
        [2] = "2",
        [3] = selectedAmountDD
    }
}

local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Silent Shop",
        Values = {"Daring Chest", "Stealth Effect", "Jump Potion"},
        Multi = false,
        Default = selectedShopDD,
    })
    
Dropdown:OnChanged(function(value)
        selectedShopDD = value
    end)

local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Amount",
        Values = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "15", "20", "25"},
        Multi = false,
        Default = tostring(selectedAmountDD),
    })

Dropdown:OnChanged(function(value)
        selectedAmountDD = tonumber(value) or 1
    end)

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Buy item", Default = false })

    Toggle:OnChanged(function(value)
BuyitemDD = value
        if BuyitemDD then
            local args = shopDataDD[selectedShopDD]
            args[3] = selectedAmountDD
            game:GetService("ReplicatedStorage").Lobby.Remotes.ShopPurchase:FireServer(args[1], args[2], args[3])
            wait(0.1)
            game:GetService("ReplicatedStorage").Shared.Remotes.Data.ClaimPrizes:FireServer()
        end
    end)

Tabs.Main:AddParagraph({
        Title = "Fiery Fortress",
        Content = ""
    })

local BuyitemFF = false
local selectedAmountFF = 1
local selectedShopFF = "Molten Chest"

local shopDataFF = {
    ["Molten Chest"] = {
        [1] = "MoltenMarket",
        [2] = "0",
        [3] = selectedAmountFF
    },
    ["Embers Effect"] = {
        [1] = "MoltenMarket",
        [2] = "1",
        [3] = selectedAmountFF
    },
    ["Warrior Potion"] = {
        [1] = "MoltenMarket",
        [2] = "2",
        [3] = selectedAmountFF
    },
    ["Wizard Potion"] = {
        [1] = "MoltenMarket",
        [2] = "3",
        [3] = selectedAmountFF
    },
    ["Archer Potion"] = {
        [1] = "MoltenMarket",
        [2] = "4",
        [3] = selectedAmountFF
    }
}

local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Molten Market",
        Values = {"Molten Chest", "Embers Effect", "Warrior Potion", "Wizard Potion", "Archer Potion"},
        Multi = false,
        Default = selectedShopFF,
    })
    
Dropdown:OnChanged(function(value)
        selectedShopFF = value
    end)

local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Amount",
        Values = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "15", "20", "25"},
        Multi = false,
        Default = tostring(selectedAmountFF),
    })

Dropdown:OnChanged(function(value)
        selectedAmountFF = tonumber(value) or 1
    end)

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Buy item", Default = false })

    Toggle:OnChanged(function(value)
BuyitemFF = value
        if BuyitemFF then
            local args = shopDataFF[selectedShopFF]
            args[3] = selectedAmountFF
            game:GetService("ReplicatedStorage").Lobby.Remotes.ShopPurchase:FireServer(args[1], args[2], args[3])
            wait(0.1)
            game:GetService("ReplicatedStorage").Shared.Remotes.Data.ClaimPrizes:FireServer()
        end
    end)
    
local Tabs = {
    Main = Window:AddTab({ Title = "Teleport", Icon = "" }),
}


Tabs.Main:AddButton({
        Title = "Teleport Dungeon Spawnpoint",
        Description = "",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 25, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        end
    })

Tabs.Main:AddButton({
        Title = "Teleport Lobby Spawnpoint",
        Description = "",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(597.041, 307.598, 452.364)
        end
    })

Tabs.Main:AddButton({
        Title = "Teleport All Elemental Sword",
        Description = "Newbie User Only",
        Callback = function()
-- Lava Sword
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(592.094116, 271.870483, 411.405548, 0.999581695, -9.72332082e-09, 0.0289210249, 1.06783506e-08, 1, -3.28675362e-08, -0.0289210249, 3.3162614e-08, 0.999581695)

wait(1)

-- upper sword
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(620.374, 629.185, 694.411)

wait (1)

-- ice sword
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(490.971, 237.207, 616.699)

wait(1)

-- crystal sword
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(429.602, 289.115, 549.409)

wait(1)

-- black sword
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(762.415, 229.793, 653.022)

wait(1)

-- green sword
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(838.448, 217.391, 435.103)

wait(1)

-- Main Spawn Point lobby
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(597.041, 307.598, 452.364)
warn("All sword already get")
        end
    })

Tabs.Main:AddButton({
        Title = "Daily Rewards",
        Description = "",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(558.265, 307.889, 415.435)
        end
    })

Tabs.Main:AddButton({
        Title = "Spin Wheel",
        Description = "",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(523.958, 313.488, 621.031)
        end
    })

Tabs.Main:AddButton({
        Title = "Quest Rewards",
        Description = "",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(550.858, 307.592, 480.063)
        end
    })

Tabs.Main:AddButton({
        Title = "Daily Quest",
        Description = "",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(547.629, 312.991, 577.481)
        end
    })

Tabs.Main:AddButton({
        Title = "Weapon Shop",
        Description = "",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(561.511, 307.592, 636.999)
        end
    })

Tabs.Main:AddButton({
        Title = "Event Shop",
        Description = "",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(620.034, 367.623, 785.656)
        end
    })

Tabs.Main:AddButton({
        Title = "Food Cart",
        Description = "",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(717.144, 284.795, 667.71)
        end
    })

Tabs.Main:AddButton({
        Title = "Heroic Shop",
        Description = "",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(910.215, 284.906, 693.791)
        end
    })

Tabs.Main:AddButton({
        Title = "The Emporium",
        Description = "",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(758.942, 284.998, 606.16)
        end
    })

Tabs.Main:AddButton({
        Title = "Magic Merchant Shop",
        Description = "",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(550.498, 307.592, 507.009)
        end
    })

Tabs.Main:AddButton({
        Title = "Bank",
        Description = "",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(640.346, 307.598, 453.465)
        end
    })

Tabs.Main:AddButton({
        Title = "Blacksmith",
        Description = "",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(660.68, 307.592, 497.431)
        end
    })


local Tabs = {
    Main = Window:AddTab({ Title = "Anti-Lags", Icon = "" }),
}

Tabs.Main:AddButton({
        Title = "Auto Clear Console (Loop)",
        Description = "Auto Clear Error of Console Less Lag",
        Callback = function()
_G.loopsClear = true
while wait(1) do
if _G.loopsClear == true then
game:GetService("GuiService"):ClearError()
end
end
        end
    })

Tabs.Main:AddParagraph({
        Title = "Fps Cap",
        Content = ""
    })
    
    
local Input = Tabs.Main:AddInput("Input", {
        Title = "Fps Cap",
        Default = "500",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(F)
setfpscap(F)
        end
    })


Tabs.Main:AddParagraph({
        Title = "Fps Booster and Anti-Lags",
        Content = ""
    })

Tabs.Main:AddButton({
        Title = "Anti-Lag 1",
        Description = "",
        Callback = function()
_G.loops = true
while wait(1) do
if _G.loops == true then
for _, v in pairs(Workspace:GetDescendants()) do
    if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
        v.Material = Enum.Material.SmoothPlastic
        if v:IsA("Texture") then
            v:Destroy()
        end
    end
end
end
end
        end
    })

Tabs.Main:AddButton({
        Title = "Anti-Lag 2",
        Description = "",
        Callback = function()
_G.Settings = {
    Players = {
        ["Ignore Me"] = true, -- Ignore your Character
        ["Ignore Others"] = true -- Ignore other Characters
    },
    Meshes = {
        Destroy = false, -- Destroy Meshes
        LowDetail = true -- Low detail meshes (NOT SURE IT DOES ANYTHING)
    },
    Images = {
        Invisible = true, -- Invisible Images
        LowDetail = false, -- Low detail images (NOT SURE IT DOES ANYTHING)
        Destroy = false, -- Destroy Images
    },
    ["No Particles"] = true, -- Disables all ParticleEmitter, Trail, Smoke, Fire and Sparkles
    ["No Camera Effects"] = true, -- Disables all PostEffect's (Camera/Lighting Effects)
    ["No Explosions"] = true, -- Makes Explosion's invisible
    ["No Clothes"] = true, -- Removes Clothing from the game
    ["Low Water Graphics"] = true, -- Removes Water Quality
    ["No Shadows"] = true, -- Remove Shadows
    ["Low Rendering"] = true, -- Lower Rendering
    ["Low Quality Parts"] = true -- Lower quality parts
}
loadstring(game:HttpGet(('https://raw.githubusercontent.com/Unknownproootest/UniversalfpsboostXunlocker/main/FpsBoost'),true))()
        end
    })

Tabs.Main:AddButton({
        Title = "Anti Lag 3",
        Description = "",
        Callback = function()
local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i,v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then
        v.Material = "Plastic"
v.Reflectance = 0
elseif v:IsA("Decal") and decalsyeeted then 
v.Transparency = 1
elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then 
v.Lifetime = NumberRange.new(0)
    end
end
        end
    })

Tabs.Main:AddButton({
        Title = "Anti Lag 4",
        Description = "",
        Callback = function()
local decalsyeeted = true 
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
sethiddenproperty(l,"Technology",2)
sethiddenproperty(t,"Decoration",false)
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = 0
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(w:GetDescendants()) do
    if v:IsA("BasePart") and not v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif (v:IsA("Decal") or v:IsA("Texture")) and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") and decalsyeeted then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    elseif v:IsA("SpecialMesh") and decalsyeeted  then
        v.TextureId=0
    elseif v:IsA("ShirtGraphic") and decalsyeeted then
        v.Graphic=0
    elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
        v[v.ClassName.."Template"]=0
    end
end
for i = 1,#l:GetChildren() do
    e=l:GetChildren()[i]
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
w.DescendantAdded:Connect(function(v)
    wait()--prevent errors and shit
   if v:IsA("BasePart") and not v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") and decalsyeeted then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    elseif v:IsA("SpecialMesh") and decalsyeeted then
        v.TextureId=0
    elseif v:IsA("ShirtGraphic") and decalsyeeted then
        v.ShirtGraphic=0
    elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
        v[v.ClassName.."Template"]=0
    end
end)
        end
    })

Tabs.Main:AddButton({
        Title = "White Screen (ON)",
        Description = "",
        Callback = function()
game:GetService("RunService"):Set3dRenderingEnabled(false)
        end
    })

Tabs.Main:AddButton({
        Title = "White Screen (OFF)",
        Description = "",
        Callback = function()
game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    })

local Tabs = {
    Main = Window:AddTab({ Title = "Update Logs", Icon = "" }),
}

Tabs.Main:AddParagraph({
        Title = "Unknown TQ Hub V3",
        Content = ""
    })

Tabs.Main:AddParagraph({
        Title = "Added Quick Optimizer",
        Content = ""
    })

Tabs.Main:AddParagraph({
        Title = "Added Skip Cutscene",
        Content = ""
    })

Tabs.Main:AddParagraph({
        Title = "Added Loader print on Console",
        Content = ""
    })

Tabs.Main:AddParagraph({
        Title = "Added Tween_Lock",
        Content = "It Changed to Fly"
    })

Tabs.Main:AddParagraph({
        Title = "Added 2 Auto-Leave",
        Content = ""
    })

Tabs.Main:AddParagraph({
        Title = "Changed UI Library",
        Content = ""
    })

Tabs.Main:AddParagraph({
        Title = "Added Something in Visual",
        Content = ""
    })

Tabs.Main:AddParagraph({
        Title = "Changed Low Device Fast Farming",
        Content = ""
    })

Tabs.Main:AddParagraph({
        Title = "Small Update: Fixed Low device Fast Farming Not Killing A Monster",
        Content = ""
    })

Tabs.Main:AddParagraph({
        Title = "Status Update: 🟢",
        Content = ""
    })
    
print("Changed SimulationRaduis")

game:GetService("RunService").RenderStepped:Connect(function()
    sethiddenproperty(game:GetService("Players").LocalPlayer, 'SimulationRadius', math.huge)
    sethiddenproperty(game:GetService("Players").LocalPlayer, 'MaximumSimulationRadius', math.huge)
end)

-- Save Manager
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Save Folder
InterfaceManager:SetFolder("UnknownTQHub")
SaveManager:SetFolder("UnknownTQHub/TreasureQuest")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

-- Auto Load Configuration
SaveManager:LoadAutoloadConfig()
