local function filterlist(L, T)
  local v = {}
  for i = 1, #L do
    if string.find(L[i], T) then
      table.insert(v,L[i])
    end
  end
  return v
end

-- program variables
local peripherals = peripheral.getNames()
local furnaces = filterlist(peripherals, "minecraft:furnace")
local furnaceCount = #furnaces

local islot = 1
local fslot = 2
local oslot = 3

local input = peripheral.wrap("storagedrawers:standard_drawers_1_4")
local fuel = peripheral.wrap("storagedrawers:standard_drawers_1_3")
local output = peripheral.wrap("storagedrawers:standard_drawers_1_5")
local monitor = peripheral.find("monitor")

local rsDir = "right"

local fuelcount = 0
local queued = 0

local itemDict = {}

-- item transfer function
function pushItemsToFurnaces(input, furnaces, slot, count)
    for s = 1, input.size() do 
        local itemDetail = input.getItemDetail(s)
        if itemDetail ~= nil and itemDetail.count ~= nil then
            for i = 1, furnaceCount do
                input.pushItems(furnaces[i], s, 1, slot)
            end
            break
        end
    end
end

function getInventoryTotal(inventory)
    contents = inventory.list()
    local v = 0
    for i = 1, #contents do
        if contents[i] ~= nil then
            v = v + contents[i].count
        end
    end
    return v
end


-- main loop

monitor.setTextScale(0.5)
local monX, monY = monitor.getSize()
monitor.setTextColor(colors.purple)


while (true) do
    if rs.getInput(rsDir) then
        fuelcount = getInventoryTotal(fuel)
        queued = getInventoryTotal(input)

        itemDict = {}


        pushItemsToFurnaces(input, furnaces, islot, 1)
        pushItemsToFurnaces(fuel, furnaces, fslot, 1)
        for i = 1, furnaceCount do
            output.pullItems(furnaces[i],oslot)
            local furnace = peripheral.wrap(furnaces[i])
            if furnace.getItemDetail(2) ~= nil then
                fuelcount = fuelcount + furnace.getItemDetail(2).count
            end
            if furnace.getItemDetail(1) ~= nil then
                item = furnace.getItemDetail(1)
                item_name = item.displayName

                if itemDict[item_name] then
                    itemDict[item_name] = itemDict[item_name] + item.count
                else
                    itemDict[item_name] = item.count
                end
            end
        end

        -- Sort itemDict by values
        local sortedTable = {}
        for key, value in pairs(itemDict) do
            table.insert(sortedTable, {key = key, value = value})
        end
        table.sort(sortedTable, function(a, b)
            return a.value > b.value
        end)

        -- Clear the monitor and display the sorted itemDict
        monitor.clear()
        monitor.setCursorPos(1, 1)
        monitor.write("Items queued: ")
        monitor.setCursorPos(monX-5,1)
        monitor.write(queued)
        monitor.setCursorPos(1, 2)
        monitor.write("Fuel items remaining: ")
        monitor.setCursorPos(monX-5,2)
        monitor.write(fuelcount)
        monitor.setCursorPos(1, 4)
        monitor.write("Smelting in progress:")
        monitor.setCursorPos(1, 5)
        for i = 1,monX do
            monitor.write("-")
        end
        monitor.setCursorPos(1, 6)
        for _, entry in ipairs(sortedTable) do
            local cx, cy = monitor.getCursorPos()
            monitor.write(tostring(entry.key))
            monitor.setCursorPos(monX-5,cy)
            monitor.write(tostring(entry.value))
            monitor.setCursorPos(1, cy + 1)
        end
    else
        monitor.clear()
        monitor.setCursorPos(1,1)
        monitor.write("sleeping...")
    end
    sleep(0.05)
end



