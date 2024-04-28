### WARNING
This project is very much a work in progress, almost everything is incomplete and subject to change, consider the repository as you see it now a proof of concept for what I hope will become a source of guidance and information for this niche subject, as well as a peak in my journey to learn these systems.  
I really hope this could some-day become a hub for finding solutions to common Minecraft problems for any computing mod out there, but even if that never happens it will stand as a repository for scripts I'm sure to be using time and time again.  
I have a list of 25 mods and counting, however for now I'll only be covering the ones I have demonstrations available for.
Contributions and feedback are more than welcome.

# Modded_MC_Programming
An informational repository storing builds, instructions, and scripts for the many "in-game programming" mods of Minecraft, such as Computer Craft, Open Computers, Super Factory Manager, and many more.  
You can navigate the repository by browsing the folders, each one containing data comparing and contrasting the corresponding experiment, such as performance benchmarks, setup costs, and versatility. Can't decide whether to use Integrated Dynamics or Super Factory Manager to control your wall of ae2 inscribers? Maybe you want to demolish your friends in a battle of wizardry and aren't sure which magic system to dive into. This is your map to the best solution for any scenario.

## How to use
If you're an experienced modded Minecraft player and are just here to copy builds and code, then navigating the folders to find the task you're trying to accomplish is all you have to worry about.  
These are broken down into broad categories, and then specific tasks, and finally all files relavent to a machine are seperated into their own folders by mod.  
If you want to know how each of these mods compare at a specific task, whether that be their effeciency, speed, server performance, or resource cost, then make sure you're taking a look at each folder's README file. Each one will contain detailed information, as well as tables or graphs comparing each system's qualities where relavent.
  
If you're new to this and looking to learn how these mods work, then continue reading or look for what most interests you. Keep in mind there is a bit of an intended order for new readers, with simpler concepts and tasks being covered first, and the complexity ramping up as you go deeper.
Early categories and tests will also generally include detailed walkthroughs of setup that later examples with not include.

### A pretentious plee for your interest
You might be here because you love to find yourself placed in a sandbox of near-infinite possibilities, a blank canvas where you can set any goal and with enough creativity build yourself a solution.  
You probably spend a lot of time immersed in a world where, even when given only basic building blocks it is inevitably possible to achieve anything, stopped only by the speed of your computer and the amount of time you're willing to spend on achieving your goals. But let's be honest most of the time you just look things up online and copy what works. 
I think this summarizes the game of Minecraft and the skill of programming equally well, so it's only natural the two become married rather often.  

I want to make the case that if you're a Minecraft player who enjoys technical challenges, whether that be making mob farms and redstone contraptions in vanilla Minecraft, or behemoth industrial factories in your favorite modpack, you should learn at least a little bit of code and make use of one of the many amazing mods covered here.  
But even if you're here only to make your farms a bit faster, cheaper, or more efficient, then you've come to the right place for copying code and builds, even if you're perfectly happy with your current spaghetti of tubes and belts and overflowing chests, your server admins will more often than not thank you for making the switch if you use the power of these mods responsibly.  

## Methodology
### Mod selection
Each mod will be tested on the latest available version, and only on one loader, scripts that allow for comments will have this information commented on at the top of the document.  
Mods will be tested stand-alone in most scenarios. This means that I won't be combining mods when it comes to completing the task, pairing any one of these systems with other versatile mods like Modular Routers can greatly even the playing field, and including addons like the many peripherals mods for CC: Tweaked can make a lot of tasks much easier. However, to keep the information as generally applicable and accessible as possible, I'll be using only the default state of any given mod, some exceptions of course apply, and information on those can be seen below.  
This principle also affects my choice of additional mods where necessary, many logistics tests for instance will test things like Energy and fluid transfer, or testing things on a scale that vanilla doesn't easily allow, in other cases tests may be built specifically for interacting with the mechanics of other mods. 
To keep things fair across multiple loaders and versions of the game I'll be using mods that are widely supported and popular, some of these mods include Storage Drawers, AE2, and Mekanism, but don't worry if you're using this as a guide, existing knowledge of other mods won't be required.

### Benchmarking 
*Currently this is the most "WIP" section, I will eventually completely redo all benchmarks on a more neutral system, this is simply the stats of my setup for now*
  
Many tests will include information on the performance impact the builds have on the server, note that currently these tests are NOT the most reliable and should be taken with a grain of salt. For now, they're done in the same single-player building world, here's the specs:

GPU: Radeon RX 7800 XT  
CPU: Ryzen 7 7800X3D 8-Core  
RAM: 32GB @4800 MHz 

