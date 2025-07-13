local __DARKLUA_BUNDLE_MODULES __DARKLUA_BUNDLE_MODULES={cache={}, load=function(m)if not __DARKLUA_BUNDLE_MODULES.cache[m]then __DARKLUA_BUNDLE_MODULES.cache[m]={c=__DARKLUA_BUNDLE_MODULES[m]()}end return __DARKLUA_BUNDLE_MODULES.cache[m].c end}do function __DARKLUA_BUNDLE_MODULES.a()_G.unoptimizedDuringDefer = {} 
_G.StopOpti = true
local Optimization = {}
function Optimization.simplifyObject(obj)
	if not _G.StopOpti then return end
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
    Scripts.Game.Pets
    Scripts.Game.Pets.PetAI
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
			_G.initialOptimizationDone = true
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
    local redeemedSet = {}

    for _, index in ipairs(redeemedGifts) do
        redeemedSet[index] = true
    end

    if not totalTime then
        warn("FreeGiftsTime is nil.")
        return
    end

    for index, requiredTime in ipairs(GiftTimes) do
        if not redeemedSet[index] and totalTime >= requiredTime then
            local success, result = pcall(function()
                return RedeemGift:InvokeServer(index)
            end)

            if success then
                print("✅ Собран бесплатный подарок:", index)
                redeemedSet[index] = true
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
local LocalPlayer = game.Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")
local InstancingCmds = require(ReplicatedStorage.Library.Client.InstancingCmds)

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
    task.wait(60)
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

                local success, err = Network:WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))

                if success then
                    print("📬 Sent", configId, "to", recipient)
                    task.wait(5)
                else
                    warn("❌ Failed to send mail:", err)
                    break
                end
            end
        end
    end
end
function Misc.EquipBestPets()
    if Save.Get().FavoriteModeEnabled == true then
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Pets_ToggleFavoriteMode"):FireServer()
    end
    task.wait(10)
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

function Misc.AntiAFK()
    for _, v in pairs(getconnections(LocalPlayer.Idled)) do v:Disable() end
    LocalPlayer.Idled:Connect(function() VirtualUser:ClickButton2(Vector2.new(math.random(0, 1000), math.random(0, 1000))) end)

    old = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        if not checkcaller() then
            local Name = tostring(self)
            if table.find({"Server Closing", "Idle Tracking: Update Timer", "Move Server"}, Name) then
                return nil
            end
        end
        return old(self, ...)
    end)
    Network:WaitForChild("Idle Tracking: Stop Timer"):FireServer()
end

function Misc.SuperMagnet()
    local OrbModule = require(game:GetService("ReplicatedStorage").Library.Client.OrbCmds.Orb)
    OrbModule.CollectDistance = math.huge
end

function Misc.ChangePetSpeed()
    local PlayerPet = require(game:GetService("ReplicatedStorage").Library.Client.PlayerPet)
    function PlayerPet.CalculateSpeedMultiplier(arg1)
        return math.huge
    end
end



function Misc.Start(a,b,c)
    task.spawn(Misc.AntiAFK)
    task.wait()
    Misc.SuperMagnet()
    task.wait()
    task.spawn(function()
        repeat task.wait(1) until InstancingCmds.IsInInstance()
        Misc.EquipBestPets()
    end)

    task.wait()
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
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local InstancingCmds = require(ReplicatedStorage.Library.Client.InstancingCmds)
local InstancingEventCmds = require(ReplicatedStorage.Library.Client.PlotCmds.ClientPlot)
local InstancingCmdsupvr = require(ReplicatedStorage.Library.Client.CustomEggsCmds)
local eggsCmdsupvr = require(ReplicatedStorage.Library.Client.EggCmds)
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local head = character:WaitForChild("Head")

local Event = {}

local TARGET_EGG = "TierFiveEgg"

local CURRENCY_NAME = "BlockPartyCoins"

local function GetRebirth()
    return SaveModule.Get().TileRebirth
end

local function CountTiles()
    local count = 0
    for id, tb in InstancingEventCmds.GetLocal().Tiles do
        count+=1
    end
    return count
end

local function GetCurrencyAmount() 
    local save = SaveModule.Get()
    for _, v in pairs(save.Inventory.Currency or {}) do
        if v.id == CURRENCY_NAME then
            return v._am or 0
        end
    end
    return 0
