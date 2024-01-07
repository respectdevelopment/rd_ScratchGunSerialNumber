if Config.UpdateCheck then
    
    CreateThread(function()
        PerformHttpRequest("https://raw.githubusercontent.com//respectdevelopment/rd_ScratchGunSerialNumber/master/version", VersionCheck, "GET")
    end)

    function VersionCheck(err, ResponseVersion, headers)
        local Version = LoadResourceFile(GetCurrentResourceName(), "version")
        
        if Version == ResponseVersion then
            print("^2[INFO] Scratch Gun Serial Number have latest version!")
        else
            print("\n^1----------------------------------------------------------------------------------^7")
            print("^5Scratch Gun Serial Number\n\n^0Latest version is: ^2"..ResponseVersion.."\n^7Your version: ^1"..Version.."^7\n\nUpdate from: ^5https://github.com/respectdevelopment/rd_ScratchGunSerialNumber")
            print("^1----------------------------------------------------------------------------------^7")
        end
    end
end