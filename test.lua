local __DARKLUA_BUNDLE_MODULES __DARKLUA_BUNDLE_MODULES={cache={}, load=function(m)if not __DARKLUA_BUNDLE_MODULES.cache[m]then __DARKLUA_BUNDLE_MODULES.cache[m]={c=__DARKLUA_BUNDLE_MODULES[m]()}end return __DARKLUA_BUNDLE_MODULES.cache[m].c end}do function __DARKLUA_BUNDLE_MODULES.a()_G.unoptimizedDuringDefer = {} 
local Optimization = {}
function Optimization.simplifyObject(obj)
    local simpleTextureId = "rbxassetid://0"

    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam")
    or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles")
    or obj:IsA("Explosion") or obj:IsA("Light") or obj:IsA("PointLight")
    or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
        pcall(function() obj:Destroy() end)

    elseif obj:IsA("Decal") or obj:IsA("Texture") then
        pcall(function()
            obj.Texture = simpleTextureId
            obj.Transparency = 1
        end)

    elseif obj:IsA("SurfaceAppearance") then
        pcall(function() obj:Destroy() end)

    elseif obj:IsA("MeshPart") then
        pcall(function()
            obj.TextureID = ""
            obj.Material = Enum.Material.Plastic
            obj.Transparency = 1
        end)

    elseif obj:IsA("BasePart") then
        pcall(function()
            obj.Material = Enum.Material.Plastic
            obj.Transparency = 1
            obj.Reflectance = 0
        end)
    end

end

