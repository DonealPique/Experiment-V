local files = {
    "elavator.lua",
    "keycardsys.lua",
    "levercontroller.lua",
    "mob_grinder.lua",
    "RaphaelOS.lua",
    "TextOnMonitor.lua"
}


local baseURL = "https://raw.githubusercontent.com/DonealPique/Experiment-V/main/scripts/install.lua"
local worldURL = "https://drive.google.com/file/d/1QTTchrM8epDm188MYBwzM2LN87Z9Ez4p/view?usp=sharing"

for _, file in ipairs(files) do
    local url = baseURL .. file
    shell.run("wget", url, file)
end

shell.run("wget", worldURL, "Experiment V.zip")

print("All scripts and world have been downloaded.")
print("Please restart the computer to apply changes. (Ctrl + R + Enter)")
