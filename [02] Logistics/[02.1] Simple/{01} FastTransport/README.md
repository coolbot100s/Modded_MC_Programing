# Item Transport Speed

You need to move items, no matter what environment you're in, you need to move items around when you're playing Minecraft.  
Getting things from point A to point B is important, so how do our computing mods Empower us to do that?  
In this test our goal is simply to move a lot of items, we'll be using Storage Drawers with a Creative Drawer filled with cobblestone as our input, and an empty drawer with maxed out Storage Upgrades, giving our output a capacity of 458752.  
What's the practical application? There's very few but one that may come to mind is the ae2 Matter Condensor, if you do find yourself with an unlimited supply of items and need singularities fast, this is exactly what you're looking for.  
All durations assume 20 ticks per second.

## Vanilla / Control
It's no secret moving things in vanilla is slow, hoppers are slow and inefficient, sure you could simply place a hopper and be done with it... but with the mighty Hopper's transfer rate of 1 item every 8 ticks it'll take us over **2 days** to complete the test.
![VanillaHopper]()
You could speed this up by using a a hopper Minecart and a *few* more hoppers, but this hopper abomination is going to impact server preformance more than any of the solutions the mods below permit.
![VanillaHopperCart]()
This is naturally, 4 times faster, at a whopping 10 items per tick, it'll fill up our output in 12 hours and 44 minutes.


## Integrated Dynamics
To be honest with you, this test involves no programming, however it acts as a form of control for this simple test, the setup is one of the easiest and still really quick as a standard logistics mod. As with all Logistics tests, this will require the Integrated Tunnles add-on.

### Construction & Setup
Simply place a Logic Cable and slap an Item Interface on the input, an Item Exporter on the output. Note that you could also flip this, using an importer to pull from input. 
Next, simply add any Variable Card to the Export All Items slot.
Make sure the Exporter is set to 1 Ticks/Operation in its Part Settings Menu.
![IntegratedDynamics]() 

### Cost
| Item | Count |
|-|-|
Logic Cable | 1
Item Interface | 1
Item Exporter | 1
Variable Card | 1

### Results
This Integrated Dynamics system will transport 64 items / tick, completing our test in just shy of an hour.

## Super Factory Manager
SFM is quite literally made for this, its one job is logistics, so, how does it do in a simple race? Well... it's built with performance in mind and as such limits the player by default to one execution per second, this is plenty in most scenarios but does mean that it falls behind here, however, there are loop holes and we'll take a look at thoes as well.

### Construction & Setup