function Optimization.optimization()
    local LocalPlayer = game.Players.LocalPlayer
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Network = ReplicatedStorage:WaitForChild("Network")
    local prefix = "PlayerScripts."
    local Module = {}
    local toggleSettings = {
        ["PotatoMode"] = 1,
        ["PetSFX"] = 2,
        ["Notifications"] = 2,
        ["ClanNotifications"] = 2,
        ["MountingTitanicsEnabled"] = 2,
        ["PetsTargetClickedBreakables"] = 2,
        ["ShowBoosts"] = 1,
        ["GlobalNameDisplay"] = 2,
        ["ShowNextArea"] = 2,
        ["ShowClanTags"] = 2,
        ["ShowGuildChat"] = 2,
        ["InventoryPetPlaceholders"] = 2,
        ["PlayerProfiles"] = 2,
        ["ItemNotifications"] = 2,
        ["ReduceOrbs"] = 2,
        ["NotificationsSFX"] = 3,
        ["Trading"] = 3
    }
    local sliderSettings = {
        ["SFX"] = 0,
        ["Music"] = 0
    }
    local rawList = [[
    Scripts.Game.Misc.World Animations.PlanetAnimations
    Scripts.Game.Trading Plaza Portal
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.Subtitle
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame
    Scripts.Game.Music
    Scripts.Game.Pets.Modifier VFX
    PlayerModule.CameraModule.OrbitalCamera
    Scripts.Game.Misc.Fantasy Transition TEMP
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui
    Scripts.Core.Voice Chat Trading Server
    Scripts.Game.Misc.World Animations.Balloons - Castle
    Scripts.GUIs.Boosts Panel V3.Types
    Scripts.GUIs.Prison Key Surge Sign
    Scripts.Game.Misc.World Animations
    Scripts.Game.Breakables.Damage Statistics Manager
    Scripts.Game.Misc.World Animations.Windmill Animation
    PlayerModule.ControlModule.DynamicThumbstick
    Scripts.GUIs.Boosts Panel V3.Modules.__BLUEPRINT
    Scripts.Game.Breakables
    PlayerModule.CameraModule.VRBaseCamera
    PlayerModule.ControlModule.TouchJump
    PlayerModule.CameraModule.VehicleCamera.VehicleCameraCore
    PlayerModule.ControlModule
    PlayerModule.CameraModule.BaseCamera
    Scripts.Game.Castle Door
    Scripts.Game.Misc.World Animations.Spike Animation
    Scripts.Game.My Guild Banner
    Scripts.GUIs.Boosts Panel V3.Modules.Capes
    Scripts.Game.Misc.World Animations.Door Glow Animation
    Scripts.Game.Physical Eggs Frontend
    Scripts.Core.Chat Nametags.Filters
    Scripts.Core.Idle Tracking
    PlayerModule.CommonUtils.ConnectionUtil
    Scripts.Game.Egg Opening Frontend
    Scripts.Game.Misc.Huge Event Billboard
    Scripts.Game.Upgrades Frontend
    PlayerModule.CameraModule.VehicleCamera.VehicleCameraConfig
    PlayerModule.CameraModule.VRVehicleCamera
    PlayerModule.ControlModule.TouchThumbstick
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.ProgressBar
    Scripts.Test.Test Riding
    Scripts.GUIs.Instances.BasketballCalendar
    Scripts.GUIs.Boosts Panel V3.Modules.Friends
    Scripts.Game.Time Trials
    Scripts.Game.Tower Tycoon Raffle Boards
    Scripts.Test.UI Resize Finder
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.Completed.UITextSizeConstraint
    PlayerModule.CameraModule.Invisicam
    Scripts.GUIs.World GUIs
    Scripts.Game.Machines.Item Index
    Scripts.Core.Custom Chat Filtering
    Scripts.GUIs.Boosts Panel V3
    PlayerModule.CameraModule.BaseOcclusion
    Scripts.Game.Misc.World Animations.Rainbow Road Animations
    Scripts.GUIs.Tower Players Billboard Gui
    PlayerModule.CameraModule.CameraToggleStateController
    Scripts.GUIs.Boosts Panel V3.Modules.Gamepasses
    Scripts.GUIs.Hype Eggs
    Scripts.GUIs.Boosts Panel V3.Modules.TowerXpDouble
    Scripts.Game.Breakables.Breakables Frontend
    Scripts.GUIs.Free Gifts
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.Subtitle.UIStroke
    PlayerModule.ControlModule.VehicleController
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.Title.UITextSizeConstraint
    Scripts.GUIs.Random Active Drops
    Scripts.Game.Misc.Egg Promo.Egg Billboard Pets Cards
    Scripts.Game.Misc.World Animations.Enchanted Lights Animation
    Scripts.Game.Misc.Prison World.Prison Doors
    Scripts.Game.Clan Castle Door
    Scripts.Game.Misc.World Animations.VIP Water Chests
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.ProgressBar.Bar.UIGradient
    Scripts.Game.Misc.Egg Promo
    Scripts.GUIs.Boosts Panel V3.Modules.Subscriptions
    Scripts.Game.Misc.World Animations.Castle Propeller Cat
    Scripts.Test.Test Message
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.ProgressBar.UICorner
    PlayerModule.CommonUtils.FlagUtil
    PlayerModule.CommonUtils.CameraWrapper
    PlayerModule.ControlModule.Gamepad
    Scripts.Core.Product Notifications
    Scripts.Game.Misc.World Animations.Toilet Cat Outhouse
    Scripts.Game.Items
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.ProgressBar.Bar.UIStroke
    Scripts.GUIs.Currency 2
    ParallelPetExport
    PlayerModule.ControlModule.BaseCharacterController
    Scripts.Game.Pets
    Parallel Pet Actors
    Scripts.GUIs.Trade Notification
    Scripts.Game.Machine Animations.Upgrade Presents Anim
    Scripts.GUIs.Teleports Map OLD
    Scripts.GUIs.Boosts Panel V3.Modules.FishingEvent
    PlayerModule.CameraModule.MouseLockController
    Scripts.Game.Water Detector
    PlayerModule.CameraModule.ClassicCamera
    Parallel Pet Actors.ParallelPet
    Scripts.Test.Memory Report
    Scripts.Test.Show Instance Counts
    Scripts.Test.Test Notifications
    Scripts.Game.Gamepasses
    Scripts.Test.Test Raid UI
    Scripts.Test.Print Damage Factor
    Scripts.Test.Test Exclamation
    Scripts.Test.Find Skinned Meshes
    Scripts.Game.Trading Plaza
    Scripts.Test.Test Rain
    Scripts.Test.Test Fireworks
    Scripts.Game.Enchants
    Scripts.Test.Test Confetti
    Scripts.Test.Disable Development UI On Boot
    Scripts.Test
    Scripts.Misc
    Scripts.Game.Farming.Farming Gift Notification
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.ProgressBar.UIStroke
    Scripts.Game.Pets.Modifier VFX.📖 README
    Scripts.Game.Misc.Prison World
    Scripts.GUIs.Boosts Panel V3.Modules.Rebirths
    Scripts.Test.MessageTesting
    Scripts.Game.Gates Frontend
    Scripts.Game.Machines.Tower AFK
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.Completed.UIStroke
    PlayerModule.CameraModule.CameraInput
    Scripts.Game.Misc.Rebirth VFX
    PlayerModule
    Scripts.Game.Events.Basketball
    Scripts.Game.Farming
    PlayerModule.CameraModule
    Scripts.Game.Misc.World Animations.PlanetAnimationsOLD
    Scripts.Game.Misc.World Animations.Disco Bulbs AnimationOLD
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.ProgressBar.Bar
    Scripts.GUIs.Boosts Panel V3.Modules.SaturdayBuff
    Scripts.Game.Misc.World Animations.Balloons
    Scripts.Test.Disable Player List Menu
    Scripts.Game.Misc.World Animations.Gate Countdown
    Scripts.GUIs.Instances
    Scripts.Game.Machines.Doodle Upgrade Machine
    Scripts.GUIs.Boosts Panel V3.Modules.Effects
    Scripts.GUIs.Boosts Panel V3.Modules.Boost Exchange
    Scripts.Game.Egg Opening Frontend.EggPositions
    Scripts.Game.Misc.World Animations.Lighthouse Animation
    Scripts.Game.Doodle World.Doodle Jar
    Scripts.GUIs.PETS GO Countdown
    Scripts.Game.Doodle World
    Scripts.Game.Raffles
    PlayerModule.ControlModule.PathDisplay
    Scripts.Game.Misc.Egg Promo.Egg Pets Farming
    Scripts.Game.Misc.Egg Promo.Monday Pets Fantasy
    Scripts.Game.Misc.World Animations.Window Glow Animation
    Scripts.Game.Random Events
    Scripts.Game.Misc.Notification Prompt
    PlayerModule.CameraModule.Poppercam
    Scripts.GUIs.Boosts Panel V3.BasketballEvent
    Scripts.Game.Physical Eggs Frontend.LuckModifiers
    Scripts.GUIs.Boosts Panel V3.Modules.Fruit
    PlayerModule.ControlModule.ClickToMoveDisplay
    Scripts.Game.Top Guild Banner
    PlayerModule.CameraModule.CameraUI
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.Completed
    Scripts.Core.Chat Nametags
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.UIListLayout
    PlayerModule.CameraModule.VRCamera
    PlayerModule.CameraModule.TransparencyController
    Scripts.GUIs.Boosts Panel V3.Modules.FactoryPoints
    Scripts.Game.Events.Hacker.UFO Invasion
    Scripts.Game.Events.Hacker
    Scripts.Game.Events.Obby.Summer Event Notification
    Scripts.Game.Events
    PlayerModule.CommonUtils
    PlayerModule.CameraModule.VehicleCamera
    PlayerModule.CameraModule.LegacyCamera
    Scripts.Game.Ultimates
    Scripts.Game.Trading Plaza.Main Game Portal
    Scripts.Game.Mastery (Square Version)
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.Title.UIStroke
    Scripts.Game.ForeverPacks
    Scripts.GUIs.Ranks.Sound
    Scripts.Game.Worlds.Olympus World
    Scripts.Game.Race Rewards
    Scripts.Game.Breakable VFX (Enchants, etc.)
    Scripts.Game.Machine Animations.Pickaxe Machine Anim
    Scripts.Game.Machine Animations
    Scripts.Game.Instancing
    Scripts.Game.Worlds.Obby World
    Scripts.GUIs
    Scripts.Game.Misc.Potato Mode Setting
    Scripts.GUIs.Boosts Panel V3.Modules.Potions
    Scripts.GUIs.Egg Deal
    Scripts.Game.Machines
    Scripts.Game.Worlds
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.ProgressBar.Bar.UICorner
    PlayerModule.CommonUtils.CharacterUtil
    Scripts.Game.Machines.Fantasy Shard Machine
    Scripts.GUIs.Ranks
    Scripts.Game.Misc.Favorite Prompt
    Scripts.GUIs.New Player Tasks
    Scripts.Game.Misc.Instances
    Scripts.Game.Events.Farming
    Scripts.Game
    Scripts.GUIs.Zone Progress Bar
    Scripts.Game.Misc
    Scripts.Core.Controller
    Scripts.Game.Guild Chat (Hide Locally)
    PlayerModule.ControlModule.VRNavigation
    Scripts.Game.Tower Tycoon Raffle Boards.TicketSelector
    Scripts.GUIs.Chat Filters
    Scripts.Game.Scary Pet
    Scripts
    Scripts.Game.ForeverPacks.Lucky Pack
    Scripts.Game.Machines.Vending Machines
    Scripts.Game.Misc.World Animations.Preston Shop
    PlayerModule.ControlModule.ClickToMoveController
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.Subtitle.UITextSizeConstraint
    PlayerModule.CameraModule.ZoomController
    Scripts.Game.Misc.World Animations.Door Cats NPC
    Scripts.Core.Disable Chat on Join
    PlayerModule.ControlModule.Keyboard
    Scripts.GUIs.Boosts Panel V3.Modules.Buffs
    Scripts.GUIs.Boosts Panel V3.Modules
    Scripts.Game.Misc.Instances.MillionaireRun
    PlayerModule.CameraModule.CameraUtils
    Scripts.GUIs.Ultimates HUD
    Scripts.Game.Misc.Tutorial
    PlayerModule.CameraModule.ZoomController.Popper
    Scripts.Game.Misc.World Animations.Castle Cat NPC
    Scripts.Test.Test Award Notif
    Scripts.Core.Disable PlaySolo Chat
    Scripts.GUIs.Monetization.Free Huge
    Scripts.Game.Misc.World Animations.Sandcastle Flag Animation
    Scripts.Game.Events.Obby
    Scripts.GUIs.Tower Players Billboard Gui.BillboardGui.Frame.Title
    Scripts.Core
    Scripts.Game.Misc.World Animations.The Hacker Cubes
    Scripts.GUIs.Monetization
    Scripts.GUIs.Boosts Panel V3.Modules.Guilds
    ]]
    

    local excludedPaths = {}
    for line in rawList:gmatch("[^\r\n]+") do
        excludedPaths[prefix .. line] = true
    end
    local function getPathFrom(root, obj)
        local path = obj.Name
        local parent = obj.Parent
        while parent and parent ~= root do
            path = parent.Name .. "." .. path
            parent = parent.Parent
        end
        return parent == root and "PlayerScripts." .. path or nil
    end
    local function DestroyFiltered(root)
        for _, obj in ipairs(root:GetDescendants()) do
            local relativePath = getPathFrom(root, obj)
            if relativePath and not excludedPaths[relativePath] then
                task.wait()
                pcall(function() obj:Destroy() end)
            end
        end
    end

    

    
    _G.initialOptimizationDone = false

    
    _G.deferOptimization = false 

    local function simplifyVisuals()

        task.delay(5, function()
            workspace.DescendantAdded:Connect(function(obj)
                task.defer(function()
                    if _G.deferOptimization then
                        table.insert(_G.unoptimizedDuringDefer, obj)
                    else
                        Optimization.simplifyObject(obj)
                    end
                end)
            end)
        end)


        task.spawn(function()
            local all = workspace:GetDescendants()
            for i = 1, #all do
                Optimization.simplifyObject(all[i])
                if i % 100 == 0 then
                    task.wait()
                end
            end
            _G.initialOptimizationDone = true
            print("✅ Initial optimization complete")
        end)
    end
    simplifyVisuals()
    task.wait(3)
    DestroyFiltered(LocalPlayer:WaitForChild("PlayerScripts"))
    task.wait(1)
    repeat
        local toRemoveToggle = {}
        local toRemoveSlider = {}
        for setting, expectedValue in pairs(toggleSettings) do
            local success, _, current = Network:WaitForChild("Toggle Setting"):InvokeServer(setting)
            task.wait(0.1)
            if not success then
                warn("Failed to toggle setting:", setting)
            elseif current ~= expectedValue then
                warn(setting .. " is " .. tostring(current) .. ", expected " .. expectedValue)
            else
                table.insert(toRemoveToggle, setting)
            end
        end
        for _, setting in ipairs(toRemoveToggle) do
            toggleSettings[setting] = nil
        end
        for setting, expectedValue in pairs(sliderSettings) do
            local success, _, current = Network:WaitForChild("Slider Setting"):InvokeServer(setting, expectedValue)
            task.wait(0.1)
            if not success then
                warn("Failed to set slider:", setting)
            elseif current ~= expectedValue then
                warn(setting .. " is " .. tostring(current) .. ", expected " .. expectedValue)
            else
                table.insert(toRemoveSlider, setting)
            end
        end
        for _, setting in ipairs(toRemoveSlider) do
            sliderSettings[setting] = nil
        end
        if next(toggleSettings) == nil and next(sliderSettings) == nil then
            print("✅ All settings optimized")
            break
        end
        task.wait(0.2)
    until false
    repeat
        task.wait(3)
    until _G.initialOptimizationDone
