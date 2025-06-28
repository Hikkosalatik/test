local function optimization()
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
        ["ShowBoosts"] = 2,
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
        task.wait(0.5)
    until false

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
                pcall(function() obj:Destroy() end)
            end
        end
    end

    DestroyFiltered(LocalPlayer:WaitForChild("PlayerScripts"))

    
    local function simplifyVisuals()
        local simpleTextureId = "rbxassetid://0"

        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter")
            or obj:IsA("Trail")
            or obj:IsA("Beam")
            or obj:IsA("Smoke")
            or obj:IsA("Fire")
            or obj:IsA("Sparkles")
            or obj:IsA("Explosion")
            or obj:IsA("Light")
            or obj:IsA("PointLight")
            or obj:IsA("SpotLight")
            or obj:IsA("SurfaceLight") then
                pcall(function() obj:Destroy() end)

            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Texture = simpleTextureId
                obj.Transparency = 1

            elseif obj:IsA("SurfaceAppearance") then
                obj:Destroy()

            elseif obj:IsA("MeshPart") then
                obj.TextureID = ""
                obj.Material = Enum.Material.Plastic
                obj.Transparency = 1

            elseif obj:IsA("BasePart") then
                obj.Material = Enum.Material.Plastic
                obj.Transparency = 1
                obj.Reflectance = 0
            end
        end
    end

    simplifyVisuals()
end
task.spawn(optimization)

