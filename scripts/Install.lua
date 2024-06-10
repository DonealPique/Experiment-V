local files = {
    "elavator.lua",
    "keycardsys.lua",
    "levercontroller.lua",
    "mob_grinder.lua",
    "RaphaelOS.lua",
    "TextOnMonitor.lua"
}

local baseURL = "https://raw.githubusercontent.com/DonealPique/Experiment-V/main/scripts/"
local worldURL = "https://drive.google.com/uc?export=download&id=1QTTchrM8epDm188MYBwzM2LN87Z9Ez4p"

for _, file in ipairs(files) do
    local url = baseURL .. file
    print("Downloading " .. url .. " to " .. file)
    local result = shell.run("wget", url, file)
    if not result then
        print("Failed to download " .. file)
    end
end

shell.run("wget", worldURL, "Experiment_V.zip")

print("All scripts and world have been downloaded.")
print("Please restart the computer to apply changes. (Ctrl + R + Enter)")
