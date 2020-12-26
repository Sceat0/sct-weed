ESX = nil
TriggerEvent('esx:gerSharedObject',function(obj) ESX = obj end)

ESX.RegisterServerCallback('sct-weed:malzemekontrol', function(source, cb, item, gereklisayi))
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemcount = xPlayer.getInventoryItem(item).count
    local itemname =xPlayer.getInventoryItem(item).label
    if itemcount >=gereklisayi then
        cb(true)
    else
        activity = 0
        TriggerClientEvent('esx:showNotification', source,'Üzerinde yeterli '..itemname..' yok!')
    end
end)

RegisterServerEvent('sct-weed:removeitem')
AddEventHandler('sct-weed:removeitem', function(item, count)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.removeInventoryItem(item, count)
end)
