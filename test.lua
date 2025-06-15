repeat task.wait() until game:IsLoaded()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local library = require(game.ReplicatedStorage.Library.Client.Save)
local save = library.Get()

local time = _G.TIME_UPDATE or 10
local webhook = _G.URL
local function sendWebhook(arg1,arg2,arg3)
    local data = {
	['content'] = 'Update every '.. _G.TIME_UPDATE .. ' minutes',
    ["embeds"] = {{
		title = "Huges: " .. arg1 .. "\nDominus: " .. arg2 .. "\nGifts: " .. arg3,
		footer = { text = "Made by Hikko" }
	}}
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)

    local headers = {
    ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = webhook, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
end
local function check()
	local event = 0
	local huge = 0
	local gift = 1
	for i,v in save.Inventory.Pet do
		if string.find(v.id, 'Huge') then
			huge+=1
		end
	end
	for i,v in save.Inventory.Lootbox do
		if v.id == 'Tower Defense Gift' then 
			gift = v._am
		end
	end
	for i,v in save.Inventory.Tower do
		if v.id == 'Nuclear Dominus' then 
			event+=1
		end
	end
	sendWebhook(huge,event,gift)
end
while task.wait(time*60) do
	check()
end
