#================================#
# IndustrialCraft Ore Dictionary #
#================================#

import minetweaker.item.IItemStack;
import minetweaker.item.IIngredient;
import minetweaker.oredict.IOreDictEntry;
import minetweaker.formatting.IFormattedText;

import mods.MTUtils.Utils; // credits to LionZXY
import mods.nei.NEI;
import mods.railcraft.RockCrusher;

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
	"IC2:itemCrushedOre:0 - crushedIron",
	"IC2:itemCrushedOre:0 - crushedAnyIron",
	"IC2:itemCrushedOre:1 - crushedCopper",
	"IC2:itemCrushedOre:1 - crushedAnyCopper",
	"IC2:itemCrushedOre:2 - crushedGold",
	"IC2:itemCrushedOre:3 - crushedTin",
	"IC2:itemCrushedOre:4 - crushedUranium",
	"IC2:itemCrushedOre:5 - crushedSilver",
	"IC2:itemCrushedOre:6 - crushedLead",

	"IC2:itemPurifiedCrushedOre:0 - crushedPurifiedIron",
	"IC2:itemPurifiedCrushedOre:0 - crushedPurifiedAnyIron",
	"IC2:itemPurifiedCrushedOre:1 - crushedPurifiedCopper",
	"IC2:itemPurifiedCrushedOre:1 - crushedPurifiedAnyCopper",
	"IC2:itemPurifiedCrushedOre:2 - crushedPurifiedGold",
	"IC2:itemPurifiedCrushedOre:3 - crushedPurifiedTin",
	"IC2:itemPurifiedCrushedOre:4 - crushedPurifiedUranium",
	"IC2:itemPurifiedCrushedOre:5 - crushedPurifiedSilver",
	"IC2:itemPurifiedCrushedOre:6 - crushedPurifiedLead",

	"IC2:itemDustSmall:0 - dustTinyIron",
	"IC2:itemDustSmall:0 - dustTinyAnyIron",
	"IC2:itemDustSmall:1 - dustTinyCopper",
	"IC2:itemDustSmall:1 - dustTinyAnyCopper",
	"IC2:itemDustSmall:2 - dustTinyGold",
	"IC2:itemDustSmall:3 - dustTinyTin",
	"IC2:itemDustSmall:4 - dustTinySilver",
	"IC2:itemDustSmall:5 - dustTinyLead",
	"IC2:itemDustSmall:6 - dustTinySulfur",
	"IC2:itemDustSmall:7 - dustTinyLithium",
	"IC2:itemDustSmall:8 - dustTinyBronze",
	"IC2:itemDustSmall:8 - dustTinyAnyBronze",
	"IC2:itemDustSmall:9 - dustTinyLapis",
	"IC2:itemDustSmall:10 - dustTinyObsidian",

	"IC2:itemDust:0 - dustBronze",
	"IC2:itemDust:0 - dustAnyBronze",
	"IC2:itemDust:1 - dustClay",
	"IC2:itemDust:2 - dustCoal",
	"IC2:itemDust:3 - dustCopper",
	"IC2:itemDust:3 - dustAnyCopper",
	"IC2:itemDust:4 - dustGold",
	"IC2:itemDust:5 - dustIron",
	"IC2:itemDust:5 - dustAnyIron",
	"IC2:itemDust:6 - dustSilver",
	"IC2:itemDust:7 - dustTin",
	"IC2:itemDust:8 - dustHydratedCoal",
	"IC2:itemDust:9 - dustStone",
	"IC2:itemDust:10 - dustLead",
	"IC2:itemDust:11 - dustObsidian",
	"IC2:itemDust:12 - dustLapis",
	"IC2:itemDust:12 - dyeBlue",
	"IC2:itemDust:12 - dye",
	"IC2:itemDust:13 - dustSulfur",
	"IC2:itemDust:14 - dustLithium",
	"IC2:itemDust2:0 - dustSiliconDioxide",
	"IC2:itemDust2:1 - dustDiamond",
	"IC2:itemDust2:3 - dustAshes",

	"IC2:itemIngot:0 - ingotCopper",
	"IC2:itemIngot:0 - ingotAnyCopper",
	"IC2:itemIngot:1 - ingotTin",
	"IC2:itemIngot:2 - ingotBronze",
	"IC2:itemIngot:2 - ingotAnyBronze",
	"IC2:itemIngot:3 - ingotSteel",
	"IC2:itemIngot:5 - ingotLead",
	"IC2:itemIngot:6 - ingotSilver",

	"IC2:itemPlates:0 - plateCopper",
	"IC2:itemPlates:0 - plateAnyCopper",
	"IC2:itemPlates:1 - plateTin",
	"IC2:itemPlates:2 - plateBronze",
	"IC2:itemPlates:2 - plateAnyBronze",
	"IC2:itemPlates:3 - plateGold",
	"IC2:itemPlates:4 - plateIron",
	"IC2:itemPlates:4 - plateAnyIron",
	"IC2:itemPlates:5 - plateSteel",
	"IC2:itemPlates:6 - plateLead",
	"IC2:itemPlates:7 - plateObsidian",
	"IC2:itemPlates:8 - plateLapis",

	"IC2:itemDensePlates:0 - plateDenseCopper",
	"IC2:itemDensePlates:0 - plateDenseAnyCopper",
	"IC2:itemDensePlates:1 - plateDenseTin",
	"IC2:itemDensePlates:2 - plateDenseBronze",
	"IC2:itemDensePlates:2 - plateDenseAnyBronze",
	"IC2:itemDensePlates:3 - plateDenseGold",
	"IC2:itemDensePlates:4 - plateDenseIron",
	"IC2:itemDensePlates:4 - plateDenseAnyIron",
	"IC2:itemDensePlates:5 - plateDenseSteel",
	"IC2:itemDensePlates:6 - plateDenseLead",
	"IC2:itemDensePlates:7 - plateDenseObsidian",
	"IC2:itemDensePlates:8 - plateDenseLapis",

] as IFormattedText[];

