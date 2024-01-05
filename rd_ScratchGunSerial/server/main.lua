ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('rd:ScratchGunSerialNumber:Scratch')
AddEventHandler('rd:ScratchGunSerialNumber:Scratch', function()
    local source = source
    local WeaponName = exports.ox_inventory:GetCurrentWeapon(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    Wait(500)
    if WeaponName ~= nil then
        if rd.NeedItem.Enable then
            if xPlayer ~= nil then
                local itemQuantity = xPlayer.getInventoryItem(rd.NeedItem.ItemName).count
                if itemQuantity >= 1 then
                    if rd.NeedItem.DeleteItemAfterUse then
                        xPlayer.removeInventoryItem(rd.NeedItem.ItemName, 1)
                    end
                    local SerialNumber = WeaponName.metadata.serial
                    if Strings.Language == 'EN' then
                        TriggerClientEvent('rd:ScratchGunSerialNumber:ProgressBar', source)
                        Wait(rd.Settings.ProgressBar.Duration)
                        TriggerClientEvent('rd:scratchgunserialnumber:notify', source, Strings.EN.en_NotificationTitle, Strings.EN.en_NotificationScratchedSerial)
                        Wait(1500)
                        WeaponName.metadata.serial = Strings.EN.en_SerialNumber 
                        exports.ox_inventory:SetMetadata(source, WeaponName.slot, WeaponName.metadata)
                    elseif Strings.Language == 'CZ' then
                        TriggerClientEvent('rd:scratchgunserialnumber:notify', source, Strings.CZ.cz_NotificationTitle, Strings.CZ.cz_NotificationScratchedSerial)
                        Wait(1500)
                        WeaponName.metadata.serial = Strings.CZ.cz_SerialNumber
                        exports.ox_inventory:SetMetadata(source, WeaponName.slot, WeaponName.metadata)
                    elseif Strings.Language == 'Custom' then
                        TriggerClientEvent('rd:scratchgunserialnumber:notify', source, Strings.Custom.cus_NotificationTitle, Strings.Custom.cus_NotificationScratchedSerial)
                        Wait(1500)
                        WeaponName.metadata.serial = Strings.Cus.cus_SerialNumber 
                        exports.ox_inventory:SetMetadata(source, WeaponName.slot, WeaponName.metadata)
                    else
                        print('[ERROR] Your language type is not valid!')
                    end

                    if Logs.DiscordLogs.Enable then
                        
                        local steamid = false
                        local discord = false

                        for k,v in pairs(GetPlayerIdentifiers(source))do            
                            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                                steamid = v
                            elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                                discord = v
                            end     
                        end

                        local playerName = GetPlayerName(source)
                        local date = os.date("%H:%M - %d/%m/%Y")
                        local footer = Logs.DiscordLogs.Footer 
                        local template = Logs.DiscordLogs.Description  
                        local PlayerIdentifier = xPlayer.getIdentifier()
                        local PlayerCoords = xPlayer.getCoords(useVector)

                        local replacements = {
                            ["{NAME}"] = playerName,
                            ["{SERIAL-NUMBER}"] = SerialNumber,
                            ["{STEAM}"] = steamid,
                            ["{DISCORD}"] = discord,
                        }

                        local pattern = "{(.-)}"
                        local result = template:gsub(pattern, function(key)
                            return replacements['{' .. key .. '}'] or key
                        end)
                
                        local DiscordLog = {
                            {
                                ["color"] = Logs.DiscordLogs.Colour,
                                ["title"] = Logs.DiscordLogs.Title,
                                ["description"] = result,
                                ["footer"] = {
                                    ["text"] = "" ..footer.. " 〢 " ..date.. "",
                                    ["icon_url"] = Logs.DiscordLogs.FooterICON,
                                },
                            }
                        }
                        PerformHttpRequest(Logs.DiscordLogs.Webhook, function(err, text, headers) end, 'POST', json.encode({ username = Logs.DiscordLogs.WebhookName, embeds = DiscordLog, avatar_url = Logs.DiscordLogs.WebhookIcon }), { ['Content-Type'] = 'application/json' })
                    end

                else    
                    if Strings.Language == 'EN' then
                        TriggerClientEvent('rd:scratchgunserialnumber:notify', source, Strings.EN.en_NotificationTitle, Strings.EN.en_YouDontHaveItem)
                    elseif Strings.Language == 'CZ' then
                        TriggerClientEvent('rd:scratchgunserialnumber:notify', source, Strings.CZ.cz_NotificationTitle, Strings.CZ.cz_YouDontHaveItem)
                    elseif Strings.Language == 'Custom' then
                        TriggerClientEvent('rd:scratchgunserialnumber:notify', source, Strings.Custom.cus_NotificationTitle, Strings.Custom.cus_YouDontHaveItem)
                    else
                        print('[ERROR] Your language type is not valid!')
                    end
                end
            end
        else
            if Strings.Language == 'EN' then
                TriggerClientEvent('rd:scratchgunserialnumber:notify', source, Strings.EN.en_NotificationTitle, Strings.EN.en_NotificationScratchedSerial)
                Wait(1500)
                WeaponName.metadata.serial = Strings.EN.en_SerialNumber 
                exports.ox_inventory:SetMetadata(source, WeaponName.slot, WeaponName.metadata)
            elseif Strings.Language == 'CZ' then
                TriggerClientEvent('rd:scratchgunserialnumber:notify', source, Strings.CZ.cz_NotificationTitle, Strings.CZ.cz_NotificationScratchedSerial)
                Wait(1500)
                WeaponName.metadata.serial = Strings.CZ.cz_SerialNumber
                exports.ox_inventory:SetMetadata(source, WeaponName.slot, WeaponName.metadata)
            elseif Strings.Language == 'Custom' then
                TriggerClientEvent('rd:scratchgunserialnumber:notify', source, Strings.Custom.cus_NotificationTitle, Strings.Custom.cus_NotificationScratchedSerial)
                Wait(1500)
                WeaponName.metadata.serial = Strings.Cus.cus_SerialNumber 
                exports.ox_inventory:SetMetadata(source, WeaponName.slot, WeaponName.metadata)
            else
                print('[ERROR] Your language type is not valid!')
            end

            if Logs.DiscordLogs.Enable then
                        
                local steamid = false
                local discord = false

                for k,v in pairs(GetPlayerIdentifiers(source))do            
                    if string.sub(v, 1, string.len("steam:")) == "steam:" then
                        steamid = v
                    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                        discord = v
                    end     
                end

                local playerName = GetPlayerName(source)
                local date = os.date("%H:%M - %d/%m/%Y")
                local footer = Logs.DiscordLogs.Footer 
                local template = Logs.DiscordLogs.Description  
                local PlayerIdentifier = xPlayer.getIdentifier()
                local PlayerCoords = xPlayer.getCoords(useVector)

                local replacements = {
                    ["{NAME}"] = playerName,
                    ["{SERIAL-NUMBER}"] = SerialNumber,
                    ["{STEAM}"] = steamid,
                    ["{DISCORD}"] = discord,
                }

                local pattern = "{(.-)}"
                local result = template:gsub(pattern, function(key)
                    return replacements['{' .. key .. '}'] or key
                end)
        
                local DiscordLog = {
                    {
                        ["color"] = Logs.DiscordLogs.Colour,
                        ["title"] = Logs.DiscordLogs.Title,
                        ["description"] = result,
                        ["footer"] = {
                            ["text"] = "" ..footer.. " 〢 " ..date.. "",
                            ["icon_url"] = Logs.DiscordLogs.FooterICON,
                        },
                    }
                }
                PerformHttpRequest(Logs.DiscordLogs.Webhook, function(err, text, headers) end, 'POST', json.encode({ username = Logs.DiscordLogs.WebhookName, embeds = DiscordLog, avatar_url = Logs.DiscordLogs.WebhookIcon }), { ['Content-Type'] = 'application/json' })
            end
        end
    else
        Wait(1500)
        if Strings.Language == 'EN' then
            TriggerClientEvent('rd:scratchgunserialnumber:notify', source, Strings.EN.en_NotificationTitle, Strings.EN.en_NotificationDontHaveGun)
        elseif Strings.Language == 'CZ' then
            TriggerClientEvent('rd:scratchgunserialnumber:notify', source, Strings.CZ.cz_NotificationTitle, Strings.CZ.cz_NotificationDontHaveGun)
        elseif Strings.Language == 'Custom' then
            TriggerClientEvent('rd:scratchgunserialnumber:notify', source, Strings.Custom.cus_NotificationTitle, Strings.Custom.cus_NotificationDontHaveGun)
        else
            print('[ERROR] Your language type is not valid!')
        end
    end
end)

