-- {{ FX Information }} --
fx_version 'cerulean'
game 'gta5'

-- {{ Resource Information }} --
author 'Respect Development'
description 'Scatch gun serial number'
version '1.3'

-- {{ Manifest }} --
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/Config.lua',
}

client_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'client/main.lua',
}

server_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'server/main.lua',
    'server/updater.lua',
}
