# Hello, world

This ubiquitous welcome message is a helpful introduction to any computing mod, and allows us to get aquanted with the basic mechanics of each mod.  
This section will go over more detail of the setup of each program, as to introduce the concepts that will be used going forward.  
There will be less focus on test results or crafting costs, instead this will cover the very basics of how to write a simple program for each mod.  

## Contents

- [CC: Tweaked](#cc-tweaked)  
- [IntegratedDynamics]()  
- [IntegratedScripting]()  
- [RFTools Control]()  

## CC: Tweaked

Computer Craft offers many ways of displaying a mesage, let's go over each of the common ones from easiest to most complicated.  

### Built-in Program

All ComputerCraft computers come pre-installed with a program called `hello`, which will write "Hello World!" to the terminal one letter at a time. Simply type "hello" to start the program.  

### Interactive Lua

By running the `Lua` program in the same way you can execute Lua code directly onto the computer, without needing to save it to a program.  
This terminal will even let you store variables, and autocomplete standard lua and ComputerCraft methods.  
To create our own hello world, you can simply call the `print()` function directly in the Lua terminal.

### Simple Programs

Now, to be able to execute your program later without re-writing the whole thing, we need to import it to the computer.  
My favorite way of doing this is by writting the script locally, and drag and dropping this onto the Minecraft screen with my computer of choice open.  
But this isn't the only way of importing programs, CC:T lets you import or execute scripts from the internet using `pastebin` or `wget` as well.  

Once your program is saved on the computer, you can run it by typing in the file name you saved it under.  
The first script, [helloWorldConsole]() will do the same thing we did moments ago in the Lua terminal as it's own program, allowing you to putyour message in the computer console.

### Monitors / Peripherals

Next, let's display our message on a monitor, the second script, [helloWorldMonitor]() will locate a monitor and write text to it.  
By using an Advanced Monitor, we can even change the color of the text.  
Each peripheral, like the monitor, has it's own methods that can be called in your program, these are documented [in the wiki](https://tweaked.cc/peripheral/monitor.html) or, ideally by the mod that adds them. But can also be seen using `peripheral.getMethods()`.  
Connecting peripherals starts pretty simple, simply placing it next to your computer is enough for the computer to find it.  
You can use the `peripherals` program to see a list of all attatched peripherals.

### Printer

CC:Tweaked has a unique peripheral, the printer!  
This machine will let you write programs to easily print text onto Printed Pages.  
The text color is decided by the dye added to the printer.

### Speaker

The last peripheral I use for this demo is the speaker, it will let you play audio, including sounds from the game of Minecraft!  
The example script will play the friendly noise of a villager saying hello.  

## Integrated Dynamics
