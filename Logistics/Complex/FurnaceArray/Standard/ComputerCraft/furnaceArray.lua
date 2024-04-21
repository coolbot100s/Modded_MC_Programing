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

local input = peripheral.wrap("minecraft:chest_4")
local fuel = peripheral.wrap("minecraft:chest_5")
local output = peripheral.wrap("minecraft:chest_6")

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

-- main loop
rednet.open("back") -- rednet for lever

while (true) do
    rednet.broadcast("query_lever")
    local id, msg, protocol = rednet.receive()
    if id == 19 and msg == true then
        pushItemsToFurnaces(input, furnaces, islot, 1)
        pushItemsToFurnaces(fuel, furnaces, fslot, 1)        
        for i = 1, furnaceCount do
            output.pullItems(furnaces[i],oslot)
        end
    end
    sleep(0.05)
end



