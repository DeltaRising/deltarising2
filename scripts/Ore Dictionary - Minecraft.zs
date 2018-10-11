#==========================#
# Minecraft Ore Dictionary #
#==========================#

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

// for Item in ItemsToRemove {RemoveItem(Item, HideRemovedFromNEI, AddDisabledLabel);}


// by EverybodyLies, June 2017 - April 2018