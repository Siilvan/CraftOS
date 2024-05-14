while true do
    local monitor = peripheral.find("monitor")
    local chest = peripheral.find("chest")

    print_inventory_on_monitor(chest, monitor)

    sleep(10)
end

function print_inventory_on_monitor(chest, monitor)
    for slot, item in pairs(chest.list()) do
        writeWithEnter(monitor, item.name, item.count .. "x")
    end
end

local function centerText(monitor, text)
    x,y = monitor.getSize()
    x1,y1 = monitor.getCursorPos()
    monitor.setCursorPos((math.floor(x/2) - (math.floor(#text/2))), y1 + 1)
    monitor.write(text)
end
function writeWithEnter(monitor, item, quantity)
    monitor.setTextColour(1)
    centerText(monitor, item)
    monitor.setTextColour(256)
    centerText(monitor, quantity)
end