end

return Optimization


end function __DARKLUA_BUNDLE_MODULES.b()


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RedeemGift = ReplicatedStorage:WaitForChild("Network"):WaitForChild("Redeem Free Gift")
local SaveProvider = require(ReplicatedStorage.Library.Client.Save)

local FreeGifts = {}


local GiftTimes = {
    [1] = 0,       
    [2] = 600,     
    [3] = 900,     
    [4] = 1200,    
    [5] = 1800,    
    [6] = 2400,    
    [7] = 3000,    
    [8] = 3600,    
    [9] = 4500,    
    [10] = 5400,   
    [11] = 7200,   
    [12] = 10800,  
}


function FreeGifts.CollectAvailableGifts()
    local Save = SaveProvider.Get()

    local totalTime = Save.FreeGiftsTime
    local redeemedGifts = Save.RedeemedFreeGifts or {}

    if not totalTime then
        warn("FreeGiftsTime is nil.")
        return
    end

    for index, requiredTime in ipairs(GiftTimes) do
        local alreadyClaimed = table.find(redeemedGifts, index)
        if not alreadyClaimed and totalTime >= requiredTime then
            local success, result = pcall(function()
                return RedeemGift:InvokeServer(index)
            end)

            if success then
                print("✅ Собран бесплатный подарок:", index)
            else
                warn("❌ Не удалось собрать подарок", index, result)
            end
        end
    end
