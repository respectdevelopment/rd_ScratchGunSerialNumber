-- {{ FX Information }} --
fx_version 'cerulean'
game 'gta5'

-- {{ Resource Information }} --
author 'Respect Development'
description 'Scatch gun serial number'
version '1.0.1'

-- {{ Manifest }} --
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/Config.lua',
    'shared/Strings.lua',
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    'server/main.lua',
    'shared/DiscordLogs.lua',
}
