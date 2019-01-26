ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/twt',  "Skicka en tweet",  { { name = "Meddelande", help = "Skicka en tweet" } } )
end)

