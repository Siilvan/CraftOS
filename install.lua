function downloadFile(url, filename)
    local response = http.get(url)
    if response then
        local file = fs.open(filename, "w")
        file.write(response.readAll())
        file.close()
        response.close()
        return true
    else
        print("Kon het bestand niet downloaden van " .. url)
        return false
    end
end

local githubUrl = "https://raw.githubusercontent.com/Siilvan/CraftOS/main/chest_monitor.lua"
local localFilename = "chest_monitor.lua"

print("Bezig met downloaden van chest_monitor.lua...")
if downloadFile(githubUrl, localFilename) then
    print("Het bestand is succesvol gedownload als " .. localFilename)
else
    error("Fout bij het downloaden van chest_monitor.lua")
end

local startupContent = "shell.run(\"" .. localFilename .. "\")"
local startupFilename = "startup.lua"

local startupFile = fs.open(startupFilename, "w")
startupFile.write(startupContent)
startupFile.close()
print("startup.lua is aangemaakt.")

print("De computer zal nu herstarten om de chest monitor automatisch te starten.")
os.sleep(2)
os.reboot()
