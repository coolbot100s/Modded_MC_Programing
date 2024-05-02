-- Hello World B
-- By coolbot100s
-- MC version 1.20.1, CC:Tweaked version 1.110.2
-- Write "Hello, World!" to a connected monitor accross 2 lines when ran.

local monitor = peripheral.find("monitor")
monitor.clear()
monitor.setTextColor(colors.purple)
monitor.setCursorPos(1,1)
monitor.write("Hello,")
monitor.setCursorPos(1,2)
monitor.write("World!")
exit()