rd = {}

rd.Settings = {

    Command = {
        Enable = true,

        CommandName = 'scratchgunserial', -- Command, wich scatch the serial number
        CommandDescription = 'Scratch your gun serial number!' -- Command description
    },

    Target = { -- Require ox_target!
        Enable = true,
        Icon = 'fa-solid fa-gun', -- Target Icon
        Coords = vec3(1394.0, 3611.0, 38.8) -- Target Location
    },

    Animation = {
        Dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Clip = 'machinic_loop_mechandplayer',
    },

    ProgressBar = {
        Duration = 5000, -- Duration: 1000 = 1 second
    },

    Notification = 'ESX', -- Type: ESX, OKOK, OXLIB, CUSTOM
}

rd.NeedItem = {
    Enable = true,
    DeleteItemAfterUse = true, -- Delete item after use: true/false

    ItemName = 'lockpick', -- Item Name
}

-- If you need help with notifications, join the discord server and open a ticket.
-- Discord: https://discord.gg/SfjrAQzamD
RegisterNetEvent('rd:scratchgunserialnumber:notify')
AddEventHandler('rd:scratchgunserialnumber:notify', function(title, message)
    if rd.Settings.Notification == 'ESX' then
        ESX = exports['es_extended']:getSharedObject()
        ESX.ShowNotification(message)
    elseif rd.Settings.Notification == 'OKOK' then
        exports['okokNotify']:Alert(title, message, 3000, 'information', playSound)
    elseif rd.Settings.Notification == 'OXLIB' then
        lib.notify({
            title = title,
            description = message,
            type = 'inform'
        })
    elseif rd.Settings.Notification == 'CUSTOM' then
        print('[WARNING] Set your own notification in shared/config.lua at line 35.') 
        -- Set your own notifications here.
    else
        print('[ERROR] Your notification type is not valid.')
    end
end)


