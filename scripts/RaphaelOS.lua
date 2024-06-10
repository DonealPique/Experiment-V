-- Raphael OS v1.0 (Might change in the future)

local monitor = peripheral.wrap("right") -- Adjust based on your monitor's position
local password = "kysNow"                -- Set your self-destruct password
local running = true

-- Function to display text on the monitor
local function writeToMonitor(text)
    monitor.clear()
    monitor.setCursorPos(15, 9)
    monitor.write(text)
end

-- Function to draw a button
local function drawButton(label, x, y, w, h, color)
    monitor.setBackgroundColor(color)
    for i = 0, h - 1 do
        monitor.setCursorPos(x, y + i)
        monitor.write(string.rep(" ", w))
    end
    local labelX = x + math.floor((w - #label) / 2)
    local labelY = y + math.floor(h / 2)
    monitor.setCursorPos(labelX, labelY)
    monitor.setBackgroundColor(colors.black)
    monitor.write(label)
end

-- Function to clear the monitor
local function clearMonitor()
    monitor.clear()
    monitor.setCursorPos(1, 1)
end

-- Function to handle the main menu
local function mainMenu()
    clearMonitor()
    drawButton("View Files", 2, 3, 20, 3, colors.green)
    drawButton("View Locations", 2, 7, 20, 3, colors.green)
    drawButton("Self Destruct", 2, 11, 20, 3, colors.red)
    drawButton("Shutdown", 2, 15, 20, 3, colors.green)
    monitor.setCursorPos(1, 19)
    monitor.write("Click on an option")
end

-- Function to display personal files
local function viewFiles()
    clearMonitor()
    monitor.setCursorPos(1, 1)
    monitor.write("Personal Files")
    monitor.setCursorPos(1, 3)
    monitor.write("1. my diary")
    monitor.setCursorPos(1, 4)
    monitor.write("2. Work docs")
    monitor.setCursorPos(1, 6)
    monitor.write("Press any key to return")
    os.pullEvent("key")
end

-- Function to display locations
local function viewLocations()
    clearMonitor()
    monitor.setCursorPos(1, 1)
    monitor.write("Locations")
    monitor.setCursorPos(1, 3)
    monitor.write("1. The Factory")
    monitor.setCursorPos(1, 4)
    monitor.write("2. The Slaughterhouse")
    monitor.setCursorPos(1, 5)
    monitor.write("3. The village")
    monitor.setCursorPos(1, 6)
    monitor.write("4. The mine shaft")
    monitor.setCursorPos(1, 8)
    monitor.write("Press any key to return")
    os.pullEvent("key")
end

-- Function to handle self destruct
local function selfDestruct()
    clearMonitor()
    writeToMonitor("Enter password:")
    local input = read("*")
    if input == password then
        clearMonitor()
        writeToMonitor("Sequence initiated.")
        sleep(5)
        redstone.setOutput("back", true)
        sleep(1)
        redstone.setOutput("back", false)
        os.shutdown()
    else
        clearMonitor()
        writeToMonitor("Incorrect password.")
        sleep(2)
    end
end

-- Function to handle system shutdown
local function shutdownSystem()
    clearMonitor()
    writeToMonitor("Shutting down...")
    sleep(2)
    clearMonitor()
    monitor.setBackgroundColor(colors.black)
    monitor.clear()
    os.shutdown()
end

-- Function to display welcome screen
local function welcomeScreen()
    clearMonitor()
    writeToMonitor("Welcome to Raphael OS")
    sleep(3)
end

welcomeScreen()
while running do
    mainMenu()
    local event, side, x, y = os.pullEvent("monitor_touch")
    if x >= 2 and x <= 21 then
        if y >= 3 and y <= 5 then
            viewFiles()
        elseif y >= 7 and y <= 9 then
            viewLocations()
        elseif y >= 11 and y <= 13 then
            selfDestruct()
        elseif y >= 15 and y <= 17 then
            shutdownSystem()
        end
    end
end
