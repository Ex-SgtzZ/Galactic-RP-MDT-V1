fx_version 'cerulean'
game 'gta5'

author 'ChatGPT MDT 3.5 System'
description 'Universal MDT Framework v3.5'
version '3.5'

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/js/*.js',
    'nui/skins/*.html',
}