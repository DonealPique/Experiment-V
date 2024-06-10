local files = {
    "elavator.lua",
    "keycardsys.lua",
    "levercontroller.lua",
    "mob_grinder.lua",
    "RaphaelOS.lua",
    "TextOnMonitor.lua"
}

local baseURL = "https://raw.githubusercontent.com/DonealPique/Experiment-V/main/scripts/lua"
local worldURL = "https://drive.google.com/uc?export=download&id=1QTTchrM8epDm188MYBwzM2LN87Z9Ez4p"

local function downloadFile(fileName)
    local url = baseURL .. fileName
    print("Downloading " .. fileName .. " from " .. url .. "...")
    local response = http.get(url)
    
    if response then
        local script = response.readAll()
        response.close()
        
        local file = fs.open("/" .. fileName, "w")
        if file then
            file.write(script)
            file.close()
            print("Downloaded and saved as " .. fileName)
            return true
        else
            print("Error: Could not save " .. fileName .. ". Please check if the file system is writable.")
            return false
        end
    else
        print("Failed to download " .. fileName .. ". Check the URL and try again.")
        return false
    end
end

local allSuccessful = true
for _, file in ipairs(files) do
    if not downloadFile(file) then
        allSuccessful = false
    end
end

print("Downloading world file...")
local success = shell.run("wget", worldURL, "Experiment V.zip")
if not success then
    print("Failed to download world file.")
else
    print("Successfully downloaded world file.")
end
