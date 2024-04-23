local input = peripheral.wrap("minecraft:chest_1")
local output = peripheral.wrap("minecraft:chest_0")


for s = 1, input.size() do
    output.pullItems(peripheral.getName(input), s)
end

