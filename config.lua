Config = {}

Config.MDTItem = "mdt_tablet"

Config.Jobs = {
    ["police"] = {
        label = "Police Department",
        skin = "police",
        permissions = {
            ManagePenalCodes = true,
            ManageWarrants = true,
            ManageBOLOs = true,
            ManageReports = true
        }
    },
    ["ems"] = {
        label = "EMS",
        skin = "ems",
        permissions = {
            ManageReports = true
        }
    },
    ["doc"] = {
        label = "Corrections",
        skin = "doc",
        permissions = {
            ManageWarrants = false,
            ManageBOLOs = false,
            ManageReports = true
        }
    },
    ["doj"] = {
        label = "Department of Justice",
        skin = "doj",
        permissions = {
            ManagePenalCodes = true,
            ManageWarrants = true,
            ManageBOLOs = true,
            ManageReports = true
        }
    }
}

Config.Commands = {
    openMDT = "mdt",
    openMDTAdmin = "mdtcreate",
}
return Config
