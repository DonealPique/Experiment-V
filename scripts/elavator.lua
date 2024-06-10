-- Set your passwords here
local passwordUp = "go_up"
local passwordDown = "go_down"

-- Define the number of floors the elevator will move
local floors = 8

-- Function to move the turtle up
local function moveUp()
    for i = 1, floors do
        if turtle.detectUp() then
            print("Obstacle detected above. Stopping.")
            break
        end
        turtle.up()
    end
end

-- Function to move the turtle down
local function moveDown()
    for i = 1, floors do
        if turtle.detectDown() then
            print("Obstacle detected below. Stopping.")
            break
        end
        turtle.down()
    end
end

-- Main Program
while true do
    print("Enter password:")
    local input = read("*") -- (Optional) Hide the password input (useful for public computers

    if input == passwordUp then
        print("Password accepted. Moving up.")
        moveUp()
    elseif input == passwordDown then
        print("Password accepted. Moving down.")
        moveDown()
    else
        print("Incorrect password. Try again.")
    end
end

--Turtlevator v1.0