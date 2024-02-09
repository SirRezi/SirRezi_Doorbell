RegisterServerEvent('doorbell:ringDoorbell')
AddEventHandler('doorbell:ringDoorbell', function()
    local coords = Config.DoorbellCoords
    if coords then
        TriggerClientEvent('doorbell:playSound', -1) -- Alle Clients sollen den Sound abspielen
        TriggerClientEvent('doorbell:notifyPolice', -1, coords)
    end
end)
