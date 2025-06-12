📟 QBCore MDT v1.0

A fully modular, multi-job MDT system for QBCore framework.
# ⚠ Dependencies
    ✅ QBCore Framework
    
    ✅ oxmysql (oxmysql/lib/MySQL.lua is used)



# 🚀 Features

    ✅ Per-job UI skins (Police, EMS, DOC, DOJ, etc.)

    ✅ Configurable permissions for each job

    ✅ Dynamic SQL auto-installer (no manual SQL setup required)

    ✅ Required item system (users need mdt_device item)

    ✅ Fully modular file system

    ✅ Prepared for future expansion into full warrant, report, ticket, and penal code systems

    ✅ Server auto-verifies & creates SQL tables on startup

## 🔧 Installation

    1️ Extract the resourcePlace the extracted galactic_mdt folder into your server's resources/[local]/ folder.

    2️ Add to your server.cfg

    - ensure galactic_mdt

    3️ Run Once
    The resource will automatically verify/create SQL tables on first server start.

    4️ Make sure you have oxmysql properly installed and running.

    All configuration is located in:
    - config.lua


    Jobs: 
    You can add as many jobs as you want here. Example:

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

# Item Requirement

    Users need to have the following item in inventory to access MDT:

   - Config.MDTItem = "mdt_tablet"

   - Make sure you add ``mdt_tablet`` to your inventory system.

# 🖥️ NUI Skins
    Each job has its own separate UI skin stored under:

    html/skins/
    You can freely edit these files to customize the appearance per department:

``police.html``

``ems.html``

``doc.html``

``doj.html``



## 📅 Stuff Planned for v2.0
    Full NUI-based warrant, bolo, and report system

    Dynamic penal code editor

    Case linking between BOLOs, reports, and warrants

    Admin web panel

### 👨‍💻 Author
    Galactic RP and its affiliates