val ItemsToHide = [

	<IC2:itemFluidCell>, // Universal Cell
	
] as IItemStack[];


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

function AddItemTags() {

    <ore:cellCompressedAir>.add(<IC2:itemCellEmpty:5>);
    <ore:cellIC2Biomass>.add(<IC2:itemCellEmpty:6>);
    <ore:cellBiogas>.add(<IC2:itemCellEmpty:7>);
    <ore:cellElectrolyzedWater>.add(<IC2:itemCellEmpty:8>);
    <ore:cellCoolant>.add(<IC2:itemCellEmpty:9>);
    <ore:cellHotCoolant>.add(<IC2:itemCellEmpty:10>);
    <ore:cellPahoehoeLava>.add(<IC2:itemCellEmpty:11>);
    <ore:cellDistilledWater>.add(<IC2:itemCellEmpty:12>);
    <ore:cellSuperheatedSteam>.add(<IC2:itemCellEmpty:13>);
    <ore:cellSteam>.add(<IC2:itemCellEmpty:14>);

    <ore:cellCoolant_10k>.add(<IC2:reactorCoolantSimple:*>);
    <ore:cellCoolant_30k>.add(<IC2:reactorCoolantTriple:*>);
    <ore:cellCoolant_60k>.add(<IC2:reactorCoolantSix:*>);
        <ore:cellCoolant_60k>.add(<gregtech:gt.60k_NaK_Coolantcell>);
        <ore:cellCoolant_180k>.add(<gregtech:gt.180k_NaK_Coolantcell>);
        <ore:cellCoolant_360k>.add(<gregtech:gt.360k_NaK_Coolantcell>);
    <ore:cellCoolant_60k>.add(<gregtech:gt.60k_Helium_Coolantcell>);
    <ore:cellCoolant_180k>.add(<gregtech:gt.180k_Helium_Coolantcell>);
    <ore:cellCoolant_360k>.add(<gregtech:gt.360k_Helium_Coolantcell>);

    <ore:itemHeatConductor>.add(<IC2:itemRecipePart:5>);
    <ore:itemCopperBoiler>.add(<IC2:itemRecipePart:6>);
}


function FixOreCrushing() {

    val Ores = [
        <ore:oreIron>, <ore:oreCopper>, <ore:oreGold>, <ore:oreTin>, <ore:oreUranium>, <ore:oreSilver>, <ore:oreLead>
    ] as IIngredient[];

    val Crused = [
        <gregtech:gt.metaitem.01:5032>,
        <gregtech:gt.metaitem.01:5035>,
        <gregtech:gt.metaitem.01:5086>,
        <gregtech:gt.metaitem.01:5057>,
        <gregtech:gt.metaitem.01:5098>,
        <gregtech:gt.metaitem.01:5054>,
        <gregtech:gt.metaitem.01:5089>
    ] as IItemStack[];

    val Dust = [
        <gregtech:gt.metaitem.01:2034>, // Nickel Dust
        <gregtech:gt.metaitem.01:2033>, // Cobalt Dust
        <gregtech:gt.metaitem.01:2035>, // Copper Dust
        <gregtech:gt.metaitem.01:2032>, // Iron Dust
        <gregtech:gt.metaitem.01:2089>, // Lead Dust
        <gregtech:gt.metaitem.01:2089>, // Lead Dust
        <gregtech:gt.metaitem.01:2054>  // Silver Dust
    ] as IItemStack[];

    for i, Ore in Ores {
        RockCrusher.removeRecipe(Ore);
        for Block in Ore.items {
            RockCrusher.addRecipe(Block, false, false, [Crused[i] * 2, Dust[i], <gregtech:gt.metaitem.01:2299>], [1.0, 0.1, 0.5]);
        }
    }

}


#=========================================================#
# GENERAL

for Item in ItemsToRemove { RemoveItem(Item, HideRemovedFromNEI, AddDisabledLabel); }
for Item in ItemsToHide { NEI.hide(Item); }
AddItemTags();
FixOreCrushing();


// by EverybodyLies, June 2017 - April 2018