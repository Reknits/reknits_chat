ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterCommand('twt', function(source, args, rawCommand)
    local playerName = GetCharacterName(source)
    local msg = rawCommand:sub(4)
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.8vw; margin: 1.0vw; background-color: rgba(62, 174, 244, 0.7);border-radius:12px;">^0<i class="fab fa-twitter" size: 7x></i> @{0}^0:<br>{1}</br></div>',
        args = { playerName, msg }
    })
end, false)

RegisterCommand('unicorn321', function(source, args, rawCommand)
    local playerName = GetCharacterName(source)
    local msg = rawCommand:sub(11)
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.8vw; margin: 1.0vw; background-color: rgba(216, 45, 199, 0.7);border-radius:12px;">^0<i class="far fa-calendar-check" size: 7x></i> ^0Unicorn:<br>{0}</br></div>',
        args = { msg }
    })
end, false)

RegisterCommand('kallekuken666',function(source, args, rawCommand)
   local name = GetCharacterName(source)
    local msg = rawCommand:sub(14)
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.8vw; margin: 0.8vw;background-color: rgba(178, 23, 56, 0.6);border-radius:12px;">^0<i class="fab fa-angellist" size: 12x></i> ^0Supreme Commander:<br>{0}</br> </div>',
        args = { msg }
    })
end, false)

RegisterCommand('ooc', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.8vw; margin: 1.0vw; background-color: rgba(177, 239, 185, 0.7);border-radius:12px;">^0<i class="fas fa-globe" size: 7x></i> {0}:<br>{1}</br></div>',
        args = { playerName, msg }
    })
end, false)



function GetCharacterName(source)
    local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifiers(source)[1]
    })

    if result[1] and result[1].firstname and result[1].lastname then
        if Config.OnlyFirstname then
            return result[1].firstname
        else
            return ('%s %s'):format(result[1].firstname, result[1].lastname)
        end
    else
        return GetPlayerName(source)
    end
end
