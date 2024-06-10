-- Defines the password and disk side
local password = "1234"   -- Set your password here (Optional)
local side = "left"       -- Side where the disk drive is connected
local doorSide = "bottom" -- Side where the redstone is connected to the door

-- Function to handle authorization
local function authorization()
    if fs.exists("disk/code.txt") then
        local file = fs.open("disk/code.txt", "r")
        local code = file.readAll():gsub("%s+", "")
        file.close()

        if code == password then
            disk.eject(side)
            rs.setOutput(doorSide, true)
            sleep(3)
            rs.setOutput(doorSide, false)
        else
            disk.eject(side)
        end
    else
        disk.eject(side)
    end

    os.reboot()
end

-- Main function to wait for the disk and check the label
local function main()
    while not disk.isPresent(side) do
        sleep(1)
    end

    local name = disk.getLabel(side)

    if name ~= "keycard" then
        disk.eject(side)
        os.reboot()
    end

    authorization()
end

main()

-- keycardDoors V1.0