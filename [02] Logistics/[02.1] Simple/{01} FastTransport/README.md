# Item Transport Speed

You need to move items. No matter what environment you're in you need to move items around when you're playing Minecraft.  
Getting things from point A to point B is important, so how do our computing mods empower us to do that?  
In this test our goal is simply to move a lot of items, we'll be using Storage Drawers with a Creative Drawer filled with cobblestone as our input, and an empty drawer with maxed-out Storage Upgrades, giving our output a capacity of 458,752.    
What's the practical application? There are very few but one that may come to mind is the ae2 Matter Condensor, if you do find yourself with an unlimited supply of items and need singularities fast, this is exactly what you're looking for.  

### Contents:
- **Control Tests**
    - [Vanilla](#vanilla)  
    - [Integrated Dynamics](#integrated-dynamics)
- **Tests**
    - [Super Factory Manager](#super-factory-manager)
      - [Cheesing SFM](#cheesing-sfm)
    - [RFTools Control](#rftools-control)
        - [RFTools Control CPUs](#rftools-control-cpus)
    - [CC: Tweaked](#cc-tweaked)
- [Results](#test-results) 
- [Additional Mods Used](#additional-mods-used)


## Vanilla
This section will go over what trying to complete the test in vanilla alone may look like, acting as a sort of control test.  
This will be heavily condensed without providing tutorials, however, schematics can still be found in the [appropriate folder](https://github.com/coolbot100s/Modded_MC_Programming/tree/85caea96b1e55ed13053ee1665b2972b99ea7eec/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/Vanilla).  
  
Sure you could simply place a hopper and be done with it... But it's no secret moving things in vanilla is slow, hoppers are slow and inefficient, with the mighty Hopper's transfer rate of 1 item every 8 ticks it'll take us over **2 days** to complete the test.  
You could speed this up by using a hopper Minecart and a *few* more hoppers, but this hopper abomination is going to impact server performance more than any of the solutions the mods below permit.    
<img 
    style="display: block; 
           width: 30%;"
    src="https://github.com/coolbot100s/Modded_MC_Programming/blob/main/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/Vanilla/mc_item_pipe.png?raw=true" 
    alt="VanillaHopperCart">
</img>  
This is naturally, 4 times faster, at a whopping 10 items per tick, it'll fill up our output in 12 hours and 44 minutes.  

#### Cost
| Item | Count |
|-|-|
|Hopper Minecart| 1 |
|Hopper| 12


## Integrated Dynamics
To be honest with you, this test involves no programming, however, it acts as a form of control for this simple test, the setup is one of the easiest and still really quick as a standard logistics mod. As with all Logistics tests, this will require the Integrated Tunnles add-on.

### Construction & Setup
Simply place a Logic Cable between the input and out and slap an Item Interface on the input, and an Item Exporter on the output.  
TIP: You could also flip this, using an importer to pull from input.  
Next, add an empty Variable Card to the Export All Items slot.  
Make sure the Exporter is set to 1 Ticks/Operation in its Part Settings Menu.  
<img 
    style="display: block; 
           width: 30%;"
    src="https://github.com/coolbot100s/Modded_MC_Programming/blob/main/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/IntegratedDynamics/id_item_pipe.png?raw=true" 
    alt="IntegratedDynamics">
</img>
  
#### Cost
| Item | Count |
|-|-|
Logic Cable | 1
Item Interface | 1
Item Exporter | 1
Variable Card | 1

### Results
This Integrated Dynamics system will transport 64 items/tick, completing our test in just shy of an hour.

## Super Factory Manager
SFM is quite literally made for this, its one job is logistics, so, how does it do in a simple race? Well... it's built with performance in mind and as such limits the player by default to one execution per second, this is plenty in most scenarios but does mean that it falls behind here, however, there are loopholes and we'll take a look at those as well.

### Construction & Setup
Place a Factory Manager between the input and output, remember to craft a program card and put that in your Factory Manager via the GUI.  
Now, click the edit button, and write ([or paste](https://github.com/coolbot100s/Modded_MC_Programming/blob/85caea96b1e55ed13053ee1665b2972b99ea7eec/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/SuperFactoryManager/itemPipe.sfm)) your script.  
Next, grab a Label Gun and label the input block as "in" and the output block as "out." 
TIP: Labeling an inventory as "input" or "output" will cause errors, since these keywords are a part of the sfm language.  
TIP 2: Writting your script first and pulling labels from the Factory Manager will prevent typos.  
![sfm_item_pipe](https://github.com/coolbot100s/Modded_MC_Programming/blob/main/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/SuperFactoryManager/sfm_item_pipe.png?raw=true)

#### Cost
| Item | Count |
|-|-|
Factory Manager| 1
Factory Manager Program Disk| 1
Label Gun*| 1  
  
*\*Label Gun is a tool and is reusable*   
![sfm-total-cost](https://github.com/coolbot100s/Modded_MC_Programming/blob/main/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/SuperFactoryManager/sfm_item_pipe_cost_total.png?raw=true)  


### Code
The script is a mere 4 lines long, showcasing the ease of logistical tasks using SFM.  
```
every 20 ticks do
    input from in
    output to out
end
```
This script is perfectly dynamic and will work with any amount of inventories with the same labels.  

### Results
Unfortunately, SFM disappoints in terms of speed, the simple script shown above will transfer items out of the input Storage Drawer at a rate of 2 stacks / second, however... this can be Improved.

## Cheesing SFM
This section will cover a few tricks you can do when using SFM to make it faster at the cost of code readability, stability, and server performance. These two methods are generally applicable to all SFM scripts, and any further tests in the logistics category will ignore these abilities.

### Redstone clock
By triggering our Script whenever a redstone pulse is activated, we can connect a redstone clock to the Factory Manager and get it to fire every redstone tick, or every 2 game ticks.  In the provided example I've used a Timer from RFToolsUtility.  
`every 20 ticks do` > `every redstone pulse do`  
Already, our script executes 10x faster, but we can improve it further.  

### Spam
For this test, output has no limitation on the items it can accept, however, our input will only let the manager pull 128 items at a time.  
To bypass that limit, you simply need to repeat the input operation, you can do this as many times as you'd like, for demonstration the [itemPipeCheese.sfm](https://github.com/coolbot100s/Modded_MC_Programming/blob/85caea96b1e55ed13053ee1665b2972b99ea7eec/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/SuperFactoryManager/itemPipeCheese.sfm) script repeats the operation 128 times. Naturally, the script will operate 128x faster, when combined with the redstone clock technique this setup executes 1280x faster than the original method.  

### Server Impact
In my testing, using a super fast redstone clock has broken the Factory Manager's built-in profiler. However, testing with Observable indicates that, when idle, this method is 50-60 times more impactful on the server than the original script, or barely any more performant than vanilla. When active, ~100x the impact making it at least double the server cost of just using a Hopper Minecart. 
This does not account for the impact of the redstone clock, which will vary greatly depending on your implementation, generally speaking, the RFTU Timer is very performant and has a negligible impact. 

### Takeaways
Because of the massive performance impact, the lack of readability, extra setup requirements, and the possibility behavior around spamming is modified in future updates I will generally avoid using these in testing or any provided demonstration scripts.  
However, the one exception is power draw, for any complex systems that require the distribution of power, it may be necessary to implement a bit of spamming for the manager to be able to carry power, this will depend heavily on what mods, even which specific blocks are being interfaced with.

## RFTools Control
RFtools Control has a special quirk to keep in mind when it comes to item transportation. 
The processor cannot transfer items directly from one inventory to another, rather, it will import the items to its internal inventory, and then export items from the internal slot to an external inventory.  
This at first sounds inefficient but as we'll see, RFTC is quite powerful.  

### Construction & Setup
There are a few more steps involved in setting up RFTC, place the processor between the input and output, and for the demonstration script, add a button on the front. This is optional as we'll be using it to activate the program, but you could instead trigger it with a signal like the HelloWorld program.  
Once you've created the program in a Programmer put it in the slot and insert a CPU.  
Next, press the button above the program slot the itemPipe program is inside, this will let you allocate item and memory slots for the program.  
Allocate one item slot, this will now have the label 0, indicating the index that the program will recognize the slot as.    
Place a button on the front of the processor, and use it to start the program.  
<img 
    style="display: block; 
           width: 30%;"
    src="https://raw.githubusercontent.com/coolbot100s/Modded_MC_Programming/main/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/RFToolsControl/rftc_item_pipe.png" 
    alt="rftc_item_pipe">
</img>  

#### Cost
|Item|Count|
|-|-|
Processor|1
Oak Button|1
Program Card|1
CPU Core B500|1
FE| 4/tick
  
![rftc_minimum_total_cost](https://github.com/coolbot100s/Modded_MC_Programming/blob/main/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/RFToolsControl/rftc_item_pipe_min_cost_total.png?raw=true)  
### Code
![rftc_item_pipe_code](https://github.com/coolbot100s/Modded_MC_Programming/blob/main/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/RFToolsControl/rftc_item_pipe_code.png?raw=true)  
The code is incredibly simple, at just 3 opcodes.  
First a way of starting the program, in the example script we'll be using `redstone on` direct that into a Fetch Items > Push Items and direct the Push Items back into the Fetch Items. 
This creates a very speedy loop of constantly moving items.  
It's important to remember that RFTC programs are directional and rely on the cardinal directions to define inventory locations, in the demonstration, the processor is facing East and it is assumed that the input and output are on the left and right respectively. 

### Results
Since the B500 executes 1 operation per tick, and it takes 2 op-codes to move a stack of items from input to output, it means we're moving 1 stack every 2 ticks, or 0.5 stacks/tick, but this can be upgraded

## RFTools Control CPUS
The example above is the absolute cheapest construction, however, by investing more resources we can speed this program up dramatically.  
The first step is to use a CPU Core EX2000 in place of the B500, this is 16 times faster but requires more rf/t.
Additionally, we can run multiple instances of our program in a single processor, one for each of the 6 program slots, if each program is given its own CPU using exclusive mode.  
Make sure to enable exclusive mode in the processor GUI.
If we use all 6 slots and add 6 EX200 CPU cores, then we can transport items 96x faster!  
This is of course, more expensive, both in resources and power, but this optimization tactic is something to keep in mind as it's often worth it.  
Unlike cheesing SFM, this does not produce too much extra lag, being roughly 16x more resource intensive than the minimum build, this is rather intuitive as the processors being used are 16x faster.  
That being said, going forward tests will assume using 1 instance of the corresponding program(s) and utilizing 1 EX2000 CPU Core.  
#### Cost
|Item|Count|
|-|-|
Processor|1
Oak Button|1
Program Card|6
CPU Core EX2000|6
FE|300/tick
  
![rftc_total_cost](https://github.com/coolbot100s/Modded_MC_Programming/blob/main/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/RFToolsControl/rftc_item_pipe_min_cost_total.png?raw=true)
  
## CC: Tweaked
Okay, now let's say you need to move items REALLY fast.

### Construction & Setup
First, place a full block Wired Modem between between the input and output. 
Unlike the [Hello World](https://github.com/coolbot100s/Modded_MC_Programming/tree/85caea96b1e55ed13053ee1665b2972b99ea7eec/%5B01%5D%20Computing/%7B01%7D%20HelloWorld) tests, we need to use a modem to interact with inventory peripherals.  
Now, right-click the modem and it will list the names of peripherals connected to it, using the test setup this will be something like `"storagedrawers:standard_drawers_1_#"`, make sure you copy these and keep them on a notepad, you'll need these to define the peripherals in your script.  
Now you can place the computer on top, and import your script.  
Note that for this, and all future tests I'll be using an Advanced Computer (turtle, pocket computer, etc.), and this will be reflected in the cost calculations. In most cases, a regular Computer will suffice, but the Advanced Computer is much more convenient and recommended.  

#### Cost
|Item|Count|
|-|-|
Advanced Computer | 1
Wired Modem (full)| 1
  
![cc_item_pipe_total_cost](https://github.com/coolbot100s/Modded_MC_Programming/blob/main/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/ComputerCraft/cc_item_pipe_total_cost.png?raw=true)

### Code
While relatively simple, we can already see that this is a bit more complicated than the other systems we've discussed so far.  
First, you can't drop this build anywhere in the world like the other systems we've tested so far.  
The peripheral variables (lines [7](https://github.com/coolbot100s/Modded_MC_Programming/blob/85caea96b1e55ed13053ee1665b2972b99ea7eec/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/ComputerCraft/itemPipe.lua#L7) & [8](https://github.com/coolbot100s/Modded_MC_Programming/blob/85caea96b1e55ed13053ee1665b2972b99ea7eec/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/ComputerCraft/itemPipe.lua#L8)) expect specific blocks, in specific locations, and are numbered based on how many connections to these blocks have been made in your world, meaning you'll need to edit the script with these names every time you try to set up the script.  
Additionally, while all the other systems we've looked at *let* you define a specific input slot, here it is required  in order to prevent unexpected behavior. (lines [16](https://github.com/coolbot100s/Modded_MC_Programming/blob/85caea96b1e55ed13053ee1665b2972b99ea7eec/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/ComputerCraft/itemPipe.lua#L16) & [17](https://github.com/coolbot100s/Modded_MC_Programming/blob/85caea96b1e55ed13053ee1665b2972b99ea7eec/%5B02%5D%20Logistics/%5B02.1%5D%20Simple/%7B01%7D%20FastTransport/ComputerCraft/itemPipe.lua#L16))  
In return for this comparative rigidity and complexity, we get *much* more control, such as printing out errors when the output is missing, and transferring the exact amount necessary when present.  
This is a trend we'll continue to see throughout future tests, while cc:t can be a bit difficult to work with, it provides everything you need to make extremely powerful and complicated programs.

### Results
CC: Tweaked is able to transfer the maximum capacity of an inventory all at once instantly, making the speed relatively infinite items/tick. However, there is one consequence of this speed, in my testing looping this transfer with no restrictions caused some issues.  
Accounting for the delay necessary to make this stable at top speed, in practice it takes 1 tick to complete this test.  

## Test Results
Time durations assume 20 ticks per second.
| Mod                   | Items / tick | Stacks / tick | Items / second | Total ticks | Total time |
|-|-|-|-|-|-|
| CC: Tweaked           | INF          | INF           | INF            | 1           | 0:00:00 |
| SFM (cheese)          | 8192         | 128           | 163840         | 56          | 0:00:02 |
| RFTC 6 CPUs           | 3072         | 48            | 61440          | 149         | 0:00:07 |
| RFTC/CPU              | 512          | 8             | 10240          | 896         | 0:00:44 |
| Integrated Dynamics   | 64           | 1             | 1280           | 7,168       | 0:05:58 |
| RFTC (B500)           | 32           | 0.5           | 640            | 14,336      | 0:11:56 |
| SFM                   | 6.4          | 0.1           | 128            | 71,680      | 0:59:44 |
| Vanilla (Minecart)    | 0.5          | 0.0078125     | 10             | 917,504     | 12:44:35|
| Vanilla               | 0.125        | 0.001953125   | 2.5            | 3,670,016   | 50:58:20|

## Additional Mods Used
[Observable](https://modrinth.com/mod/observable/version/4.4.1+forge)  
[RF Tools Utility](https://modrinth.com/mod/rftools-utility/version/1.20-6.0.6)  
[Mekanism](https://modrinth.com/mod/mekanism/version/10.4.6.20)  
[Integrated Tunnels](https://modrinth.com/mod/integrated-tunnels/version/1.20.1-1.8.26)  
