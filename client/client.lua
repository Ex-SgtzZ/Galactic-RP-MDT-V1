local QBCore = exports['qb-core']:GetCoreObject()

-- Open MDT command
RegisterCommand("mdt", function()
    local Player = QBCore.Functions.GetPlayerData()

    if not HasMDTItem(Player) then
        QBCore.Functions.Notify("You don't have an MDT device.", "error")
        return
    end

    if Player.job.onduty then
        TriggerServerEvent('mdt:requestConfig')
    else
        QBCore.Functions.Notify("You must be on duty to use the MDT.", "error")
    end
end)

-- Receive config from server and open correct NUI skin
RegisterNetEvent('mdt:receiveConfig', function(jobConfig)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open",
        skin = jobConfig.skin,
        permissions = {
            canEditPenalCodes = jobConfig.canEditPenalCodes,
            canManageWarrants = jobConfig.canManageWarrants,
            canManageCourtCases = jobConfig.canManageCourtCases
        }
    })
end)

-- Close MDT from NUI
RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)

-- Admin MDT creation panel
RegisterCommand("mdtcreate", function()
    TriggerServerEvent("mdt:adminCheck")
end)

RegisterNetEvent("mdt:openAdminMDTCreator", function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "openAdmin" })
end)

-- Send new job creation to server
RegisterNUICallback("submitNewJob", function(data, cb)
    TriggerServerEvent("mdt:addJob", data)
    cb("ok")
end)

-- Simple inventory check
function HasMDTItem(Player)
    local hasItem = false
    for k, v in pairs(Player.items) do
        if v.name == Config.RequiredItem then
            hasItem = true
            break
        end
    end
    return hasItem
end
