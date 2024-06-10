local password = "kill" -- Set your password here

-- Function to toggle redstone signals
local function toggleRedstone(state)
    redstone.setOutput("back", state) -- Adjust the side based on your setup
    redstone.setOutput("front", state)
end

-- Function to control the redstone signals
local function controlLever()
    print("Enter password to activate/deactivate:")
    local input = read("*")

    if input == password then
        print("Password accepted.")

        local currentStateBack = redstone.getOutput("back")
        local currentStateFront = redstone.getOutput("front")

        if currentStateBack and currentStateFront then
            print("Turning off the lever.")
            toggleRedstone(false)
        else
            print("Turning on the lever.")
            toggleRedstone(true)
        end
    else
        print("Incorrect password. Try again.")
    end
end

while true do
    controlLever()
    sleep(1) -- Add a short delay before prompting again
end
