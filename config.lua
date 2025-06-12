Config = {}

-- MDT Item required to access system
Config.RequiredItem = 'mdt'

-- Default job MDT permissions (loaded dynamically later from SQL too)
Config.MDTJobs = {
    ['police'] = {
        label = "Police Department",
        skin = "police",
        canEditPenalCodes = true,
        canManageWarrants = true,
        canManageCourtCases = true,
    },
    ['ems'] = {
        label = "Medical Services",
        skin = "ems",
        canEditPenalCodes = false,
        canManageWarrants = false,
        canManageCourtCases = false,
    },
    ['doj'] = {
        label = "Department of Justice",
        skin = "doj",
        canEditPenalCodes = true,
        canManageWarrants = true,
        canManageCourtCases = true,
    },
    ['doc'] = {
        label = "Department of Corrections",
        skin = "doc",
        canEditPenalCodes = false,
        canManageWarrants = true,
        canManageCourtCases = false,
    },
}

-- Arrest Report Template
Config.ArrestTemplate = [[
ARREST REPORT

Suspect Name: {suspect}
Date of Arrest: {date}
Arresting Officer: {officer}

Charges:
{charges}

Details of Incident:
{details}

Notes:
{notes}
]]

-- Warrant expiration in days
Config.WarrantExpirationDays = 7
