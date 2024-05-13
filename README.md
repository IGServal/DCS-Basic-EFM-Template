# DCS Basic EFM Template
Thank you for checking out this flight model project!

This is a successor to my previous custom FM project; a replacement for the DCS simple flight model with emphasis on simplicity and editability while also feeling smooth and believable.
Feedback is always welcome and greatly appreciated.

This is an enhanced template, modified from the original template provided by Eagle Dynamics.
You can find the original in DCSWorld > API.

This FM was designed to work "out of the box", designed like a two-engine subsonic trainer/fighter.

# What is included:
- Lift, drag, side, and thrust forces.
- Axis and discrete (keyboard) pitch, roll, and yaw controls with trim.
- Landing gear, flaps, slats, and air brakes.
- Engine startup/shutdown.
- Basic fuel draining system.
- Basic damage mechanics.
- Semi-realistic stalling, Dutch-rolling, and other oscillations.
- Infinite fuel and easy flight options.
- Example parameter to interface with the Lua environment.
- Lots of comments explaining how things work.

# Instructions:

Open the .sln file and edit away! The most important stuff is in Basic_EFM_Template.cpp and FM_DATA.h. 
Build the solution as dll. 

Microsoft Visual Studio 2019 was used to make this, but I'm sure other versions can work as well.

AFTER BUILDING:
- Go to the directory for the mod you want to integrate this FM with in your /saved games/DCS/mods/aircraft folder.
- Get the output BasicEFM_template.dll and paste it in the "bin" directory (create it if it doesn't exist there).
- Open the "entry.lua" in the mod's folder and add the following line of code below the "info" line:
```
binaries = { 'BasicEFM_template.dll', },
```

- Further in the file where there's lines written "dofile...", before "make_flyable...", add these lines of code:

```
local cfg_path = current_mod_path .."/FM/config.lua"
dofile(cfg_path)
FM[1] 		= self_ID
FM[2] 		= 'BasicEFM_template.dll'
FM.config_path 	= cfg_path
```

- Go to the line, usually near the end that reads "make_flyable..." and add "FM" instead of {nil, old = 54} to the line like shown below

Before:
```
make_flyable('[modded aircraft name]',current_mod_path..'[usually /cocpit/scripts]', {nil, old = 54}, current_mod_path..'/comm.lua')
```

After:
```
make_flyable('[modded aircraft name]',current_mod_path..'[usually /cocpit/scripts]', FM, current_mod_path..'/comm.lua')
```

If the aircraft uses Flaming Cliffs 3 avionics, you can retain that functionality like this:
```
FM.old = 54 -- 54 = Su-25T, 3 = Su-27, 6 = F-15C...
```

- Save the .lua file, boot up DCS, and enjoy a smooth flight!


---------------------------------------------------------------------

Feel free to do whatever you want with the source code, but please give credit where it's due.
