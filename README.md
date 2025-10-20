# Combat Art System

The system is minimalistic in design, containing only what it essentially needs to get its core task done, which is to have a Combat Art system similar to other Fire Emblem titles, in FE8, without all the other stuff SkillSystems adds. Any engine hacks included in the install are included entirely as to not have to reinvent any wheels (ItemRangeFix, for example).

## Installation
This repo contains every file necessary to include this as **part of an EA Buildfile**. FEBuilder installation is possible and easy - but this repo does not contain tools to support editing data post-installation. I also probably don't plan to make anything to do so.

Installation is as easy as including `_Installer.event` in your buildfile. 

## Customisation

The only folders the average user of this system would need to interact with would be `Custom` (for adding custom arts) and `CalcLoops` (if you want to add more functions to the calc loops)

To customise other elements of the system, most options can be found in `Config.event`.

finish this section later

## Credits
- Ditto
- Retina
- Tequila/Lord Reyson/Teraspark for ItemRangeFix
- Hextator and Nintenlord for Anti-Huffman
