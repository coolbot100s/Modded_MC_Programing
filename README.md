### WARNING
This project is very much a work in progress, almost everything is incomplete and subject to change, consider the repository as you see it now a proof of concept for what I hope will become a source of guidance and information for this niche subject, as well as a peak in my journey to learn these systems, I really hope this could some-day become a hub for finding solutions to common Minecraft problems for any computing mod out there, but even if that never happens it will stand as a repository for scripts I'm sure to be using time and time again.  
I have a list of 25 mods and counting, however for now I'll only be covering the ones I have demonstrations available for.
Contributions and feedback are more than welcome.

# Modded_MC_Programming
An informational repository storing builds, instructions, and scripts for the many "in-game programming" mods of Minecraft, such as Computer Craft, Open Computers, Super Factory Manager, and many more.  
You can navigate the repository by browsing the folders, each one containing data comparing and contrasting the corresponding experiment, such as performance benchmarks, setup costs, and versatility. Can't decide whether to use Integrated Dynamics or Super Factory Manager to control your wall of ae2 inscribers? Maybe you want to demolish your friends in a battle of wizardry and aren't sure which magic system to dive into. This is your map to the best solution for any scenario.


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
|RF Tools Control|1.10-1.20.1|Forge|Visual|✅|✅|✅|✅|❌|❌|❌
|[CC: Tweaked](#cc-tweaked-aka-computer-craft)|1.16-1.20.4|Forge & Fabric|Lua|✅|✅|✅|✅|✅|❌|❌
|[Super Factory Manager](#super-factory-manager)|1.12.2-1.20.4|Forge| Custom|❌|❌|❌|✅|❌|❌|❌
|Integrated Dynamics| 1.18.2-1.20.1|Forge| Item-Based|✅|✅|✅|✅|❌|❌|❌
|Integrated Scripting| 1.18.2-1.20.1|Forge|Java Script|✅|✅|✅|✅|❌|❌|❌

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


#### Versatility
This mod is meant purely for Logistics, you won't be able to do anything fancy with it, but it makes many, many everyday tasks of modded MC leagues simpler, and more efficient.

#### Difficulty
SFM is without a doubt the easiest mod to get into, if you have no programming experience or interest in coding but want to upgrade your factories and logistics systems this is the mod you should pick, it's custom scripting language is easy to read, and easy learn and the in-game editor is great. 

