local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = ReplicatedStorage:WaitForChild("Network")
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

