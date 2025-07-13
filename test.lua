local prefix = "PlayerScripts."
local LocalPlayer = game.Players.LocalPlayer
local rawList = [[
Scripts.Game.Pets
Scripts.Game.Pets.PetAI
Scripts.Game.Misc["World Animations"].PlanetAnimations
Scripts.Game["Trading Plaza Portal"]
Scripts.Game.Music
Scripts.Game.Pets["Modifier VFX"]["Happy Pets VFX"]
Scripts.Game.Pets["Modifier VFX"]["\240\159\147\150 README"]
PlayerModule.CameraModule.OrbitalCamera
Scripts.Game.Misc["Fantasy Transition TEMP"]
Scripts.Core["Voice Chat Trading Server"]
Scripts.Game.Misc["World Animations"]["Balloons - Castle"]
Scripts.GUIs["Boosts Panel V3"].Types
Scripts.GUIs["Prison Key Surge Sign"]
Scripts.Game.Breakables["Damage Statistics Manager"]
Scripts.Game.Misc["World Animations"]["Windmill Animation"]
PlayerModule.ControlModule.DynamicThumbstick
Scripts.GUIs["Boosts Panel V3"].Modules.__BLUEPRINT
PlayerModule.CameraModule.VRBaseCamera
PlayerModule.ControlModule.TouchJump
PlayerModule.CameraModule.VehicleCamera.VehicleCameraCore
PlayerModule.ControlModule
PlayerModule.CameraModule.BaseCamera
Scripts.Game["Castle Door"]
Scripts.Game.Misc["World Animations"]["Spike Animation"]
Scripts.Game["My Guild Banner"]
Scripts.GUIs["Boosts Panel V3"].Modules.Capes
Scripts.Game.Misc["World Animations"]["Door Glow Animation"]
Scripts.Game["Physical Eggs Frontend"]
Scripts.Core["Chat Nametags"].Filters
Scripts.Core["Idle Tracking"]
PlayerModule.CommonUtils.ConnectionUtil
Scripts.Game["Egg Opening Frontend"]
Scripts.Game.Misc["Huge Event Billboard"]
Scripts.Game["Upgrades Frontend"]
PlayerModule.CameraModule.VehicleCamera.VehicleCameraConfig
PlayerModule.CameraModule.VRVehicleCamera
PlayerModule.ControlModule.TouchThumbstick
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.ProgressBar
Scripts.Test["Test Riding"]
Scripts.GUIs.Instances.BasketballCalendar
Scripts.GUIs["Boosts Panel V3"].Modules.Friends
Scripts.Game["Time Trials"]
Scripts.Game["Tower Tycoon Raffle Boards"]
Scripts.Test["UI Resize Finder"]
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.Completed.UITextSizeConstraint
PlayerModule.CameraModule.Invisicam
Scripts.GUIs["World GUIs"]
Scripts.Game.Machines["Item Index"]
Scripts.Core["Custom Chat Filtering"]
Scripts.GUIs["Boosts Panel V3"]
PlayerModule.CameraModule.BaseOcclusion
Scripts.Game.Misc["World Animations"]["Rainbow Road Animations"]
Scripts.GUIs["Tower Players Billboard Gui"]
PlayerModule.CameraModule.CameraToggleStateController
Scripts.GUIs["Boosts Panel V3"].Modules.Gamepasses
Scripts.GUIs["Hype Eggs"]
Scripts.GUIs["Boosts Panel V3"].Modules.TowerXpDouble
Scripts.Game.Breakables["Breakables Frontend"]
Scripts.GUIs["Free Gifts"]
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.Subtitle.UIStroke
PlayerModule.ControlModule.VehicleController
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.Title.UITextSizeConstraint
Scripts.GUIs["Random Active Drops"]
Scripts.Game.Misc["Egg Promo"]["Egg Billboard Pets Cards"]
Scripts.Game.Misc["World Animations"]["Enchanted Lights Animation"]
Scripts.Game.Misc["Prison World"]["Prison Doors"]
Scripts.Game["Clan Castle Door"]
Scripts.Game.Misc["World Animations"]["VIP Water Chests"]
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.ProgressBar.Bar.UIGradient
Scripts.Game.Misc["Egg Promo"]
Scripts.GUIs["Boosts Panel V3"].Modules.Subscriptions
Scripts.Game.Misc["World Animations"]["Castle Propeller Cat"]
Scripts.Test["Test Message"]
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.ProgressBar.UICorner
PlayerModule.CommonUtils.FlagUtil
PlayerModule.CommonUtils.CameraWrapper
PlayerModule.ControlModule.Gamepad
Scripts.Core["Product Notifications"]
Scripts.Game.Misc["World Animations"]["Toilet Cat Outhouse"]
Scripts.Game.Items
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.ProgressBar.Bar.UIStroke
Scripts.GUIs["Currency 2"]
ParallelPetExport
PlayerModule.ControlModule.BaseCharacterController
Scripts.Game.Pets
["Parallel Pet Actors"]
Scripts.GUIs["Trade Notification"]
Scripts.Game["Machine Animations"]["Upgrade Presents Anim"]
Scripts.GUIs["Teleports Map OLD"]
Scripts.GUIs["Boosts Panel V3"].Modules.FishingEvent
PlayerModule.CameraModule.MouseLockController
Scripts.Game["Water Detector"]
PlayerModule.CameraModule.ClassicCamera
["Parallel Pet Actors"].ParallelPet
Scripts.Test["Memory Report"]
Scripts.Test["Show Instance Counts"]
Scripts.Test["Test Notifications"]
Scripts.Game.Gamepasses
Scripts.Test["Test Raid UI"]
Scripts.Test["Print Damage Factor"]
Scripts.Test["Test Exclamation"]
Scripts.Test["Find Skinned Meshes"]
Scripts.Game["Trading Plaza"]
Scripts.Test["Test Rain"]
Scripts.Test["Test Fireworks"]
Scripts.Game.Enchants
Scripts.Test["Test Confetti"]
Scripts.Test["Disable Development UI On Boot"]
Scripts.Test
Scripts.Misc
Scripts.Game.Farming["Farming Gift Notification"]
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.ProgressBar.UIStroke
Scripts.Game.Misc["Prison World"]
Scripts.GUIs["Boosts Panel V3"].Modules.Rebirths
Scripts.Test.MessageTesting
Scripts.Game["Gates Frontend"]
Scripts.Game.Machines["Tower AFK"]
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.Completed.UIStroke
PlayerModule.CameraModule.CameraInput
Scripts.Game.Misc["Rebirth VFX"]
PlayerModule
Scripts.Game.Events.Basketball
Scripts.Game.Farming
PlayerModule.CameraModule
Scripts.Game.Misc["World Animations"].PlanetAnimationsOLD
Scripts.Game.Misc["World Animations"]["Disco Bulbs AnimationOLD"]
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.ProgressBar.Bar
Scripts.GUIs["Boosts Panel V3"].Modules.SaturdayBuff
Scripts.Game.Misc["World Animations"].Balloons
Scripts.Test["Disable Player List Menu"]
Scripts.Game.Misc["World Animations"]["Gate Countdown"]
Scripts.GUIs.Instances
Scripts.Game.Machines["Doodle Upgrade Machine"]
Scripts.GUIs["Boosts Panel V3"].Modules.Effects
Scripts.GUIs["Boosts Panel V3"].Modules["Boost Exchange"]
Scripts.Game["Egg Opening Frontend"].EggPositions
Scripts.Game.Misc["World Animations"]["Lighthouse Animation"]
Scripts.Game["Doodle World"]["Doodle Jar"]
Scripts.GUIs["PETS GO Countdown"]
Scripts.Game["Doodle World"]
Scripts.Game.Raffles
PlayerModule.ControlModule.PathDisplay
Scripts.Game.Misc["Egg Promo"]["Egg Pets Farming"]
Scripts.Game.Misc["Egg Promo"]["Monday Pets Fantasy"]
Scripts.Game.Misc["World Animations"]["Window Glow Animation"]
Scripts.Game["Random Events"]
Scripts.Game.Misc["Notification Prompt"]
PlayerModule.CameraModule.Poppercam
Scripts.GUIs["Boosts Panel V3"].BasketballEvent
Scripts.Game["Physical Eggs Frontend"].LuckModifiers
Scripts.GUIs["Boosts Panel V3"].Modules.Fruit
PlayerModule.ControlModule.ClickToMoveDisplay
Scripts.Game["Top Guild Banner"]
PlayerModule.CameraModule.CameraUI
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.Completed
Scripts.Core["Chat Nametags"]
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.UIListLayout
PlayerModule.CameraModule.VRCamera
PlayerModule.CameraModule.TransparencyController
Scripts.GUIs["Boosts Panel V3"].Modules.FactoryPoints
Scripts.Game.Events.Hacker["UFO Invasion"]
Scripts.Game.Events.Hacker
Scripts.Game.Events.Obby["Summer Event Notification"]
Scripts.Game.Events
PlayerModule.CommonUtils
PlayerModule.CameraModule.VehicleCamera
PlayerModule.CameraModule.LegacyCamera
Scripts.Game.Ultimates
Scripts.Game["Trading Plaza"]["Main Game Portal"]
Scripts.Game["Mastery (Square Version)"]
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.Title.UIStroke
Scripts.Game.ForeverPacks
Scripts.GUIs.Ranks.Sound
Scripts.Game.Worlds["Olympus World"]
Scripts.Game["Race Rewards"]
Scripts.Game["Breakable VFX (Enchants, etc"].)
Scripts.Game["Machine Animations"]["Pickaxe Machine Anim"]
Scripts.Game["Machine Animations"]
Scripts.Game.Instancing
Scripts.Game.Worlds["Obby World"]
Scripts.GUIs
Scripts.Game.Misc["Potato Mode Setting"]
Scripts.GUIs["Boosts Panel V3"].Modules.Potions
Scripts.GUIs["Egg Deal"]
Scripts.Game.Machines
Scripts.Game.Worlds
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.ProgressBar.Bar.UICorner
PlayerModule.CommonUtils.CharacterUtil
Scripts.Game.Machines["Fantasy Shard Machine"]
Scripts.GUIs.Ranks
Scripts.Game.Misc["Favorite Prompt"]
Scripts.GUIs["New Player Tasks"]
Scripts.Game.Misc.Instances
Scripts.Game.Events.Farming
Scripts.Game
Scripts.GUIs["Zone Progress Bar"]
Scripts.Game.Misc
Scripts.Core.Controller
Scripts.Game["Guild Chat (Hide Locally)"]
PlayerModule.ControlModule.VRNavigation
Scripts.Game["Tower Tycoon Raffle Boards"].TicketSelector
Scripts.GUIs["Chat Filters"]
Scripts.Game["Scary Pet"]
Scripts
Scripts.Game.ForeverPacks["Lucky Pack"]
Scripts.Game.Machines["Vending Machines"]
Scripts.Game.Misc["World Animations"]["Preston Shop"]
PlayerModule.ControlModule.ClickToMoveController
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.Subtitle.UITextSizeConstraint
PlayerModule.CameraModule.ZoomController
Scripts.Game.Misc["World Animations"]["Door Cats NPC"]
Scripts.Core["Disable Chat on Join"]
PlayerModule.ControlModule.Keyboard
Scripts.GUIs["Boosts Panel V3"].Modules.Buffs
Scripts.GUIs["Boosts Panel V3"].Modules
Scripts.Game.Misc.Instances.MillionaireRun
PlayerModule.CameraModule.CameraUtils
Scripts.GUIs["Ultimates HUD"]
Scripts.Game.Misc.Tutorial
PlayerModule.CameraModule.ZoomController.Popper
Scripts.Game.Misc["World Animations"]["Castle Cat NPC"]
Scripts.Test["Test Award Notif"]
Scripts.Core["Disable PlaySolo Chat"]
Scripts.GUIs.Monetization["Free Huge"]
Scripts.Game.Misc["World Animations"]["Sandcastle Flag Animation"]
Scripts.Game.Events.Obby
Scripts.GUIs["Tower Players Billboard Gui"].BillboardGui.Frame.Title
Scripts.Core
Scripts.Game.Misc["World Animations"]["The Hacker Cubes"]
Scripts.GUIs.Monetization
Scripts.GUIs["Boosts Panel V3"].Modules.Guilds
["Parallel Pet Actors"]["Parallel Pet"]["Parallel Pet Controller"]
["Parallel Pet Actors"]["Parallel Pet"]["Parallel Pet Controller"]
["Parallel Pet Actors"]["Parallel Pet"]["Parallel Pet Controller"]
["Parallel Pet Actors"]["Parallel Pet"]["Parallel Pet Controller"]
["Parallel Pet Actors"]["Parallel Pet"]["Parallel Pet Controller"]
]]



