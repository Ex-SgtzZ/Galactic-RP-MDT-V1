local QBCore = exports['qb-core']:GetCoreObject()
local MDTJobs = {}

-- Load MDT Jobs from database
CreateThread(function()
    local jobs = MySQL.query.await("SELECT * FROM mdt_jobs")
    for _, job in ipairs(jobs) do
        MDTJobs[job.job] = {
            label = job.label,
            skin = job.skin,
            canEditPenalCodes = job.canEditPenalCodes == 1,
            canManageWarrants = job.canManageWarrants == 1,
            canManageCourtCases = job.canManageCourtCases == 1,
        }
    end
end)

-- Send job config to client on MDT open
RegisterServerEvent('mdt:requestConfig')
AddEventHandler('mdt:requestConfig', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local job = Player.PlayerData.job.name
    if MDTJobs[job] then
        TriggerClientEvent('mdt:receiveConfig', src, MDTJobs[job])
    elseif Config.MDTJobs[job] then
        TriggerClientEvent('mdt:receiveConfig', src, Config.MDTJobs[job])
    else
        TriggerClientEvent('QBCore:Notify', src, "You are not authorized.", "error")
    end
end)

-- Admin dynamic MDT creation
RegisterServerEvent("mdt:addJob")
AddEventHandler("mdt:addJob", function(data)
    MySQL.insert('INSERT INTO mdt_jobs (job, label, skin, canEditPenalCodes, canManageWarrants, canManageCourtCases) VALUES (?, ?, ?, ?, ?, ?)', {
        data.job, data.label, data.skin, data.canEditPenalCodes and 1 or 0, data.canManageWarrants and 1 or 0, data.canManageCourtCases and 1 or 0
    })
    MDTJobs[data.job] = {
        label = data.label,
        skin = data.skin,
        canEditPenalCodes = data.canEditPenalCodes,
        canManageWarrants = data.canManageWarrants,
        canManageCourtCases = data.canManageCourtCases,
    }
end)

-- Auto Expiration for Warrants
CreateThread(function()
    while true do
        MySQL.query('DELETE FROM mdt_warrants WHERE DATEDIFF(NOW(), created_at) >= ?', { Config.WarrantExpirationDays })
        Wait(24 * 60 * 60 * 1000) -- runs every 24 hours
    end
end)

-- Log function
function LogAction(officer, action, details)
    MySQL.insert('INSERT INTO mdt_logs (officer, action, details) VALUES (?, ?, ?)', {
        officer, action, details
    })
end

-- Example Arrest Report Save (expand with your NUI frontend)
RegisterServerEvent("mdt:saveArrestReport")
AddEventHandler("mdt:saveArrestReport", function(reportData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    MySQL.insert('INSERT INTO mdt_arrests (citizenid, officer, charges, details) VALUES (?, ?, ?, ?)', {
        reportData.citizenid, Player.PlayerData.name, reportData.charges, reportData.details
    })
    LogAction(Player.PlayerData.name, "Arrest Report", json.encode(reportData))
end)

-- You would build similar events for tickets, warrants, court cases etc.
