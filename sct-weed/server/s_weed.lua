ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('sct-weed:giveweed')
AddEventHandler('sct-weed:giveweed', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.canCarryItem('esrar_ham', 1)then
        xPlayer.addInventoryItem('esrar_ham', 1)
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
    end
end)

RegisterServerEvent('sct-weed:processweed')
AddEventHandler('sct-weed:processweed', function()
    local src = source
    local xPlayer =ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('esrar_ham').count >= 1 then
        if xPlayer.canCarryItem('esrar_islenmis', 1) then
        xPlayer.removeInventoryItem('esrar_ham', 1)
        Citizen.Wait(500)
        xPlayer.addInventoryItem('esrar_islenmis', 1)
        else
            TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
        end
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde esrar yaprağı yok!')
    end
end)

RegisterServerEvent('sct-weed:processweed2')
AddEventHandler('sct-weed:processweed2', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('esrar_islenmis').count >= 1 then
        if xPlayer.canCarryItem('esrar_islenmis2', 1) then
            xPlayer.removeInventoryItem('esrar_isşenmis', 1)
            Citizen.Wait(500)
            xPlayer.addInventoryItem('esrar_islenmis2', 1)
        else
            TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
        end
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde ayıklanmış esrar yok!')
    end
end)

RegisterServerEvent('sct-weed:packweed')
AddEventHandler('sct-weed:sellweed', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('esrar_islenmis2').count >= 1 then
        if xPlayer.getInventoryItem('poset').count >= 1 then
            if xPlayer.canCarryItem('esrar_paketlenmis', 1) then
                xPlayer.removeInventoryItem('poset', 1)
                Citizen.Wait(250)
                xPlayer.removeInventoryItem('esrarislenmis2', 1)
                Citizen.Wait(250)
                xPlayer.addInventoryItem('esrar_paketlenmis', 1)
            else
                TriggerClientEvent('esx:showNotification', src , 'Üzerinde bunu taşıyacak yer yok!')
            end
        else
            TriggerClientEvent('esx:showNotification', src, 'üzerinde yeterl, poşet yok!')
        end
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde kurutulmuş esrar yok!')
    end
end)

RegisterServerEvent('sct-weed:sellweed')
AddEventHandler('sct-weed:sellweed', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local money = math.random(Config.MinEsrarPara, Config.MaxEsrarPara)
    if xPlayer.getInventoryItem('esrar_paketlenmis', 1).count >= 1 then
        xPlayer.removeInventoryItem('esrar_paketlenmis', 1)
        Citizen.Wait(500)
        if Config.BlackMoney then
            xPlayer.addAccountMoney('black_money', money)
        else
            xPlayer.addMoney(money)
        end
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde paketlenmiş esrar yok!'
    end
end)
