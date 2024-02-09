fx_version 'cerulean'
game 'gta5'

author 'Ihr Name'
description 'Beschreibung Ihrer Ressource'
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
    'sound/sound.wav', -- Stellen Sie sicher, dass diese Datei im Ordner "sound" vorhanden ist
    'playSound.html' -- Fügen Sie diese Datei hinzu, wenn Sie sie verwenden
}

ui_page 'playSound.html' -- Stellen Sie sicher, dass der Dateiname korrekt ist, falls Sie eine verwenden