-- Список исключений
local excludedPaths = {
    ["PlayerScripts.Parallel Pet Actors"] = true
}

-- Преобразование строк в исключения (если есть rawList)
for line in (rawList or ""):gmatch("[^\r\n]+") do
    local cleanLine = prefix .. line:match("^%s*(.-)%s*$")
    excludedPaths[cleanLine] = true
end

-- Получить относительный путь объекта
local function getPathFrom(root, obj)
    local path = obj.Name
    local parent = obj.Parent
    while parent and parent ~= root do
        path = parent.Name .. "." .. path
        parent = parent.Parent
    end
    return parent == root and prefix .. path or nil
end

-- Удалить всё, что не в исключениях
local function DestroyFiltered(root)
    for _, obj in ipairs(root:GetDescendants()) do
        if obj:IsA("LocalScript") then
            local relativePath = getPathFrom(root, obj)
            if relativePath then
                local isExcluded = false
                for excludedPath in pairs(excludedPaths) do
                    -- Проверяем, начинается ли путь с исключённого пути
                    if relativePath:sub(1, #excludedPath) == excludedPath then
                        isExcluded = true
                        break
                    end
                end

                if not isExcluded then
                    print("Destroying:", relativePath)
                    pcall(function() obj:Destroy() end)
                    task.wait()
                else
                    print("Excluded:", relativePath)
                end
            end
        end
    end
end

-- Запуск
DestroyFiltered(LocalPlayer:WaitForChild("PlayerScripts"))





