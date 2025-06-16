repeat task.wait() until game:IsLoaded()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local library = require(game.ReplicatedStorage.Library.Client.Save)
local save = library.Get()

local time = _G.TIME_UPDATE or 10
local webhook = _G.URL
local function sendWebhook(arg1,arg2,arg3,arg4,arg5)
    local data = {
	['content'] = 'Update every '.. time .. ' minutes',
    ["embeds"] = {{
		title = "Huges: " .. arg1 .. "\nNuclear Dominus: " .. arg2 .. "\nNightmare Cyclops: " .. arg3 .. "\nArcade Angelus: " .. arg4 .. "\nGifts: " .. arg5,
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
	local event1 = 0
	local event2 = 0
	local event3 = 0
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
			event1+=1
		end
		if v.id == 'Nightmare Cyclops' then 
			event2+=1
		end
		if v.id == 'Arcade Angelus' then 
			event3+=1
		end
	end
	sendWebhook(huge,event1,event2,event3,gift)
end
while task.wait(time*60) do
	check()
end
