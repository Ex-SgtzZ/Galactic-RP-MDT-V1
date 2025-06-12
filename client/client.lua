local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand(Config.Commands.openMDT, function()
    local Player = QBCore.Functions.GetPlayerData()
    local hasItem = exports['qb-inventory']:HasItem(Config.MDTItem)

    if not hasItem then
        return QBCore.Functions.Notify("You need an MDT device to open this.", "error")
    end

    local skin = Config.Jobs[Player.job.name] and Config.Jobs[Player.job.name].skin or "default"
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openMDT",
        skin = skin
    })
end)
