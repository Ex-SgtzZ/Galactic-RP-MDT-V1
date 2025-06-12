fx_version 'cerulean'
game 'gta5'

author 'Galactic MDT v1.0'
description 'QBCore MDT v1.0'
version '3.7'

shared_script 'config.lua'

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/skins/*.html'
}
