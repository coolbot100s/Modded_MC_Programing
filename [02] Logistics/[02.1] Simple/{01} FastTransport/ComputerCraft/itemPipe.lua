-- Item Pipe
-- By coolbot100s
-- MC version 1.20.1, CC:Tweaked version 1.110.2
-- Transfer Items from input to output.

-- These variables refer to specific blocks in world, change these every time you build!
local input = peripheral.wrap("storagedrawers:standard_drawers_1_7")
local output = peripheral.wrap("storagedrawers:standard_drawers_1_6")

-- Main loop, this will run continuosly until the program is Terminated
while (true) do
    if peripheral.isPresent(peripheral.getName(output)) and peripheral.isPresent(peripheral.getName(input)) then
        local success, error_message = pcall(function() -- use error catching incase the peripheral goes missing midtick*
            -- slot 2 is where items are stored in Storage Drawers 1x1
            -- check if slot 2 is empty (nil) or less than full
            if output.list(2).count == nil or output.list(2).count < output.getItemLimit(2) then
                output.pullItems(peripheral.getName(input), 2, output.getItemLimit(2))
            end
        end)
        if success ~= true then
            print("An error occurred, likely because output was missing: " .. error_message)
        end
    end
    -- pause for a tick before operating again, this prevents several issues such as your items being deleted.
    sleep(0.05)
end

-- *i'm not actually sure what causes the error, just kinda guessing here.