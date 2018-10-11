#=========================#
# Forestry Ore Dictionary #
#=========================#

import minetweaker.item.IItemStack;
import minetweaker.oredict.IOreDictEntry;
import minetweaker.formatting.IFormattedText;

import mods.MTUtils.Utils;
import mods.nei.NEI;

#=========================================================#
# SETTINGS

// So..?
val HideRemovedFromNEI = 0;

// So..?
val AddDisabledLabel = 1;


#=========================================================#
# VARIABLES

val ItemsToRemove = [
// Item - Tag
	"Forestry:apatite - gemApatite",
	"Forestry:ingotCopper - ingotCopper",
	"Forestry:ingotCopper - ingotAnyCopper",
	"Forestry:ash - dustAsh",
	"Forestry:ingotTin - ingotTin",
	"Forestry:ingotBronze - ingotBronze",
	"Forestry:ingotBronze - ingotAnyBronze",
	"Forestry:woodPulp - pulpWood",
	"Forestry:woodPulp - dustWood",

	"Forestry:gearCopper - gearCopper",
	"Forestry:gearCopper - thermalexpansion:machineCopper",
	"Forestry:gearBronze - gearBronze",
	"Forestry:gearBronze - thermalexpansion:machineBronze",
	"Forestry:gearTin - gearTin",
	"Forestry:gearTin - thermalexpansion:machineTin",
	
] as IFormattedText[];


#=========================================================#
# FUNCTIONS

function RemoveItem(Input as IFormattedText, HideItem as int, AddDisabledLabel as int) {

	val DataArr = Utils.split(Input, " - ") as IFormattedText[];
	val Item = Utils.getItemStackFromString(Utils.FormattedTextToString(DataArr[0])) as IItemStack;
	val Entry = Utils.getOreDictEntryFromString(DataArr[1]) as IOreDictEntry;

	Entry.remove(Item);
	recipes.remove(Item); // for Gears
	if (AddDisabledLabel == 1) Item.addTooltip(format.red(format.italic("- DISABLED in <ore:" + DataArr[1] + "> -")));
	if (HideItem == 1) NEI.hide(Item);
}


#=========================================================#
# GENERAL

for Item in ItemsToRemove {RemoveItem(Item, HideRemovedFromNEI, AddDisabledLabel);}


// by EverybodyLies, April 2018