end

local function GetEggMulti()
    for _, tile in pairs(InstancingCmds.GetLocal().Tiles) do
        if tile.Directory and tile.Directory._id == "TierFiveEgg" then
            return tile.SaveVariables and tile.SaveVariables.EggMult
        end
    end
end




local function getOwnedTiles()
	local owned = {}
	for _, obj in pairs(InstancingEventCmds.GetLocal().Tiles) do
		local x, y = obj.VoxelX, obj.VoxelY
		if x and y then
			local key = x .. "," .. y
			owned[key] = true
		end
	end
	return owned
end


local function buyTile(x, y)
    local TILE_ID = InstancingEventCmds.GetLocal().Id
	local args = {TILE_ID, "PurchaseTile", x, y}
	local success = Network:WaitForChild("Plots_Invoke"):InvokeServer(unpack(args))
	return success == true
end


local function spiralPurchase()
	local purchased = getOwnedTiles() 
	local directions = {
		Vector2.new(1, 0),   
		Vector2.new(0, 1),   
		Vector2.new(-1, 0),  
		Vector2.new(0, -1),  
	}

	local pos = Vector2.new(0, 0)
	local stepSize = 1
	local dirIndex = 1

	while stepSize <= 13 do
		for _ = 1, 2 do
			local dir = directions[dirIndex]
			for _ = 1, stepSize do
				pos += dir
				local x, y = pos.X, pos.Y
				if math.abs(x) <= 6 and math.abs(y) <= 6 then
					local key = x .. "," .. y
					if not purchased[key] then
						local success = buyTile(x, y)
						if success then
							purchased[key] = true
						end
						task.wait(0.25)
					end
				end
			end
			dirIndex = dirIndex % 4 + 1
		end
		stepSize += 1
	end
end

local function Teleport(position)
    if LocalPlayer.Character then
        LocalPlayer.Character:MoveTo(position)
    end
end


local function TouchTiles()
    local ownedTileIds = {}
    for id, _ in pairs(InstancingEventCmds.GetLocal().Tiles) do
        ownedTileIds[id] = true
    end

    for _, tile in pairs(workspace.__THINGS.Tiles:GetChildren()) do
        if ownedTileIds[tile.Name] then
            local touchPart = tile:FindFirstChild("TouchPart")
            if touchPart and touchPart:IsA("BasePart") then
                firetouchinterest(head, touchPart, 0)
                task.wait(0.1)
                firetouchinterest(head, touchPart, 1)
                task.wait(0.1)
            end
        end
    end
end

local function InitEggData()
    local allEggs = InstancingCmdsupvr.All()
    local mult = GetEggMulti()
    for _, obj in pairs(allEggs) do
        if obj._id == "Block Party Tier One " .. mult .. "x" then
            return obj._position, obj._uid, obj._dir.overrideCost
        end
    end
end



local function TeleporToEgg()
    local position, _, _ = InitEggData()
    Teleport(position)
    print("Teleporting to Egg")
end

function Hatching(once)
    repeat
        task.wait(1)
        print("Waiting Load Instance")
    until InstancingCmds.IsInInstance()
    local _, uid, cost = InitEggData()
    TeleporToEgg()
    task.wait()
    local maxHatch = eggsCmdsupvr.GetMaxHatch()
    
    local targetEgg = TARGET_EGG 

    if not targetEgg then
        warn("[Hatching] Egg not found for zone:")
        return
    end

    task.wait(1)

    local coins = GetCurrencyAmount()

    if cost > 0 and coins >= cost * maxHatch then
        Network:WaitForChild("CustomEggs_Hatch"):InvokeServer(uid, maxHatch)
    else
        warn("[Hatching] Not enough Coins or cost is invalid")
    end

    
    if once then
        return
    end

    
    while true do
        task.wait(1.73)
        coins = GetCurrencyAmount()

        if cost > 0 and coins >= cost * maxHatch then
            Network:WaitForChild("CustomEggs_Hatch"):InvokeServer(uid, maxHatch)
        end
    end
end

local function TryRebirth()
    local rebirths = GetRebirth()

    
    if rebirths < 10 then
        local success = pcall(function()
            return game:GetService("ReplicatedStorage")
                .Network:WaitForChild("Rebirth_Request"):InvokeServer()
        end)

        if success then
            print("[Rebirth] Requested successfully.")
        else
            warn("[Rebirth] Request failed.")
        end
    end
