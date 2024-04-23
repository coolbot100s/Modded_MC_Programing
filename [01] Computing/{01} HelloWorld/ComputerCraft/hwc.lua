-- Hello World C
-- Code example from https://tweaked.cc/peripheral/printer.html
-- MC version 1.20.1, CC:Tweaked version 1.110.2

-- Print a page from a connected printer, given paper and ink when ran.
local printer = peripheral.find("printer")

-- Start a new page, or print an error.
if not printer.newPage() then
  error("Cannot start a new page. Do you have ink and paper?")
end

-- Write to the page
printer.setPageTitle("'sup planet?")
printer.write("Hello, World!")

-- And finally print the page!
if not printer.endPage() then
  error("Cannot end the page. Is there enough space?")
end