if rd.Settings.Command.Enable then
    
    RegisterCommand(rd.Settings.Command.CommandName, function()

        TriggerServerEvent('rd:ScratchGunSerialNumber:Scratch')
    
    end)
    
    Citizen.CreateThread(function()
        local command = rd.Settings.Command.CommandName
        local description = rd.Settings.Command.CommandDescription
    
        TriggerEvent('chat:addSuggestion', '/' ..command.. '', '' ..description.. '')
    end)
end



if rd.Settings.Target.Enable then
    if Strings.Language == 'EN' then
        exports.ox_target:addBoxZone({
            coords = rd.Settings.Target.Coords,
            size = vec3(0.75, 0.75, 2.25),
            rotation = 68.3568,
            debug = drawZones,
            options = {
                {
                    name = 'ScratchGunSerialNumber',
                    event = 'rd:ScratchGunSerialNumber:Scratch',
                    icon = rd.Settings.Target.Icon,
                    label = Strings.EN.en_TargetLabel,
                },
            }
        })
    elseif Strings.Language == 'CZ' then
        exports.ox_target:addBoxZone({
            coords = rd.Settings.Target.Coords,
            size = vec3(0.75, 0.75, 2.25),
            rotation = 68.3568,
            debug = drawZones,
            options = {
                {
                    name = 'ScratchGunSerialNumber',
                    event = 'rd:ScratchGunSerialNumber:Scratch',
                    icon = rd.Settings.Target.Icon,
                    label = Strings.CZ.cz_TargetLabel,
                },
            }
        })
    elseif Strings.Language == 'Custom' then
        exports.ox_target:addBoxZone({
            coords = rd.Settings.Target.Coords,
            size = vec3(0.75, 0.75, 2.25),
            rotation = 68.3568,
            debug = drawZones,
            options = {
                {
                    name = 'ScratchGunSerialNumber',
                    event = 'rd:ScratchGunSerialNumber:Scratch',
                    icon = rd.Settings.Target.Icon,
                    label = Strings.Custom.cus_TargetLabel,
                },
            }
        })
    else 
        print('[ERROR] Language type is not valid!')
    end
end

RegisterNetEvent('rd:ScratchGunSerialNumber:Scratch', function()
    TriggerServerEvent('rd:ScratchGunSerialNumber:Scratch')
end)

RegisterNetEvent('rd:ScratchGunSerialNumber:ProgressBar', function(source)
    if Strings.Language == 'EN' then
        lib.progressBar({
            duration = rd.Settings.ProgressBar.Duration,
            label = Strings.EN.en_ProgressBar,
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
            },
            anim = {
                dict = rd.Settings.Animation.Dict,
                clip = rd.Settings.Animation.Clip,
            },
            prop = {},
        }) 
    elseif Strings.Language == 'CZ' then
        lib.progressBar({
            duration = rd.Settings.ProgressBar.Duration,
            label = Strings.CZ.cz_ProgressBar,
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
            },
            anim = {
                dict = rd.Settings.Animation.Dict,
                clip = rd.Settings.Animation.Clip,
            },
            prop = {},
        }) 
    elseif Strings.Language == 'Custom' then
        lib.progressBar({
            duration = rd.Settings.ProgressBar.Duration,
            label = Strings.CZ.cz_ProgressBar,
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
            },
            anim = {
                dict = rd.Settings.Animation.Dict,
                clip = rd.Settings.Animation.Clip,
            },
            prop = {},
        }) 
    else 
        print('[ERROR] Language type is not valid!')
    end
end)