end


local function PurchaseUpgrades()
	while true do
		local allTiles = InstancingEventCmds.GetLocal().Tiles
		local upgradesPurchased = 0
		local totalUpgrades = 0

		for tileId, tile in pairs(allTiles) do
			if tile.Directory and tile.Directory._id == "UpgradeTile" then
				totalUpgrades += 1
				local isClaimed = tile.SaveVariables and tile.SaveVariables.Claimed
				local cost = tile.SaveVariables and tile.SaveVariables.Cost

				if not isClaimed and cost and GetCurrencyAmount() >= cost then
					local args = { tileId, "Claim" }
					local success = Network:WaitForChild("Tiles_Invoke"):InvokeServer(unpack(args))
					if success then
						print("UpgradeTile purchased:", tileId)
						upgradesPurchased += 1
						task.wait(0.5)
					end
				end
			end
		end

		if CountTiles() >= 169 or totalUpgrades == 0 then
			print("All tiles purchased or no upgrades found.")
			break
		end

		if upgradesPurchased == 0 then
			print("No affordable or unclaimed upgrades found. Retrying in 10 seconds...")
			task.wait(10)
		end
	end
end

local function WaitForEventGround() 
    _G.deferOptimization = true
    _G.StopOpti = true 
    local found = InstancingCmds.IsInInstance()
    repeat
        InstancingCmds.Enter("BlockParty")
        print("Teleporting to event...")
        task.wait(5)
        found = InstancingCmds.IsInInstance()
    until found

    task.wait(15)
    _G.deferOptimization = false

    for _, obj in ipairs(_G.unoptimizedDuringDefer) do
        Optimization.simplifyObject(obj)
    end
    table.clear(_G.unoptimizedDuringDefer)
    task.wait()
    _G.StopOpti = false
end




function Event.RunEvent()
    print("[Event] ⏳ Ожидание телепортации в ивент...")
    setthreadidentity(2)
    WaitForEventGround()
    setthreadidentity(8)
    print("[Event] ✅ Игрок в ивенте!")

    task.spawn(function()
        while true do
            print("[Loop] 🔧 Проверка апгрейдов...")
            PurchaseUpgrades()

            print("[Loop] 🤚 Касание плиток...")
            TouchTiles()

            print("[Loop] 🔁 Попытка ребитха...")
            TryRebirth()

            if CountTiles() < 169 then
                print("[Loop] 📦 Покупка новых плиток...")
                spiralPurchase()
            else
                print("[Loop] 🟩 Все плитки куплены (169).")
            end

            print("[Loop] ⏱ Ожидание перед следующей итерацией...\n")
            task.wait(5)
        end
    end)

    task.spawn(function ()
        while true do
            local rebirths = GetRebirth()
            print("[Monitor] 🔄 Текущий ребитх: " .. tostring(rebirths))
            if rebirths >= 10 then
                print("[Monitor] 🎉 Достигнуто 10 ребитхов — начинаем открытие яиц!")
                Hatching(false)
                break
            end
            task.wait(60)
        end
    end)
end





return Event end function __DARKLUA_BUNDLE_MODULES.f()
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

return Webhook end end


Optimization = __DARKLUA_BUNDLE_MODULES.load('a')
FreeGifts = __DARKLUA_BUNDLE_MODULES.load('b')
Misc = __DARKLUA_BUNDLE_MODULES.load('c')
Enchants = __DARKLUA_BUNDLE_MODULES.load('d')
Event = __DARKLUA_BUNDLE_MODULES.load('e')
Webhook = __DARKLUA_BUNDLE_MODULES.load('f')

local InstancingCmds = require(game:GetService("ReplicatedStorage").Library.Client.InstancingCmds)

Optimization.optimization()
task.wait(1)


task.spawn(function()
    Event.RunEvent()
end)


repeat task.wait(5) until InstancingCmds.IsInInstance()




task.spawn(function()
    Webhook.Webhook()
end)
task.wait(1)

task.spawn(function()
    Misc.Start(_G.Mail_Config, _G.User, _G.Max_Mail_Cost)
end)
task.wait(10)


Enchants.Equip(_G.Enchants)



task.spawn(function()
    while true do
        FreeGifts.CollectAvailableGifts()
        task.wait(300)
    end
end)







