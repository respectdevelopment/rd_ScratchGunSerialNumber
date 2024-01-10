ESX = exports['es_extended']:getSharedObject()

if Config.Command.Enable then
    
    RegisterCommand(Config.Command.CommandName, function()

        TriggerServerEvent('rd:ScratchGunSerialNumber:Scratch')
    
    end)
    
    Citizen.CreateThread(function()
        local command = Config.Command.CommandName
        local description = Config.Command.CommandDescription
    
        TriggerEvent('chat:addSuggestion', '/' ..command.. '', '' ..description.. '')
    end)
end

RegisterNetEvent('rd:ScratchGunSerialNumber:Scratch', function()
    TriggerServerEvent('rd:ScratchGunSerialNumber:Scratch')
end)

RegisterNetEvent('rd:ScratchGunSerialNumber:ProgressBar', function(source)
 
    lib.progressBar({
        duration = (Config.ProgressBar.Duration * 1000),
        label = TranslateCap('Progressbar'),
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
        },
        anim = {
            dict = Config.Animation.Dict,
            clip = Config.Animation.Clip,
        },
        prop = {},
    })
    
end)

local spawnedObjects = {}

RegisterNetEvent('rd:ScratchGunSerialNumber:load')
AddEventHandler('rd:ScratchGunSerialNumber:load', function()
    if Config.EnableLocations then
        for name, Data in pairs(Config.Locations) do 
            for _, coords in pairs(Data.coords) do
                if Config.UseTargetSystem then
                
                    exports.ox_target:addBoxZone({
                        coords = vec3(coords.x, coords.y, coords.z),
                        size = vec3(0.75, 0.75, 2.25),
                        rotation = 68.3568,
                        debug = drawZones,
                        options = {
                            {
                                name = 'ScratchGunSerialNumber',
                                event = 'rd:ScratchGunSerialNumber:Scratch',
                                icon = 'fa-solid fa-gun',
                                label = TranslateCap('Target_Label'),
                            },
                        }
                    })
                else
                    Citizen.CreateThread(function()
                        while true do
                            Wait(7)

                            local ped = PlayerPedId()
                            local pedCoords = GetEntityCoords(ped)
                            local destination = vec3(coords.x, coords.y, coords.z)

                            local dist = #(pedCoords - destination)

                            if dist > 3.0 then
                                Wait(1000)
                            else
                                if dist < 2.0 then
                                    DrawMarker(
                                        Config.Markers.MarkerSprite,
                                        coords.x,
                                        coords.y,
                                        coords.z,
                                        0.0,
                                        0.0,
                                        0.0,
                                        0.0,
                                        0.0,
                                        0.0,
                                        Config.Markers.MarkerSize,
                                        Config.Markers.MarkerSize,
                                        0.6,
                                        Config.Markers.MarkerColor[1],
                                        Config.Markers.MarkerColor[2],
                                        Config.Markers.MarkerColor[3],
                                        100,
                                        false,
                                        true,
                                        2,
                                        true,
                                        false,
                                        false,
                                        false
                                    ) 

                                    ESX.ShowHelpNotification(TranslateCap('Help_Bar'))
                                    
                                    if IsControlJustReleased(0, 38) then
                                        TriggerServerEvent('rd:ScratchGunSerialNumber:Scratch')
                                    end
                                end
                            end
                        end
                    end)
                end

            end
        end
    end

end)

Citizen.CreateThread(function()
    TriggerEvent('rd:ScratchGunSerialNumber:load')
end)



