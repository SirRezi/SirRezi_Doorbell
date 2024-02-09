fx_version 'cerulean'
game 'gta5'

author 'SirRezi'
description 'Adds an interactive doorbell system with police dispatch notifications and Roadphone support to FiveM'
version '1.0.0'

client_scripts {
    'client.lua',
    'config.lua'
}

server_script {
    'server.lua',
    'config.lua'
}

shared_script {
    'config.lua'
}

files {
    'sound/sound.wav',
    'playSound.html'
}

ui_page 'playSound.html' 