For Java 17 instances, I use Eclipse Adoptium 17.0.10 with 10GB of allocated memory and custom JVM arguments mostly taken from [this guide here](https://github.com/brucethemoose/Minecraft-Performance-Flags-Benchmarks?tab=readme-ov-file) 


## The Mods
I've tried to compile a comprehensive list of the mods made for Minecraft that empower the player to write code, or otherwise flex their programming muscles. There's a lot of variety here so let's go over them.

This handy table can quickly introduce you to what mod you may be interested in, each one will have more information available in its respective section.
| Mod | MC Versions | Loaders | Language |Computing|Displays|Redstone|Logistics|Drones|Magic|Meta|
|--|--|--|--|--|--|--|--|--|--|--|
|[RF Tools Control](#rf-tools-control)|1.10-1.20.1|Forge|Visual|✅|✅|✅|✅|❌|❌|❌
|[CC: Tweaked](#cc-tweaked-aka-computer-craft)|1.16-1.20.4|Forge & Fabric|Lua|✅|✅|✅|✅|✅|❌|❌
|[Super Factory Manager](#super-factory-manager)|1.12.2-1.20.4|Forge| Custom|❌|❌|❌|✅|❌|❌|❌
|[Integrated Dynamics](#integrated-dynamics)| 1.18.2-1.20.1|Forge| Item-Based|✅|✅|✅|✅|❌|❌|❌
|[Integrated Scripting](#integrated-scripting)| 1.18.2-1.20.1|Forge|Java Script|✅|✅|✅|✅|❌|❌|❌

### CC: Tweaked, AKA: Computer Craft
**[Modrinth](https://modrinth.com/mod/cc-tweaked), [Curseforge](https://www.curseforge.com/minecraft/mc-mods/cc-tweaked), [Documentation](https://tweaked.cc)**
  
CC:T is the most well-known and popular of the Minecraft Computing mods and for good reason, it is extremely well supported with add-ons and community creations, it is the most versatile and customizable system, and the inspiration for many to get into Minecraft computing mods.  
Overall, CC: Tweaked is a powerful mod that can solve most of your problems, but will require some time to learn.

#### Gameplay
Being pretty cheap already, the system is moderately well integrated into the game, with Computer Craft Villagers being able to be found in villages, this introduces players to the mod even if they never look into the recipes on JEI.  
Those recipes are themselves pretty simple, cheap, and low-complexity crafting recipes, nothing too fancy.
Aesthetically it leaves room to be desired however resource packs exist to make it fit the vibe of your world as you please.

#### Versatility
CC: T belongs to the category of what I'll call full-fledged computing mods, you can write games inside the game for the CraftOS operating system, control redstone via a cellphone, or operate the famous blocky drones known as turtles.  
The possibilities are endless CC: T is powerful enough to be a one-mod solution to almost anything you want to do if you're willing to invest in it fully.  

#### Difficulty
The Lua language that powers CC: Tweaked is pretty beginner-friendly though has some infamous quirks. The ComputerCraft system is robust, and some players including myself may find that overwhelming, however, the A+ documentation and tools for writing programs both in and out of the game make it quick and easy to test scripts. If you're new to coding and trying to learn, I would recommend CC: Tweaked as a companion to learning Lua, it can't teach you itself but if you're looking for an excuse to learn I think it's a great option.

### Super Factory Manager
**[Modrinth](https://modrinth.com/mod/super-factory-manager), [Curseforge](https://www.curseforge.com/minecraft/mc-mods/super-factory-manager), [Documentation](https://github.com/TeamDman/SuperFactoryManager/tree/1.20.4/examples)**  

Super Factory Manager is my personal go-to logistics system, capable of just about anything your favorite pipes mod can do, with the

#### Gameplay
Super factory manager is cheap and simple to setup, using the Label Gun to add as many labels as you want to any inventories in the network makes it quick to name and plan out even large complicated systems, and just as easy to see how your items are being moved at a glance.  
SFM also offers some other quality of life and game-play features, my favorite being the slot inspector, toggable with ctrl+I that makes working with this, and all other mods in this list much easier.  

#### Versatility
This mod is meant purely for Logistics, you won't be able to do anything fancy with it, but it makes many everyday tasks of modded MC leagues simpler, and more efficient.

#### Difficulty
SFM is without a doubt the easiest mod to get into, if you have no programming experience or interest in coding but want to upgrade your factories and logistics systems this is the mod you should pick, it's custom scripting language is easy to read, easy learn, and the in-game editor is great. 

### RF Tools Control
**[Modrinth](https://modrinth.com/mod/rftools-control), [Curseforge](https://www.curseforge.com/minecraft/mc-mods/rftools-control), [Documentation](https://github.com/McJtyMods/RFToolsControl/wiki)**  
RFtools control is a unique system with a custom 2D visual scripting language made up of simple low-level op-codes, a part of the larger RFTools suite it has a lot of character and charm but is often overlooked for it's intimidating complexity.  

#### Gameplay
RFTC offers a modular system for building your computers from scratch, you'll be installing CPU cores, ram modules and network cards depending on the needs of your system, this feeling of building the machine you need for the job makes it an immsersive and well balanced experiance.  
I think it's one of the most fun *mods* to play with as a result.

#### Versatility
RFTC is a nearly full-fledged computing mod offering you the ability to do almost anything you want with the low-level tools provided. It's an extremely powerful and fast system for logistics, displays, and even interactive guis, its support for other features from the RFTools ecosystem makes it a great way to interact with other powerful tools, and it offers it's own autocrafting system.

#### Difficulty
The constraints of RFTCs low-level visual scripting language and hard limit on program size often make writing programs for the system it's own form of puzzle, it is a fun and rewarding puzzle to solve, however you're left to your own devices depending on the version you're playing.  
Documentation and support are lacking, and paired with the user interface quirks common amongst RFTools mods, it can be at times frustrating.  
That said, it does feature a great debuging and error reporting system, letting you step through a program one operation at a time, and read memory values, however this system is still a bit clunky to work with as a result of thoe common UI issues.   

### Integrated Dynamics
**[Modrinth](https://modrinth.com/mod/integrated-dynamics), [Curseforge](https://www.curseforge.com/minecraft/mc-mods/integrated-dynamics), [Documentation](https://integrateddynamics.rubensworks.net/book/)**  
Integrated Dynamics (and it's many addons such as Integrated Tunnels) are a mainstay mod in many modpacks, offering you powerful data and logistics abilities through an item-based functional programming system.  
It is a Logistics, Networking, and Programming system all in one, featuring abilities like entity interaction or reading 4th wall world data that many other systems don't include.

#### Gameplay
Integrated Dynamics has a progression system that feels natural to other tech mods, the special menril wood and it's products will be the core of your progression, you've probably already used it's squeezer or basin before for other recipes.  
It fits in seamlessly to Minecraft and has it's own built-in quest system, with it's special guidebook offering you in-game rewards for completing tasks.  

#### Versatility
Integrated Dynamics, through it's addons like Integrated Tunnels, supports all sorts of interactions with the world, and even limited remote interactions through Offset Enhancements that let almost every interaction happen at long range. As mentioned it has some unique features for entity interaction, player simulation, and it's own autocrafting system through Integrated Crafting.

#### Difficulty
The ducumentation and interactive in-game tutorials make it fun and easy to learn, however the complexity of the system can be difficult to get a hold of.  
The functional programming paradaigm, and unique item-based programming method will result in even relatively simply programs requiring lots of function and variable nesting that can get difficult to keep track of, writting things down on a notepad and planning your systems out ahead of time, or making large walls of displays to track each step in your pgogram is reccomended.  
Luckily there is a handy debuging system that will alert you to where errors are occuring in your functions, but this will still often lead to having to start from scratch if you're not careful.  
With no central controller block or terminal output like many of the other systems that offer the same level of complexity, it is one of the more alien-feeling systems.  

### Integrated Scripting
**[Modrinth](https://modrinth.com/mod/integrated-scripting), [Curseforge](https://www.curseforge.com/minecraft/mc-mods/integrated-scripting), [Documentation](https://integrateddynamics.rubensworks.net/book/manual/main/integratedscripting/)**  
This is an Integrated Dynamics addon, however, it introduces an entirely new way of programming your network and machines, allowing you to do everything ID can do using JavaScript.  

#### Gameplay
Integrated Scripting naturally fits seemlessly into the ID ecosystem, but introduces script drives and drive bays.  
In order to execute your scripts, the variable card referancing it must be attatched to a network storing the disk that your code is written on.  

#### Versatility  
Integrated Scripting offers all the versatility of ID, but making it easier to interface with, however because a card must be conencted to the network containing a scripting disk, it makes it less practical for standalone simple machines.

#### Difficulty
I find this to be easier to work with than the item based system of Integrated Dynamics, and it does make much of the confusing parts of ID simpler.  
Even if you've never written JavaScript before, this will likely feel more natural for thoes who have experiance writting code.  
It also enables a output file you can use to read debug messages from your operators.  
However, when compared to other scripting mods like SFM, or CC:T the in-game editor can be difficult to work with, using an out-of-game IDE is almost neccessary.  
