local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = ReplicatedStorage:WaitForChild("Network")
local InstancingCmds = require(ReplicatedStorage.Library.Client.PlotCmds.ClientPlot)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local function Teleport(position)
    if LocalPlayer.Character then
        LocalPlayer.Character:MoveTo(position)
    end
end
print("=====================")

local function GetEggMulti()
    for _, tile in pairs(InstancingCmds.GetLocal().Tiles) do
        if tile.Directory and tile.Directory._id == "TierOneEgg" then
            return tile.SaveVariables and tile.SaveVariables.EggMult
        end
    end
end

local InstancingCmdsupvr = require(ReplicatedStorage.Library.Client.CustomEggsCmds)
local eggsCmdsupvr = require(ReplicatedStorage.Library.Client.EggCmds)
local function InitEggData()
    local allEggs = InstancingCmdsupvr.All()
    local mult = GetEggMulti()
    for _, obj in pairs(allEggs) do
        if obj._id == "Block Party Tier One " .. mult .. "x" then
            return obj._position, obj._uid, obj._dir.overrideCost
        end
    end
end

function Hatching(once)
    repeat
        task.wait(1)
        print("Waiting Load Instance")
    until InstancingCmds.IsInInstance()
    local position, uid, cost = InitEggData()

    task.wait(5)
    Teleport(position)

    local maxHatch = eggsCmdsupvr.GetMaxHatch()
    
    local targetEgg = "TierEggOne" --потом заменить на переменную TARGET_EGG

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

    -- Если режим одиночный — выходим
    if once then
        return
    end

    -- Иначе, бесконечный цикл
    while true do
        task.wait(1.73)
        coins = GetCurrencyAmount()

        if cost > 0 and coins >= cost * maxHatch then
            Network:WaitForChild("CustomEggs_Hatch"):InvokeServer(uid, maxHatch)
        end
    end
end
Hatching(true)



