local input = peripheral.wrap("storagedrawers:standard_drawers_1_1")
local output = peripheral.wrap("storagedrawers:standard_drawers_1_0")

while (true) do
    if peripheral.isPresent(peripheral.getName(output)) then
       if output.list(2).count == nil or output.list(2).count < output.getItemLimit(2) then
            output.pullItems(peripheral.getName(input),2,output.getItemLimit(2))
       end
    end
    sleep(0.05)
end
