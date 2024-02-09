RegisterNetEvent('doorbell:playSound')
AddEventHandler('doorbell:playSound', function()
    SendNUIMessage({
        sound = true,
        src = "sound/sound.wav"
    })
end)

local ringing = false
local doorbellMarker = nil

RegisterNetEvent('doorbell:ring')
AddEventHandler('doorbell:ring', function()
    if not ringing then
        ringing = true
        TriggerEvent("chatMessage", Config.DoorbellMessage, {255, 255, 255})
        
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                if IsControlJustReleased(0, Config.DoorbellKey) then
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    TriggerServerEvent('doorbell:ringDoorbell', playerCoords)
                    Citizen.Wait(5000)
                    ringing = false
                    break
                end
            end
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - Config.DoorbellCoords)

        if distance < 10.0 then
            if doorbellMarker == nil then
                doorbellMarker = true
                DrawMarker(1, Config.DoorbellCoords.x, Config.DoorbellCoords.y, Config.DoorbellCoords.z - 1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 0.5, 255, 255, 0, 200, false, true, 2, nil, nil, false)
            end
        else
            if doorbellMarker ~= nil then
                doorbellMarker = nil
            end
        end

        if distance < 1.5 and IsControlJustReleased(0, Config.DoorbellKey) then
            TriggerEvent('doorbell:ring')
        end
    end
end)

RegisterNetEvent('doorbell:notifyPolice')
AddEventHandler('doorbell:notifyPolice', function(coords)
    if coords then
        local jobReceived = Config.DispatchJob or "police"
        local message = Config.DispatchMessage or "We have a doorbell ring at " .. coords.x .. ", " .. coords.y .. ", " .. coords.z

        TriggerServerEvent('roadphone:sendDispatch', GetPlayerServerId(PlayerId()), message, jobReceived, coords, Config.RoadphoneAnonymous)
    end
end)
