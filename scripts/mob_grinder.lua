number = 1
function attack()
    turtle.attack()
    checkInventory()
    sleep(1)
end

function checkInventory()
    if turtle.getItemCount(16) > 0 then
        print("Inventory full. Stopping.")
        turtle.turnRight()
        for i = 1, 16 do
            turtle.select(number)
            turtle.drop()
            number = number + 1
        end
        number = 1
        turtle.turnLeft()
        turtle.select(1)
    end
end

while true do
    attack()
end
