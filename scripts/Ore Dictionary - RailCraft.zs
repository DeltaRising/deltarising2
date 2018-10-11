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
	"Railcraft:dust:0 - dustObsidian",
	"Railcraft:dust:1 - dustSulfur",
	"Railcraft:dust:2 - dustSaltpeter",
	"Railcraft:dust:3 - dustCharcoal",

	"Railcraft:nugget:0 - nuggetIron",
	"Railcraft:nugget:0 - nuggetAnyIron",
	"Railcraft:nugget:1 - nuggetSteel",
	"Railcraft:nugget:2 - nuggetCopper",
	"Railcraft:nugget:2 - nuggetAnyCopper",
	"Railcraft:nugget:3 - nuggetTin",
	"Railcraft:nugget:4 - nuggetLead",

	"Railcraft:ingot:0 - ingotSteel",
	"Railcraft:ingot:1 - ingotCopper",
	"Railcraft:ingot:1 - ingotAnyCopper",
	"Railcraft:ingot:2 - ingotTin",
	"Railcraft:ingot:3 - ingotLead",

	"Railcraft:part.plate - plateIron",
	"Railcraft:part.plate - plateAnyIron",
	"Railcraft:part.plate:1 - plateSteel",
	"Railcraft:part.plate:2 - plateTinAlloy",
	"Railcraft:part.plate:3 - plateCopper",
	"Railcraft:part.plate:3 - plateAnyCopper",
	"Railcraft:part.plate:4 - plateLead"
	
] as IFormattedText[];


#=========================================================#
# FUNCTIONS

function RemoveItem(Input as IFormattedText, HideItem as int, AddDisabledLabel as int) {

	val DataArr = Utils.split(Input, " - ") as IFormattedText[];
	val Item = Utils.getItemStackFromString(Utils.FormattedTextToString(DataArr[0])) as IItemStack;
	val Entry = Utils.getOreDictEntryFromString(DataArr[1]) as IOreDictEntry;

	Entry.remove(Item);
	if (AddDisabledLabel == 1) Item.addTooltip(format.red(format.italic("- DISABLED in <ore:" + DataArr[1] + "> -")));
	if (HideItem == 1) NEI.hide(Item);
}


#=========================================================#
# GENERAL

for Item in ItemsToRemove {RemoveItem(Item, HideRemovedFromNEI, AddDisabledLabel);}


// by EverybodyLies, June 2017 - April 2018