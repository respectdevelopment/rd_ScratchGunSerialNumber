local Webhook = "https://discord.com/api/webhooks/1193289844047225054/oE_qNeYrxm9l_CqfEuEEhGk_Z4TQMOT6m2hTk9MUq-wJ41NhhzW5I8t4gxwDfKtd0xg6"

ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('rd:ScratchGunSerialNumber:Scratch')
AddEventHandler('rd:ScratchGunSerialNumber:Scratch', function()

    local source = source
    local WeaponName = exports.ox_inventory:GetCurrentWeapon(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    Wait(500)

    print(WeaponName)

    if WeaponName ~= nil then
        
        local SerialNumber = WeaponName.metadata.serial
        if Config.NeedItem.Enable then
            if xPlayer ~= nil then
                
                local itemQuantity = xPlayer.getInventoryItem(Config.NeedItem.ItemName).count

                if itemQuantity >= Config.NeedItem.ItemCount then

                    if Config.NeedItem.DeleteItemAfterUse then
                        xPlayer.removeInventoryItem(Config.NeedItem.ItemName, Config.NeedItem.ItemCount)
                    end


                    TriggerClientEvent('rd:ScratchGunSerialNumber:ProgressBar', source)
                    Wait(Config.ProgressBar.Duration)
                    TriggerClientEvent('rd:scratchgunserialnumber:notify', source, TranslateCap('Notification_Title'), TranslateCap('Serial_Number_Was_Scratched'))
                    WeaponName.metadata.serial = TranslateCap('New_Serial_Number')
                    exports.ox_inventory:SetMetadata(source, WeaponName.slot, WeaponName.metadata)

                    Wait(10000)

                    if Config.DiscordLogs.Enable then
                        
                        local steamid = false
                        local discoConfig = false
            
                        for k,v in pairs(GetPlayerIdentifiers(source))do            
                            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                                steamid = v
                            elseif string.sub(v, 1, string.len("discoConfig:")) == "discoConfig:" then
                                discoConfig = v
                            end     
                        end
            
                        local playerName = GetPlayerName(source)
                        local date = os.date("%H:%M - %d/%m/%Y")
                        local footer = Config.DiscordLogs.Footer 
                        local template = Config.DiscordLogs.Description  
            
                        local replacements = {
                            ["{NAME}"] = playerName,
                            ["{SERIAL-NUMBER}"] = SerialNumber,
                            ["{STEAM}"] = steamid,
                            ["{DISCOConfig}"] = discoConfig,
                        }
            
                        local pattern = "{(.-)}"
                        local result = template:gsub(pattern, function(key)
                            return replacements['{' .. key .. '}'] or key
                        end)
                
                        local DiscoConfigLog = {
                            {
                                ["color"] = Config.DiscordLogs.Colour,
                                ["title"] = Config.DiscordLogs.Title,
                                ["description"] = result,
                                ["footer"] = {
                                    ["text"] = "Respect Development 〢 " ..date.. "",
                                    ["icon_url"] = "https://media.discordapp.net/attachments/627098670021607444/1189648805767946280/rsz_1rsz_screenshot_3.png?ex=659eedc9&is=658c78c9&hm=46b027b12319ca1b93531bc0ecd8429bc67c3a0cb1c2065671b5ef694901cf34&=&format=webp&quality=lossless",
                                },
                            }
                        }
                        PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({ username = Config.DiscordLogs.WebhookName, embeds = DiscoConfigLog, avatar_url = "https://media.discordapp.net/attachments/627098670021607444/1189648805767946280/rsz_1rsz_screenshot_3.png?ex=659eedc9&is=658c78c9&hm=46b027b12319ca1b93531bc0ecd8429bc67c3a0cb1c2065671b5ef694901cf34&=&format=webp&quality=lossless" }), { ['Content-Type'] = 'application/json' })
                    end

                else    
                    TriggerClientEvent('rd:scratchgunserialnumber:notify', source, TranslateCap('Notification_Title'), TranslateCap('You_Dont_Have_Item'))
                end
            end
        else
            TriggerClientEvent('rd:scratchgunserialnumber:notify', source, TranslateCap('Notification_Title'), TranslateCap('Serial_Number_Was_Scratched'))
            Wait(1500)
            WeaponName.metadata.serial = TranslateCap('New_Serial_Number')
            exports.ox_inventory:SetMetadata(source, WeaponName.slot, WeaponName.metadata)

            Wait(10000)

            if Config.DiscordLogs.Enable then
                        
                local steamid = false
                local discoConfig = false
    
                for k,v in pairs(GetPlayerIdentifiers(source))do            
                    if string.sub(v, 1, string.len("steam:")) == "steam:" then
                        steamid = v
                    elseif string.sub(v, 1, string.len("discoConfig:")) == "discoConfig:" then
                        discoConfig = v
                    end     
                end
    
                local playerName = GetPlayerName(source)
                local date = os.date("%H:%M - %d/%m/%Y")
                local footer = Config.DiscordLogs.Footer 
                local template = Config.DiscordLogs.Description  
    
                local replacements = {
                    ["{NAME}"] = playerName,
                    ["{SERIAL-NUMBER}"] = SerialNumber,
                    ["{STEAM}"] = steamid,
                    ["{DISCOConfig}"] = discoConfig,
                }
    
                local pattern = "{(.-)}"
                local result = template:gsub(pattern, function(key)
                    return replacements['{' .. key .. '}'] or key
                end)
        
                local DiscoConfigLog = {
                    {
                        ["color"] = Config.DiscordLogs.Colour,
                        ["title"] = Config.DiscordLogs.Title,
                        ["description"] = result,
                        ["footer"] = {
                            ["text"] = "Respect Development 〢 " ..date.. "",
                            ["icon_url"] = "https://media.discordapp.net/attachments/627098670021607444/1189648805767946280/rsz_1rsz_screenshot_3.png?ex=659eedc9&is=658c78c9&hm=46b027b12319ca1b93531bc0ecd8429bc67c3a0cb1c2065671b5ef694901cf34&=&format=webp&quality=lossless",
                        },
                    }
                }
                PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({ username = Config.DiscordLogs.WebhookName, embeds = DiscoConfigLog, avatar_url = "https://media.discordapp.net/attachments/627098670021607444/1189648805767946280/rsz_1rsz_screenshot_3.png?ex=659eedc9&is=658c78c9&hm=46b027b12319ca1b93531bc0ecd8429bc67c3a0cb1c2065671b5ef694901cf34&=&format=webp&quality=lossless" }), { ['Content-Type'] = 'application/json' })
            end
        end

        

    else
        Wait(1500)
        TriggerClientEvent('rd:scratchgunserialnumber:notify', source, TranslateCap('Notification_Title'), TranslateCap('You_Need_Keep_Gun'))
    end
end)






