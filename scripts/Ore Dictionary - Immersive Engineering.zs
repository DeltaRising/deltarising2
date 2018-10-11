#======================================#
# Immersive Engineering Ore Dictionary #
#======================================#

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
	"ImmersiveEngineering:metal:0 - ingotCopper", // Can cause ArcFurnace recipe crush.
	"ImmersiveEngineering:metal:0 - ingotAnyCopper",
	"ImmersiveEngineering:metal:1 - ingotAluminum",
	"ImmersiveEngineering:metal:2 - ingotLead",
	"ImmersiveEngineering:metal:3 - ingotSilver",
	"ImmersiveEngineering:metal:4 - ingotNickel",
	"ImmersiveEngineering:metal:5 - ingotCupronickel",
	"ImmersiveEngineering:metal:5 - ingotConstantan",
	"ImmersiveEngineering:metal:6 - ingotElectrum",
	"ImmersiveEngineering:metal:7 - ingotSteel",

	"ImmersiveEngineering:metal:8 - dustIron",
	"ImmersiveEngineering:metal:8 - dustAnyIron",
	"ImmersiveEngineering:metal:9 - dustGold",
	"ImmersiveEngineering:metal:10 - dustCopper",
	"ImmersiveEngineering:metal:10 - dustAnyCopper",
	"ImmersiveEngineering:metal:11 - dustAluminum",
	"ImmersiveEngineering:metal:12 - dustLead",
	"ImmersiveEngineering:metal:13 - dustSilver",
	"ImmersiveEngineering:metal:14 - dustNickel",
	"ImmersiveEngineering:metal:15 - dustCupronickel",
	"ImmersiveEngineering:metal:16 - dustElectrum",
	"ImmersiveEngineering:metal:18 - dustQuartz",

	"ImmersiveEngineering:material:14 - stickIron",
	"ImmersiveEngineering:material:14 - stickAnyIron",
	"ImmersiveEngineering:material:15 - stickSteel",
	"ImmersiveEngineering:material:16 - stickAluminum",

	"ImmersiveEngineering:metal:21 - nuggetIron",
	"ImmersiveEngineering:metal:21 - nuggetAnyIron",
	"ImmersiveEngineering:metal:22 - nuggetCopper",
	"ImmersiveEngineering:metal:22 - nuggetAnyCopper",
	"ImmersiveEngineering:metal:23 - nuggetAluminum",
	"ImmersiveEngineering:metal:24 - nuggetLead",
	"ImmersiveEngineering:metal:25 - nuggetSilver",
	"ImmersiveEngineering:metal:26 - nuggetNickel",
	"ImmersiveEngineering:metal:27 - nuggetCupronickel",
	"ImmersiveEngineering:metal:28 - nuggetElectrum",
	"ImmersiveEngineering:metal:29 - nuggetSteel",

	"ImmersiveEngineering:metal:30 - plateIron",
	"ImmersiveEngineering:metal:30 - plateAnyIron",
	"ImmersiveEngineering:metal:31 - plateCopper",
	"ImmersiveEngineering:metal:31 - plateAnyCopper",
	"ImmersiveEngineering:metal:32 - plateAluminum",
	"ImmersiveEngineering:metal:33 - plateLead",
	"ImmersiveEngineering:metal:34 - plateSilver",
	"ImmersiveEngineering:metal:34 - plateNickel",
	"ImmersiveEngineering:metal:36 - plateCupronickel",
	"ImmersiveEngineering:metal:36 - plateConstantan",
	"ImmersiveEngineering:metal:37 - plateElectrum",
	"ImmersiveEngineering:metal:38 - plateSteel"
	
] as IFormattedText[];


#=========================================================#
# FUNCTIONS

function RemoveItem(Input as IFormattedText, HideItem as int, AddDisabledLabel as int) {

	val DataArr = Utils.split(Input, " - ") as IFormattedText[];
	val Entry = Utils.getOreDictEntryFromString(DataArr[1]) as IOreDictEntry;
	val Item = Utils.getItemStackFromString(Utils.FormattedTextToString(DataArr[0])) as IItemStack;

	Entry.remove(Item);
	if (AddDisabledLabel == 1) Item.addTooltip(format.red(format.italic("- DISABLED in <ore:" + DataArr[1] + "> -")));
	if (HideItem == 1) NEI.hide(Item);
}


#=========================================================#
# GENERAL

for Item in ItemsToRemove {RemoveItem(Item, HideRemovedFromNEI, AddDisabledLabel);}


// by EverybodyLies, June 2017 - April 2018