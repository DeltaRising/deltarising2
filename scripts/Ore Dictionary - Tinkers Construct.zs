#==================================#
# Tinkers Construct Ore Dictionary #
#==================================#

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
	"TConstruct:materials:3 - ingotCobalt",
	"TConstruct:materials:9 - ingotCopper",
	"TConstruct:materials:10 - ingotTin",
	"TConstruct:materials:11 - ingotAluminium",
	"TConstruct:materials:11 - ingotAluminum",
	"TConstruct:materials:13 - ingotBronze",
	"TConstruct:materials:16 - ingotSteel",

	"TConstruct:materials:19 - nuggetIron",
	"TConstruct:materials:20 - nuggetCopper",
	"TConstruct:materials:21 - nuggetTin",
	"TConstruct:materials:22 - nuggetAluminum",
	"TConstruct:materials:22 - nuggetAluminium",
	"TConstruct:materials:28 - nuggetCobalt",
	"TConstruct:materials:31 - nuggetBronze",
	"TConstruct:materials:33 - nuggetSteel",

	"TConstruct:oreBerries:0 - nuggetIron",
	"TConstruct:oreBerries:1 - nuggetGold",
	"TConstruct:oreBerries:2 - nuggetCopper",
	"TConstruct:oreBerries:3 - nuggetTin",
	"TConstruct:oreBerries:4 - nuggetAluminum",
	"TConstruct:oreBerries:4 - nuggetAluminium",

	"TConstruct:materials:39 - dustCobalt",
	"TConstruct:materials:40 - dustAluminium",
	"TConstruct:materials:40 - dustAluminum"

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


// by EverybodyLies, May 2018