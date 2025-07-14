_G.DiscordID = "616192445000187914"
_G.Url = "https://discord.com/api/webhooks/1391861467229458454/aY7TWxyBmy0SysgMUP8dSPz5aWk2I9ZEscWE29ez4r0jBWI-Ybi9XS_NXrGnHVD5J5iD"
_G.Enchants = { "Lucky Eggs", "Lucky Eggs", "Lucky Eggs", "Lucky Eggs", "Lucky Eggs" }
_G.Mail_Config = {
    ["All Huges"] = {Class = "Pet", MinAmount = 1},
    ["Buff Gym Gift"] = {Class = "Lootbox", MinAmount = 100}
}
_G.User = "mayda_4kv"
_G.Max_Mail_Cost = 1000000
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

local function BoostRam()
    local module_upvr = require(game:GetService("ReplicatedStorage").Library.Client.BlockPartyCmds.ClientTile)
    local localPlayer = game.Players.LocalPlayer

    local oldNew = module_upvr.new

    module_upvr.new = function(arg1)
        if not arg1 or typeof(arg1) ~= "table" then return end

        local owner = arg1.Owner
        if owner and owner ~= localPlayer then
            return nil
        end

        return oldNew(arg1)
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
        ["Trading"] = 1
    }
    local sliderSettings = {
        ["SFX"] = 0,
        ["Music"] = 0
    }
    local rawList = [[
    PlayerScriptsLoader
    Scripts.Game.Breakables
    Scripts.Game.Pets
    Scripts.Misc.MemoryDebugging
    ]]



    
    local excludedPaths = {
        ["PlayerScripts.Parallel Pet Actors"] = true
    }

    
    for line in (rawList or ""):gmatch("[^\r\n]+") do
        local cleanLine = prefix .. line:match("^%s*(.-)%s*$")
        excludedPaths[cleanLine] = true
    end

    
    local function getPathFrom(root, obj)
        local path = obj.Name
        local parent = obj.Parent
        while parent and parent ~= root do
            path = parent.Name .. "." .. path
            parent = parent.Parent
        end
        return parent == root and prefix .. path or nil
    end

    
    local function DestroyFiltered(root)
        for _, obj in ipairs(root:GetDescendants()) do
            if obj:IsA("LocalScript") then
                local relativePath = getPathFrom(root, obj)
                if relativePath then
                    local isExcluded = false
                    for excludedPath in pairs(excludedPaths) do
                        
                        if relativePath:sub(1, #excludedPath) == excludedPath then
                            isExcluded = true
                            break
                        end
                    end

                    if not isExcluded then
                        pcall(function() obj:Destroy() end)
                        task.wait()
                    end
                end
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
    BoostRam()
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

function Misc.ClaimMail()
    while task.wait(300) do
        Network["Mailbox: Claim All"]:InvokeServer()
    end
end

function Misc.Start(a,b,c)
    task.spawn(Misc.AntiAFK)
    task.wait()
    Misc.SuperMagnet()
    task.wait()
    task.spawn(Misc.ClaimMail)
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
    _G.TILE_ID = InstancingEventCmds.GetLocal().Id
	local args = {_G.TILE_ID, "PurchaseTile", x, y}
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
						task.wait(0.5)
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
                task.wait(0.25)
                firetouchinterest(head, touchPart, 1)
                task.wait(0.25)
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
            return game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Plots_Invoke"):InvokeServer(_G.TILE_ID, "Rebirth")
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
			task.wait(60)
		end
	end
end

local function gui()
    local Players = game:GetService("Players")
    local save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
    local LocalPlayer = Players.LocalPlayer
    local firsttime = os.time()
    local firstdiamonds = save.Get().BoothDiamondsEarned
    local screenGui = Instance.new("ScreenGui")

    screenGui.Name = "GUI"
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    screenGui.DisplayOrder = 1e6
    screenGui.Parent = nil

    local background = Instance.new("Frame")
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.new(0, 0, 0)
    background.BorderSizePixel = 0
    background.Parent = screenGui

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 0, 50)
    nameLabel.Position = UDim2.new(0, 0, 0.05, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = "Player: " .. LocalPlayer.Name
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.Parent = background

    local timeLabel = Instance.new("TextLabel")
    timeLabel.Size = UDim2.new(1, 0, 0, 50)
    timeLabel.Position = UDim2.new(0, 0, 0.15, 0)
    timeLabel.BackgroundTransparency = 1
    timeLabel.Text = "Player Time: 0s"
    timeLabel.TextColor3 = Color3.new(1, 1, 1)
    timeLabel.TextScaled = true
    timeLabel.Font = Enum.Font.SourceSans
    timeLabel.Parent = background

    local rebirthLabel = Instance.new("TextLabel")
    rebirthLabel.Size = UDim2.new(1, 0, 0, 40)
    rebirthLabel.Position = UDim2.new(0, 0, 0.25, 0)
    rebirthLabel.BackgroundTransparency = 1
    rebirthLabel.Text = "Rebirths: Loading..."
    rebirthLabel.TextColor3 = Color3.new(1, 1, 1)
    rebirthLabel.TextScaled = true
    rebirthLabel.Font = Enum.Font.SourceSansItalic
    rebirthLabel.Parent = background

    local countLabel = Instance.new("TextLabel")
    countLabel.Size = UDim2.new(1, 0, 0, 40)
    countLabel.Position = UDim2.new(0, 0, 0.35, 0)
    countLabel.BackgroundTransparency = 1
    countLabel.Text = "Tiles: Loading..."
    countLabel.TextColor3 = Color3.new(1, 1, 1)
    countLabel.TextScaled = true
    countLabel.Font = Enum.Font.SourceSansItalic
    countLabel.Parent = background

    local coinsLabel = Instance.new("TextLabel")
    coinsLabel.Size = UDim2.new(1, 0, 0, 40)
    coinsLabel.Position = UDim2.new(0, 0, 0.45, 0)
    coinsLabel.BackgroundTransparency = 1
    coinsLabel.Text = "Coins: Loading..."
    coinsLabel.TextColor3 = Color3.new(1, 1, 1)
    coinsLabel.TextScaled = true
    coinsLabel.Font = Enum.Font.SourceSansItalic
    coinsLabel.Parent = background

    local footerLabel = Instance.new("TextLabel")
    footerLabel.Size = UDim2.new(1, 0, 0, 30)
    footerLabel.Position = UDim2.new(0, 0, 0.95, -30)
    footerLabel.BackgroundTransparency = 1
    footerLabel.Text = "Made By Hikko"
    footerLabel.TextColor3 = Color3.new(1, 1, 1)
    footerLabel.TextScaled = true
    footerLabel.Font = Enum.Font.SourceSansItalic
    footerLabel.Parent = background

    screenGui.Parent = game:GetService("CoreGui")


    local function formatTime(seconds)
        local hours = math.floor(seconds / 3600)
        local minutes = math.floor((seconds % 3600) / 60)
        local secs = seconds % 60
        return string.format("%02d:%02d:%02d", hours, minutes, secs)
    end
    task.spawn(function()
        while true do
            task.wait(5)
            local elapsed = os.time() - firsttime
            timeLabel.Text = "Player Time: " .. formatTime(elapsed)
            rebirthLabel.Text = "Rebirths: " .. tostring(GetRebirth())
            countLabel.Text = "Tiles: " .. tostring(CountTiles())
            coinsLabel.Text = "Coins: " .. tostring(GetCurrencyAmount())
        end
    end)
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
    
    setthreadidentity(8)
    task.wait(5) 
    gui()
    task.wait(2) 
    _G.deferOptimization = false
    table.clear(_G.unoptimizedDuringDefer)
    _G.StopOpti = false

end

function Event.CollectTiles()

	local Tiles_Invoke = ReplicatedStorage.Network:WaitForChild("Tiles_Invoke")
	local Tiles_Fire = ReplicatedStorage.Network:WaitForChild("Tiles_Fire")

	local tiles = InstancingEventCmds.GetLocal().Tiles
	local currentTime = os.time()

	local config = {
		["TimedVault"] = {
			type = "invoke",
			argName = "LastOpened",
			cooldown = 5 * 60,
			args = function(id) return {id, "Open"} end,
		},
		["PopCatTile"] = {
			type = "invoke",
			argName = "LastOpened",
			cooldown = 20 * 60,
			args = function(id) return {id, "Open"} end,
		},
		["DigLoot"] = {
			type = "invoke",
			argName = "LastOpened",
			cooldown = 20 * 60,
			args = function(id) return {id, "Open"} end,
		},
		["Obby"] = {
			type = "invoke",
			argName = "LastOpened",
			cooldown = 20 * 60,
			args = function(id) return {id, "Open"} end,
		},
		["GiantDiamond"] = {
			type = "invoke",
			argName = "LastClaimed",
			cooldown = 15 * 60,
			args = function(id) return {id, "Tile_ClaimDiamonds"} end,
		},
		["Portal"] = {
			type = "fire",
			argName = "LastClaimed",
			cooldown = 10 * 60,
			args = function(id) return {id, "Claim"} end,
		},
		["StairWayToHeavenTile"] = {
			type = "invoke",
			argName = "LastOpened",
			cooldown = 20 * 60,
			args = function(id) return {id, "Open"} end,
		},
		["Plants"] = {
			type = "plants",
			cooldown = 10 * 60,
			count = 6,
		}
	}

	local function isCooldownReady(last, cd)
		return not last or (currentTime - last) >= cd
	end
    print("[Event] Collecting Tiles")
	for id, tile in pairs(tiles) do
		local vars = tile.SaveVariables
		local dirId = vars and vars.DirId
		local cfg = config[dirId]

		if cfg then
			if cfg.type == "plants" then
				for i = 1, cfg.count do
					local key = "LastClaimed" .. i
					local last = vars[key]
					if isCooldownReady(last, cfg.cooldown) then
						local args = {id, "Claim", i}
						pcall(function()
							Tiles_Invoke:InvokeServer(unpack(args))
						end)
						task.wait(0.5)
					end
				end
			else
				local last = vars[cfg.argName]
				if isCooldownReady(last, cfg.cooldown) then
					local args = cfg.args(id)
					pcall(function()
						if cfg.type == "invoke" then
							Tiles_Invoke:InvokeServer(unpack(args))
						elseif cfg.type == "fire" then
							Tiles_Fire:FireServer(unpack(args))
						end
					end)
					task.wait(0.5)
				end
			end
		end
	end
end





function Event.RunEvent()
    print("[Event] ⏳ Ожидание телепортации в ивент...")
    setthreadidentity(2)
    WaitForEventGround()
    
    print("[Event] ✅ Игрок в ивенте!")
    print("[Loop] 🔧 Проверка апгрейдов...")
    task.spawn(PurchaseUpgrades)
    task.spawn(function()
        while true do
            
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
            task.wait(60)
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












