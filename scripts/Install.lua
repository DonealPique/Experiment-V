local files = {
    "elavator.lua",
    "keycardsys.lua",
    "levercontroller.lua",
    "mob_grinder.lua",
    "RaphaelOS.lua",
    "TextOnMonitor.lua"
}

local baseURL = "https://raw.githubusercontent.com/DonealPique/Experiment-V/main/scripts/install.lua"

for _, file in ipairs(files) do
    local url = baseURL .. file
    print("Downloading " .. url .. " to " .. file)
    local result = shell.run("wget", url, file)
    if not result then
        print("Failed to download " .. file)
    end
end

print("All scripts and world have been downloaded.")
print("Please restart the computer to apply changes. (Ctrl + R + Enter)")
