repeat task.wait() until game:IsLoaded()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local library = require(game.ReplicatedStorage.Library.Client.Save)
local save = library.Get()

local webhook = _G.URL
local function sendWebhook(arg1,arg2)
    local data = {
    ["embeds"] = {{
		title = "Huges: " .. arg1 .. "\nAngeluses: " .. arg2,
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
	local angelus = 0
	local huge = 0
	for i,v in save.Inventory.Pet do
		if string.find(v.id, 'Huge') then
			huge+=1
		end
		if v.id == 'Black Hole Angelus Ball' then
			local k = 0
			for x,z in v do
				if x == 'pt' then
					k+=1
				end
			end
			if k==0 then
				angelus+=v._am
			end
		end
	end
	print(huge, angelus)
	sendWebhook(huge,angelus)
end
while task.wait(600) do
	check()
end