end

return FreeGifts
end function __DARKLUA_BUNDLE_MODULES.c()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = ReplicatedStorage:WaitForChild("Network")
local Save = require(ReplicatedStorage.Library.Client.Save)
local costGrowthRate = require(ReplicatedStorage.Library.Types.Mailbox).DiamondCostGrowthRate
local startMailCost = require(ReplicatedStorage.Library.Balancing.Constants).MailboxDiamondCost

local Misc = {}


local messages = {
    "Enjoy this!", "For you", "Gift time", "Take this", "Have fun", "Surprise drop",
    "Lucky day", "Happy gift", "Treasure time", "Free stuff", "Just because", "For luck",
    "Much love", "With care", "From me", "Claim now", "Be happy", "One for you",
    "Shiny gift", "You earned it", "Random joy", "It's yours", "Catch this", "Sharing wealth",
    "Loot drop", "You deserve", "Feel rich", "More gems", "Special treat", "A small gift"
}


local function getMailCost()
    local data = Save.Get()
    local count = data.MailboxSendsSinceReset or 0
    local isVIP = data.Gamepasses and data.Gamepasses.VIP
    return isVIP and startMailCost or startMailCost * costGrowthRate ^ count
end


function Misc.Send(mailConfig, recipient, maxCost)
    local save = Save.Get()
    local inventory = save.Inventory

    for configId, config in pairs(mailConfig) do
        local class = config.Class
        local inv = inventory[class]

        if not inv then continue end

        for uuid, item in pairs(inv) do
            local match = false

            if configId == "All Huges" then
                match = string.find(item.id, "Huge") ~= nil
            else
                match = item.id == configId and (item._am or 1) >= config.MinAmount
            end

            if match then
                local currentMailCost = getMailCost()
                if currentMailCost > maxCost then
                    warn("Mail cost too high:", currentMailCost)
                    return
                end

                local amountToSend = item._am or 1

                local args = {
                    recipient,
                    messages[math.random(#messages)],
                    class,
                    uuid,
                    amountToSend
                }

                local success, err = pcall(function()
                    Network:WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
                end)

                if success then
                    print("📬 Sent", configId, "to", recipient)
                    task.wait(5)
                else
                    warn("❌ Failed to send mail:", err)
                end
            end
        end
    end
end

function Misc.Fruits()
    for id, tb in Save.Get().Inventory.Fruit do
        local am = tb._am or 1
        Network:WaitForChild("Fruits: Consume"):FireServer(id, math.min(am, 20))
        task.wait(1)
    end
end

function Misc.Toys()
    for _, v in Save.Get().Inventory.Misc do 
        if v.id == "Squeaky Toy" then
            Network:WaitForChild("SqueakyToy_Consume"):InvokeServer(math.min(v._am or 1, 20))
            task.wait(1)
        elseif v.id == "Toy Ball" then
            Network:WaitForChild("ToyBall_Consume"):InvokeServer(math.min(v._am or 1, 20))
            task.wait(1)
        elseif v.id == "Toy Bone" then
            Network:WaitForChild("ToyBone_Consume"):InvokeServer(math.min(v._am or 1, 20))
            task.wait(1)
        end
    end
end

function Misc.Potions()
    local function getInactivePotions()
        local activePotions = Save.Get().Potions or {}
        local inventory = Save.Get().Inventory.Potion or {}

        local toUse = {}

        for uuid, potion in pairs(inventory) do
            local name = potion.id
            local level = potion.tn or 0
            if level > 8 then continue end

            local activeData = activePotions[name]
            local isActive = typeof(activeData) == "table" and next(activeData) ~= nil

            if not isActive then
                table.insert(toUse, {
                    uuid = uuid,
                    id = name,
                    tn = level,
                    amount = math.min(potion._am or 1, 20)
                })
            end
        end

        table.sort(toUse, function(a, b)
            return a.tn > b.tn
        end)

        return toUse
    end

    local inactivePotions = getInactivePotions()

    for _, p in ipairs(inactivePotions) do
        Network:WaitForChild("Potions: Consume"):FireServer(p.uuid, p.amount)
        print("Used", p.amount, "of", p.id, "Level:", p.tn)
        task.wait(0.5)
    end
end

function Misc.Start(a,b,c)
    task.spawn(function()
        while true do
            Misc.Fruits()
            Misc.Toys()
            Misc.Potions()
            Misc.Send(a,b,c) 
            task.wait(3600)
        end
    end)
end

return Misc
end function __DARKLUA_BUNDLE_MODULES.d()


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = ReplicatedStorage:WaitForChild("Network")
local Save = require(ReplicatedStorage.Library.Client.Save)

local Enchants = {}

function Enchants.Equip(desiredEnchants)
    local Max_Enchant_Slots = Save.Get().MaxEnchantsEquipped
    local EnchantInventory = Save.Get().Inventory.Enchant

    
    for i = 1, Max_Enchant_Slots do
        Network:WaitForChild("Enchants_ClearSlot"):FireServer(i)
        task.wait(0.5)
    end

    
    local remaining = {}
    for uid, data in EnchantInventory do
        local count = data._am or 1
        if data.id and (data.tn or 0) <= 7 and count > 0 then
            table.insert(remaining, {
                uid = uid,
                id = data.id,
                tn = data.tn or 0,
                count = count
            })
        end
    end

    
    table.sort(remaining, function(a, b)
        return a.tn > b.tn
    end)

    
    local equipped = 0
    for _, desired in ipairs(desiredEnchants) do
        for _, entry in ipairs(remaining) do
            if entry.id == desired and entry.count > 0 then
                Network:WaitForChild("Enchants_Equip"):FireServer(entry.uid)
                entry.count -= 1
                equipped += 1
                task.wait(0.5)
                break
            end
        end
        if equipped >= Max_Enchant_Slots then
            break
        end
    end
end

return Enchants
end function __DARKLUA_BUNDLE_MODULES.e()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = ReplicatedStorage:WaitForChild("Network")
local SaveModule = require(ReplicatedStorage.Library.Client.Save)
local Types = require(ReplicatedStorage.Library.Types.Gym)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local GymCmds = require(ReplicatedStorage.Library.Client.GymCmds)
local EventUpgradeDefs = require(ReplicatedStorage.Library.Directory.EventUpgrades)

local InstancingCmds = require(ReplicatedStorage.Library.Client.InstancingCmds)
local InstanceZoneCmds = require(ReplicatedStorage.Library.Client.InstanceZoneCmds)

local Event = {}

local MAX_TIER = 5
local CURRENCY_NAME = "Weight Plate"
local UPGRADE_NAMES = {
    "BetterGymEgg",
    "MoreCriticalChance",
    "MoreEndurance"
}


local EventState = {
    Strength = 0,
    Rebirth = 0,
    RequiredStrength = 250,
    MaxRebirths = 35,
    AutoClicking = true,
}


Event.DefaultSettings = {
    ["Stamina"] = 0,
    ["CritChance"] = 0,
    ["Strength"] = 100,
    ["Size"] = 1
}


local function Teleport(position)
    if LocalPlayer.Character then
        LocalPlayer.Character:MoveTo(position)
    end
end

function Event.TeleportToBestZone()
    
    local bestZone = InstanceZoneCmds.GetMaximumOwnedZoneNumber()

    local zonePath = workspace.__THINGS.__INSTANCE_CONTAINER
        .Active.GymEvent:FindFirstChild(tostring(bestZone) .. " | Area " .. tostring(bestZone))

    if zonePath and zonePath:FindFirstChild("PARTS_LOD") and zonePath.PARTS_LOD:FindFirstChild("Path") then
        local union = zonePath.PARTS_LOD.Path:FindFirstChild("Union")
        if union and union:IsA("BasePart") then
            Teleport(union.Position)
            print("[Event] Teleported to zone " .. bestZone)
        end
    else
        warn("[Event] Failed to locate teleport target for zone " .. bestZone)
    end
end



local function UpdateStats()
    local Save = SaveModule.Get()
    if Save and Save.Gym then
        EventState.Strength = Save.Gym.Strength or 0
        EventState.Rebirth = Save.Gym.Rebirths or 0
        EventState.RequiredStrength = Types.RebirthRequirements[EventState.Rebirth + 1] or math.huge
        EventState.MaxRebirths = Types.MAX_REBIRTHS or 999
    end
end




local function FreezeCharacter()
    task.spawn(function()
        local humanoid
        repeat
            task.wait(0.5)
            if LocalPlayer.Character then
                humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            end
        until humanoid

        humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0
        humanoid.AutoRotate = false

        
        while true do
            if humanoid then
                humanoid.WalkSpeed = 0
                humanoid.JumpPower = 0
                humanoid.AutoRotate = false
            end
            task.wait(0.5)
        end
    end)
end



local function GetOwnedZones()
    local owned = {}
    local save = InstanceZoneCmds.GetSaveTable()
    for key, value in pairs(save) do
        local zoneId = tonumber(string.match(key, "%d+"))
        if value and zoneId then
            owned[zoneId] = true
        end
    end
    return owned
end

local function GetGymCoins()
    local Save = SaveModule.Get()
    for _, entry in pairs(Save.Inventory.Currency) do
        if entry.id == "GymCoins" then
            return tonumber(entry._am) or 0
        end
    end
    return 0
end


local function GetZoneCost(index)
    local zones = InstancingCmds.Get().instanceZones
    local zoneData = zones and zones[index]
    return zoneData and zoneData.CurrencyCost or math.huge
end



function Event.TryBuyZoneForRebirth(currentRebirths)
    
    if currentRebirths == 0 or currentRebirths % 5 ~= 0 then return end

    local targetZone = (currentRebirths / 5) + 1
    local ownedZone = InstanceZoneCmds.GetMaximumOwnedZoneNumber()
    if ownedZone >= targetZone then return end

    local requiredCoins = GetZoneCost(targetZone)
    if requiredCoins == math.huge then return end

    print(string.format("[Event] Need to buy zone %d for rebirth %d", targetZone, currentRebirths))
    
    while GetGymCoins() < requiredCoins do
        print(string.format("[Event] Waiting for %d GymCoins to unlock zone %d...", requiredCoins, targetZone))
        task.wait(1)
    end

    local success, result = pcall(function()
        return Network:WaitForChild("InstanceZones_RequestPurchase"):InvokeServer("GymEvent", targetZone)
    end)

    if success then
        print(string.format("[Event] Zone %d successfully purchased!", targetZone))
    else
        warn("[Event] Failed to purchase zone:", result)
    end
end







function Event.TryRebirth()
    UpdateStats()

    if EventState.Rebirth >= EventState.MaxRebirths then
        EventState.AutoClicking = false
        warn("[Event] Max rebirths reached:", EventState.Rebirth)
        return
    end

    if EventState.Rebirth > 0 and EventState.Rebirth % 5 == 0 then
        local requiredZone = (EventState.Rebirth / 5) + 1
        local ownedZone = InstanceZoneCmds.GetMaximumOwnedZoneNumber()

        if ownedZone < requiredZone then
            print(string.format("[Event] Zone %d is required before continuing rebirths past %d", requiredZone, EventState.Rebirth))
            return
        end
    end


    if EventState.Strength >= EventState.RequiredStrength then
        local rebirthEvent = Network:FindFirstChild("Gym_Rebirth")
        if rebirthEvent then
            local success, err = pcall(function()
                rebirthEvent:InvokeServer()
            end)
            if success then
                print("[Event] Rebirth completed!")
                task.wait(0.5)
                UpdateStats()

                Event.TryBuyZoneForRebirth(EventState.Rebirth)
            else
                warn("[Event] Rebirth failed:", err)
            end
        end
    end
end




function Event.StartRebirthLoop()
    task.spawn(function()
        while EventState.Rebirth < (Types.MAX_REBIRTHS or math.huge) do
            Event.TryRebirth()
            task.wait(5)
        end
        warn("[Event] Rebirth loop stopped: max rebirths reached")
    end)
end

function Event.StartAutoClick()
    task.spawn(function()
        local function WaitForClientGymAuto()
            local modulePath
            repeat
                local container = workspace:FindFirstChild("__THINGS")
                    and workspace.__THINGS:FindFirstChild("__INSTANCE_CONTAINER")
                    and workspace.__THINGS.__INSTANCE_CONTAINER:FindFirstChild("Active")
                    and workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild("GymEvent")
                    and workspace.__THINGS.__INSTANCE_CONTAINER.Active.GymEvent:FindFirstChild("ClientModule")

                if container then
                    modulePath = container:FindFirstChild("ClientGymAuto")
                end
                task.wait(1)
            until modulePath and modulePath:IsA("ModuleScript")
            return modulePath
        end

        local function WaitForGymTrain()
            local trainModule
            repeat
                local gymEvent = workspace:FindFirstChild("__THINGS")
                    and workspace.__THINGS.__INSTANCE_CONTAINER:FindFirstChild("Active")
                    and workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild("GymEvent")

                if gymEvent and gymEvent:FindFirstChild("ClientModule") then
                    trainModule = gymEvent.ClientModule:FindFirstChild("GymTrain")
                end
                task.wait(1)
            until trainModule and trainModule:IsA("ModuleScript")
            return trainModule
        end

        local gymAutoModule = WaitForClientGymAuto()
        local gymTrainModule = WaitForGymTrain()

        if not gymAutoModule or not gymTrainModule then
            warn("[Event] Could not find ClientGymAuto or GymTrain module")
            return
        end

        local successAuto, auto = pcall(require, gymAutoModule)
        local successTrain, GymTrain = pcall(require, gymTrainModule)

        if successAuto and auto and typeof(auto.StartAuto) == "function"
        and successTrain and GymTrain and typeof(GymTrain.SetTrainingByIndex) == "function" then
            print("[Event] Starting auto click with training mode 1")
            GymTrain.SetTrainingByIndex(1)
            auto.StartAuto()
        else
            warn("[Event] Failed to initialize auto training")
        end
    end)
end

function Event.MuscleRace()
    local args = { true }
    game:GetService("ReplicatedStorage").Network.Gym_Auto:FireServer(unpack(args))
    while true do
        if not GymCmds.IsPlayerInInfinite() then
            game:GetService("ReplicatedStorage").Network.InfiniteGym_Start:InvokeServer()
        end
        task.wait(5)
    end
end

local function WaitForStageEnd()
    while GymCmds.IsBenchStageActive() do
        Network.BenchAGargantuan_Train:InvokeServer("Squat")
        task.wait(0.4)
    end
end

function Event.RunBench()
    while true do
        local runs = (SaveModule.Get().Gym.BenchAGargantuanReset and SaveModule.Get().Gym.BenchAGargantuanReset.Runs) or 0
        if runs >= 30 and not GymCmds.IsInBenchAGargantuan() then
            warn("Limit Attempts: 30")
            return
        end

        local completed = GymCmds.GetBenchStagesCompleted() or 0
        if completed >= _G.ToStage then
            Network.Instancing_InvokeCustomFromClient:InvokeServer("GymEvent", "LeaveBenchMinigame")
            task.wait(10)
        end

        if not GymCmds.IsInBenchAGargantuan() then
            Network.Instancing_InvokeCustomFromClient:InvokeServer("GymEvent", "JoinBenchMinigame")
            task.wait(1)
        end

        Network.BenchAGargantuan_StartStage:InvokeServer()
        task.wait(0.5)

        WaitForStageEnd()
        task.wait(1)
    end
end

local currentMode = nil 
local currentThread = nil

local function stopCurrentMode()
    if currentThread and coroutine.status(currentThread) ~= "dead" then
        coroutine.close(currentThread) 
    end
    currentThread = nil
end

function Event.ClickLogic()
    task.spawn(function()
        while true do
            local bestZone = InstanceZoneCmds.GetMaximumOwnedZoneNumber()
            local runs = (SaveModule.Get().Gym.BenchAGargantuanReset and SaveModule.Get().Gym.BenchAGargantuanReset.Runs) or 0

            local newMode = nil
            if bestZone < 8 then
                newMode = "AutoClick"
            elseif bestZone == 8 and runs < 30 then
                newMode = "Bench"
            elseif bestZone == 8 and runs >= 30 then
                newMode = "MuscleRace"
            end

            if newMode ~= currentMode then
                stopCurrentMode()
                currentMode = newMode

                if newMode == "AutoClick" then
                    print("🔁 Switching to AutoClick mode")
                    currentThread = coroutine.create(Event.StartAutoClick)
                    coroutine.resume(currentThread)

                elseif newMode == "Bench" then
                    print("🔁 Switching to Bench mode")
                    currentThread = coroutine.create(Event.RunBench)
                    coroutine.resume(currentThread)

                elseif newMode == "MuscleRace" then
                    print("🔁 Switching to MuscleRace mode")
                    currentThread = coroutine.create(Event.MuscleRace)
                    coroutine.resume(currentThread)
                end
            end

            task.wait(15) 
        end
    end)
end


local function GetSave()
    return SaveModule.Get()
end

local function GetCurrencyAmount()
    local save = GetSave()
    for _, v in pairs(save.Inventory.Misc or {}) do
        if v.id == CURRENCY_NAME then
            return v._am or 0
        end
    end
    return 0
end

local function GetUpgradeTier(name)
    local save = GetSave()
    return save.EventUpgrades[name] or 0
end

local function GetUpgradeCost(name, tier)
    for _, obj in pairs(EventUpgradeDefs) do
        if obj._id == name then
            local cost = obj.TierCosts[tier]
            return cost and cost._data and cost._data._am or math.huge
        end
    end
    return math.huge
end

function Event.AutoUpgradeEvent()
    task.spawn(function()
        
        while InstanceZoneCmds.GetMaximumOwnedZoneNumber() < 8 do
            task.wait(60)
        end

        while true do
            local allMaxed = true

            for _, upgradeName in ipairs(UPGRADE_NAMES) do
                local currentTier = GetUpgradeTier(upgradeName)

                if currentTier < MAX_TIER then
                    allMaxed = false

                    local nextTier = currentTier + 1
                    local cost = GetUpgradeCost(upgradeName, nextTier)
                    local currency = GetCurrencyAmount()

                    if currency >= cost then
                        Network:WaitForChild("EventUpgrades: Purchase"):InvokeServer(upgradeName)
                        task.wait(0.2)
                    end
                end
            end

            if allMaxed then
                break
            end

            task.wait(60)
        end
    end)
end



local function WaitForEventGround()
    _G.deferOptimization = true 

    local found = InstancingCmds.IsInInstance()
    repeat
        Teleport(Vector3.new(-9949.36133, 19.2279053, -289.342651))
        print("Teleporting to event...")
        task.wait(5)
        found = InstancingCmds.IsInInstance()
    until found
    task.wait(30)
    _G.deferOptimization = false 
    for i = 1, #_G.unoptimizedDuringDefer do
        local obj = _G.unoptimizedDuringDefer[i]
        if obj and obj.Parent then
            Optimization.simplifyObject(obj)
        end
        if i % 100 == 0 then
            task.wait()
        end
    end
    print("✅ Deferred objects optimized")
        
    table.clear(_G.unoptimizedDuringDefer)
end


function Event.RunEvent(settings)
    WaitForEventGround()
    settings = settings or Event.DefaultSettings


    
    Network:WaitForChild("Gym_SettingsUpdate"):FireServer(settings)
    print("Event settings updated.")
    FreezeCharacter()
    UpdateStats()

    Event.TryBuyZoneForRebirth(EventState.Rebirth)
    task.spawn(Event.ClickLogic)
    
    task.spawn(Event.StartRebirthLoop)
    task.spawn(Event.AutoUpgradeEvent)
end



function Event.GetState()
    UpdateStats()
    return EventState
end

return Event
end function __DARKLUA_BUNDLE_MODULES.f()
local Webhook = {}
function Webhook.Webhook()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Save = require(ReplicatedStorage.Library.Client.Save)
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    local knownPets = {}

    
    for i, v in pairs(Save.Get().Inventory.Pet or {}) do
        if v.id and (v.id:find("Huge") or v.id:find("Titanic") or v.id:find("Gargantuan")) then
            knownPets[i] = true
        end
    end

    
    local function sendWebhook(petData)
        local name = petData.id or "Unknown"
        local variant = ""

        if petData.pt == 1 then variant = "Golden"
        elseif petData.pt == 2 then variant = "Rainbow" end
        if petData.sh then variant = "Shiny " .. variant end

        local fullName = (variant ~= "" and variant .. " " or "") .. name
        local isTitanic = name:find("Titanic") ~= nil
        local embedColor = isTitanic and 0xFF0000 or 0xFFFFFF

        local data = {
            ["content"] = "<@" .. _G.DiscordID .. ">",
            ["embeds"] = {{
                title = "Hatch Notify\n**" .. LocalPlayer.Name .. "** Got: `" .. fullName .. "`",
                color = embedColor,
                footer = { text = "Made by Hikko" }
            }}
        }

        local json = HttpService:JSONEncode(data)
        local headers = { ["content-type"] = "application/json" }
        local requestFunc = http_request or request or HttpPost or syn.request

        pcall(function()
            requestFunc({
                Url = _G.Url,
                Method = "POST",
                Headers = headers,
                Body = json
            })
        end)
    end

    
    task.spawn(function()
        while true do
            local pets = Save.Get().Inventory.Pet or {}
            for i, v in pairs(pets) do
                if not knownPets[i] and v.id and (v.id:find("Huge") or v.id:find("Titanic")) then
                    knownPets[i] = true
                    sendWebhook(v)
                end
            end
            task.wait(60) 
        end
    end)
end
return Webhook end function __DARKLUA_BUNDLE_MODULES.g()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = ReplicatedStorage:WaitForChild("Network")
local SaveModule = require(ReplicatedStorage.Library.Client.Save)
local InstanceZoneCmds = require(ReplicatedStorage.Library.Client.InstanceZoneCmds)
local InstancingCmdsupvr = require(ReplicatedStorage.Library.Client.CustomEggsCmds)
local eggsCmdsupvr = require(ReplicatedStorage.Library.Client.EggCmds)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Hatching = {}

local Event_Eggs = {}
local eggOrder = {
    "Muscle Beach Egg",
    "Rizz Reef Egg",
    "Chiseled Volcano Egg",
    "Giga Castle Egg",
    "Sigma Beach Egg",
    "Drip Dock Egg",
    "Cliff Gains Egg",
    "Crashed Out Egg Tier 1"
}

local function GetCurrencyAmount(currencyId)
    local saveData = SaveModule.Get()
    for _, v in pairs(saveData.Inventory.Currency or {}) do
        if v.id == currencyId then
            return v._am or 0
        end
    end
    return 0
end

local function Teleport(position)
    if LocalPlayer.Character then
        LocalPlayer.Character:MoveTo(position)
    end
end


local function InitEggData()
    local allEggs = InstancingCmdsupvr.All()
    for index, eggName in ipairs(eggOrder) do
        for _, obj in pairs(allEggs) do
            if obj._id == eggName then
                Event_Eggs[index] = obj
                break
            end
        end
    end
end

function Hatching.Hatching()
    
    repeat
        task.wait(1)
    until InstancingCmds.IsInInstance() and InstanceZoneCmds.GetMaximumOwnedZoneNumber() >= 1

    task.wait(5) 
    InitEggData()

    local function GetBestZone()
        return InstanceZoneCmds.GetMaximumOwnedZoneNumber()
    end

    local maxHatch = eggsCmdsupvr.GetMaxHatch()

    while true do
        local currentZone = GetBestZone()
        local targetEgg = Event_Eggs[currentZone]

        if not targetEgg then
            warn("[Hatching] Egg not found for zone:", currentZone)
            task.wait(10)
            continue
        end

        Teleport(targetEgg._position)
        task.wait(1)

        local coins = GetCurrencyAmount("GymCoins")
        local cost = (targetEgg._dir and targetEgg._dir.overrideCost) or 0

        if cost > 0 and coins >= cost * maxHatch then
            Network:WaitForChild("CustomEggs_Hatch"):InvokeServer(targetEgg._uid, maxHatch)
        end

        if currentZone < 8 then
            print("[Hatching] Waiting to unlock next zone...")
            repeat task.wait(10) until GetBestZone() > currentZone
        else
            while true do
                task.wait(1.6)
                local coinsNow = GetCurrencyAmount("GymCoins")
                local costNow = (targetEgg._dir and targetEgg._dir.overrideCost) or 0

                if costNow > 0 and coinsNow >= costNow * maxHatch then
                    Network:WaitForChild("CustomEggs_Hatch"):InvokeServer(targetEgg._uid, maxHatch)
                end
            end
        end
    end
end

return Hatching



end end
_G.ToStage = 17
_G.DiscordID = "616192445000187914"
_G.Url = "https://discord.com/api/webhooks/1391861467229458454/aY7TWxyBmy0SysgMUP8dSPz5aWk2I9ZEscWE29ez4r0jBWI-Ybi9XS_NXrGnHVD5J5iD"
_G.Enchants = { "Lucky Eggs", "Lucky Eggs", "Lucky Eggs", "Lucky Eggs", "Lucky Eggs" }
_G.Mail_Config = {
    ["All Huges"] = {Class = "Pet", MinAmount = 1},
    ["Buff Gym Gift"] = {Class = "Lootbox", MinAmount = 100}
}
_G.User = "mayda_4kv"
_G.Max_Mail_Cost = 1000000

Optimization = __DARKLUA_BUNDLE_MODULES.load('a')
FreeGifts = __DARKLUA_BUNDLE_MODULES.load('b')
Misc = __DARKLUA_BUNDLE_MODULES.load('c')
Enchants = __DARKLUA_BUNDLE_MODULES.load('d')
Event = __DARKLUA_BUNDLE_MODULES.load('e')
Webhook = __DARKLUA_BUNDLE_MODULES.load('f')
Hatching = __DARKLUA_BUNDLE_MODULES.load('g')


Optimization.optimization()

task.spawn(function()
    Misc.Start(_G.Mail_Config, _G.User, _G.Max_Mail_Cost)
end)

task.wait()

Enchants.Equip(_G.Enchants)

task.wait()

task.spawn(function()
    Event.RunEvent()
end)

task.wait()

task.spawn(function()
    Webhook.Webhook()
end)

task.wait()

task.spawn(function()
    while true do
        FreeGifts.CollectAvailableGifts()
        task.wait(300) 
    end
end)

task.spawn(function()
    repeat
        task.wait(3)
    until InstancingCmds.IsInInstance() and InstanceZoneCmds.GetMaximumOwnedZoneNumber() >= 1

    Hatching.Hatching()
end)




