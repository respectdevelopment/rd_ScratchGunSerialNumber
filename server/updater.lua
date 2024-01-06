local updatePath
local resourceName

CheckVersion = function(err, response, headers)
    local curVersion = LoadResourceFile(GetCurrentResourceName(), "version")
	if response == nil then print("^1"..resourceName.." check for updates failed ^7") return end
    if curVersion ~= nil and response ~= nil then
		if curVersion == response then Color = "^2" else Color = "^1" end
        print("\n^1----------------------------------------------------------------------------------^7")
        print("^5Scratch Gun Serial Number\n\n^0Latest version is: ^2"..response.."\n^7Your version: "..Color..""..curVersion.."^7\n\nUpdate from: ^5https://github.com"..updatePath.."")
        print("^1----------------------------------------------------------------------------------^7")
    end
end

CreateThread(function()
	updatePath = "/respectdevelopment/rd_ScratchGunSerialNumber"
	PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/version", CheckVersion, "GET")
end)