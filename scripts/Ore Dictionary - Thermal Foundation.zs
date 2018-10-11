#===================================#
# Thermal Foundation Ore Dictionary #
#===================================#

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
	"ThermalFoundation:material:0 - dustIron", // WARNING: some of TE machines recipes still works
	"ThermalFoundation:material:0 - dustAnyIron",
	"ThermalFoundation:material:1 - dustGold",
	"ThermalFoundation:material:2 - dustCoal",
	"ThermalFoundation:material:2 - dyeBlack",
	"ThermalFoundation:material:2 - dye",
	"ThermalFoundation:material:3 - dustCharcoal",
	"ThermalFoundation:material:3 - dyeBlack",
	"ThermalFoundation:material:3 - dye",
	"ThermalFoundation:material:4 - dustObsidian",
	"ThermalFoundation:material:16 - dustSulfur",
	"ThermalFoundation:material:16 - dyeYellow",
	"ThermalFoundation:material:16 - dye",
	"ThermalFoundation:material:17 - dustSaltpeter",
	"ThermalFoundation:material:32 - dustCopper",
	"ThermalFoundation:material:32 - dustAnyCopper",
	"ThermalFoundation:material:33 - dustTin",
	"ThermalFoundation:material:34 - dustSilver",
	"ThermalFoundation:material:35 - dustLead",
	"ThermalFoundation:material:36 - dustNickel",
	"ThermalFoundation:material:37 - dustPlatinum",
	"ThermalFoundation:material:38 - dustMithril",
	"ThermalFoundation:material:39 - dustElectrum",
	"ThermalFoundation:material:40 - dustInvar",
	"ThermalFoundation:material:41 - dustBronze",
	"ThermalFoundation:material:41 - dustAnyBronze",
	"ThermalFoundation:material:44 - dustEnderium",
	
	"ThermalFoundation:material:8 - nuggetIron",
	"ThermalFoundation:material:8 - nuggetAnyIron",
	"ThermalFoundation:material:96 - nuggetCopper",
	"ThermalFoundation:material:96 - nuggetAnyCopper",
	"ThermalFoundation:material:97 - nuggetTin",
	"ThermalFoundation:material:98 - nuggetSilver",
	"ThermalFoundation:material:99 - nuggetLead",
	"ThermalFoundation:material:100 - nuggetNickel",
	"ThermalFoundation:material:101 - nuggetPlatinum",
	"ThermalFoundation:material:102 - nuggetMithril",
	"ThermalFoundation:material:103 - nuggetElectrum",
	"ThermalFoundation:material:104 - nuggetInvar",
	"ThermalFoundation:material:105 - nuggetBronze",
	"ThermalFoundation:material:105 - nuggetAnyBronze",
	"ThermalFoundation:material:108 - nuggetEnderium",

	"ThermalFoundation:material:64 - ingotCopper",
	"ThermalFoundation:material:64 - ingotAnyCopper",
	"ThermalFoundation:material:65 - ingotTin",
	"ThermalFoundation:material:66 - ingotSilver",
	"ThermalFoundation:material:67 - ingotLead",
	"ThermalFoundation:material:68 - ingotNickel",
	"ThermalFoundation:material:69 - ingotPlatinum",
	"ThermalFoundation:material:70 - ingotMithril",
	"ThermalFoundation:material:71 - ingotElectrum",
	"ThermalFoundation:material:72 - ingotInvar",
	"ThermalFoundation:material:73 - ingotBronze",
	"ThermalFoundation:material:73 - ingotAnyBronze",
	"ThermalFoundation:material:76 - ingotEnderium",

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