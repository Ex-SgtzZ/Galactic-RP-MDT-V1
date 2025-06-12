# Galactic RP MDT v3.5 for QBCore Framework

## Overview

This MDT (Mobile Data Terminal) system supports multiple jobs with customizable skins and permissions.  
It includes:

- Arrests, Warrants, Tickets, Court Cases  
- Penal Code Management (restricted by job grade)  
- Dynamic MDT creation by ACE permission users  
- Inventory item requirement (`mdt`) to access MDT  
- Job-based different MDT UI skins (Police, EMS, DOJ, DOC)  

---

## Installation

### 1. Database

- Import `sql/install.sql` into your MySQL database.

### 2. Resource Setup

- Place the entire `galacticRP_MDT_V3.5` folder inside your server’s `resources` directory.

### 3. Config

- Open `config.lua` and customize jobs, permissions, and item name (`mdt` by default).

### 4. Add MDT Item

- Ensure the item used to open the MDT (default: `mdt`) exists in your inventory system.

### 5. Add to Server.cfg
- ensure mdt_v3.5

### 6. Restart your server

---

## Usage

- Players with proper jobs and on-duty can open MDT with `/mdt` command if they have the MDT device item.  
- Admins or ACE permission holders can run `/mdtcreate` to open an NUI to add new MDT jobs dynamically.  
- MDT UI changes depending on job — Police, EMS, DOJ, DOC, etc.  

---

## Permissions

- Permissions to edit penal codes, manage warrants, and court cases are job-based and set in `config.lua`.  
- Admin MDT creation is ACE permission protected.

---

## Troubleshooting

- MDT will not open if the player is not on duty or doesn’t have the MDT device item.  
- Check your database import if tables do not exist or data isn't saved.  
- Make sure `qb-core` is installed and updated.  
- Check console for Lua errors.

---

## Customization

- Customize the UI skins in `nui/skins/*.html`.  
- Modify the arrest report template in `config.lua`.  
- Add more jobs by the admin NUI or manually in the database.

---

## Credits

Developed by Galactic RP  
Powered by QBCore Framework

---

Feel free to contribute and improve!

---


