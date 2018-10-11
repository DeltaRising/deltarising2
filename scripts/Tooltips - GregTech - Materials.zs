#======================#
# GregTech 5 Materials #
#======================#

import minetweaker.item.IItemStack;
import minetweaker.item.IIngredient;
import minetweaker.oredict.IOreDictEntry;
import minetweaker.formatting.IFormattedText;

import mods.MTUtils.Utils; // credits to LionZXY

#=========================================================#
# VARIABLES

val Materials = [
// Meta - OreDictionary - Level - Processing Temperature - Durability - Lore
    "006 - Lithium - 0 - 0 - 0",
    "008 - Berillium - 2 - 0 - 6400",
    "009 - Boron - 0 - 0 - 0",
    "010 - Carbon - 2 - 0 - 6400",
    "017 - Sodium - 0 - 0 - 0",
    "018 - Magnesium - 0 - 0 - 0",
    "019 - Aluminium - 2 - 1700 - 12800",
    "020 - Silicon - 0 - 0 - 0",
    "021 - Phosphor - 0 - 0 - 0",
    "022 - Sulfur - 0 - 0 - 0",
    "025 - Potassium - 0 - 0 - 0",
    "026 - Calcium - 0 - 0 - 0",
    "028 - Titanium - 3 - 1940 - 160000",
    "029 - Vanadium - 0 - 2183 - 0",
    "030 - Chrome - 3 - 1700 - 25600",
    "031 - Manganese - 2 - 0 - 51200",
    "032 - Iron - 2 - 0 - 25600",
    "033 - Cobalt - 3 - 0 - 51200",
    "034 - Nickel - 2 - 0 - 6400",
    "035 - Copper - 0 - 0 - 0",
    "036 - Zinc - 0 - 0 - 0",
    "037 - Gallium - 0 - 0 - 0",
    "039 - Arsenic - 0 - 0 - 0",
    "045 - Yttrium - 0 - 1799 - 0",
    "047 - Niobium - 0 - 2750 - 0",
    "048 - Molybdenum - 2 - 0 - 51200",
    "052 - Palladium - 2 - 1828 - 51200",
    /*
    "0 -  - 0 - 0 - 0",
    "0 -  - 0 - 0 - 0",
    "0 -  - 0 - 0 - 0",
    "0 -  - 0 - 0 - 0",
    "0 -  - 0 - 0 - 0",
    "0 -  - 0 - 0 - 0",
    https://github.com/Blood-Asp/GT5-Unofficial/blob/master/src/main/java/gregtech/api/enums/Materials.java
    */
    "305 - Steel - 2 - 1000 - 51200",
] as IFormattedText[];

val Cells = [
// Meta - Name - Cell Temperature/State/EU/Generator - Plasma Temperature/EU - Reaction Tier^A1^B1/.../Tier^A9^B9
    "001 - Hydrogen - 295/Gas - 10000/1,024,000 - 0",
    "002 - Deuterium - 295/Gas - 10000/2,048,000 - 0",
    "003 - Tritium - 295/Gas - 10000/3,072,000 - 0",
    "004 - Helium - 295/Gas - 10000/4,096,000 - 1^Deuterium^Helium-3/1^Deuterium^Tritium",
    "005 - Helium-3 - 295/Gas - 10000/3,072,000 - 0",
    "006 - Lithium - -1/Unknown - 10000/7,168,000 - 0",
    "008 - Beryllium - -1/Unknown - 10000/9,216,000 - 0",
    "009 - Boron - -1/Unknown - 10000/10,240,000 - 0",
    "010 - Carbon - 300/Solid - 10000/12,288,000 - 0",
    "012 - Nitrogen - 295/Gas - 10000/14,336,000 - 2^Deuterium^Beryllium",
    "013 - Oxygen - 295/Gas - 10000/16,384,000 - 1^Helium-3^Carbon",
    "014 - Fluorine - 53/Gas - 10000/18,432,000 - 0",
    "017 - Sodium - -1/Unknown - 10000/22,528,000 - 0",
    "018 - Magnesium - -1/Unknown - 10000/24,576,000 - 0",
    "019 - Aluminium - -1/Unknown - 10000/26,624,000 - 0",
    "020 - Silicon - -1/Unknown - 10000/28,672,000 - 0",
    "021 - Phosphor - -1/Unknown - 10000/30,720,000 - 0",
    "022 - Sulfur - -1/Unknown - 10000/32,768,000 - 2^Lithium^Aluminium",
    "023 - Chlorine - 295/Gas - 10000/35,840,000 - 0",
    "024 - Argon - 295/Gas - 10000/40,960,000 - 0",
    "025 - Potassium - -1/Unknown - 10000/39,936,000 - 0",
    "026 - Calcium - -1/Unknown - 10000/40,960,000 - 0",
    "028 - Titanium - -1/Unknown - 10000/49,152,000 - 0",
    "029 - Vanadium - -1/Unknown - 10000/52,224,000 - 0",
    "030 - Chrome - -1/Unknown - 10000/53,248,000 - 0",
    "031 - Manganese - -1/Unknown - 10000/56,320,000 - 0",
    "032 - Iron - -1/Unknown - 10000/57,344,000 - 3^Magnesium^Silicon",
    "033 - Cobalt - -1/Unknown - 10000/60,416,000 - 0",
    "034 - Nickel - -1/Unknown - 10000/59,392,000 - 3^Fluorine^Potassium",
    "035 - Copper - -1/Unknown - 10000/64,512,000 - 0",
    "036 - Zinc - -1/Unknown - 10000/66,560,000 - 0",
    "037 - Gallium - -1/Unknown - 10000/71,680,000 - 0",
    "039 - Arsenic - 300/Solid - 10000/76,800,000 - 0",
    "045 - Yttrium - -1/Unknown - 10000/91,136,000 - 0",
    "047 - Niobium - -1/Unknown - 10000/96,256,000 - 0",
    "048 - Molybdenum - -1/Unknown - 10000/97,280,000 - 0",
    "052 - Palladium - -1/Unknown - 10000/108,544,000 - 0",
    "054 - Silver - -1/Unknown - 10000/109,568,000 - 0",
    "055 - Cadmium - -1/Unknown - 10000/114,668,000 - 0",
    "056 - Indium - -1/Unknown - 10000/116,736,000 - 0",
    "057 - Tin - -1/Unknown - 10000/120,832,000 - 0",
    "058 - Antimony - -1/Unknown - 10000/123,904,000 - 0",
    "062 - Caesium - -1/Unknown - 10000/135,168,000 - 0",
    "063 - Barium - -1/Unknown - 10000/140,288,000 - 0",
    "065 - Cerium - -1/Unknown - 10000/143,360,000 - 0",
    "067 - Neodymium - -1/Unknown - 10000/147,456,000 - 0",
    "070 - Europium - -1/Unknown - 10000/154,624,000 - 0",
    "078 - Lutetium - -1/Unknown - 10000/178,176,000 - 0",
    "080 - Tantalum - -1/Unknown - 10000/184,320,000 - 0",
    "081 - Tungsten - -1/Unknown - 10000/187,392,000 - 0",
    "083 - Osmium - -1/Unknown - 10000/193,560,000 - 0",
    "084 - Iridium - -1/Unknown - 10000/196,608,000 - 0",
    "085 - Platinum - -1/Unknown - 10000/199,680,000 - 0",
    "086 - Gold - -1/Unknown - 10000/200,704,000 - 0",
    "087 - Mercury - 295/Liquid - 10000/204,800,000 - 0",
    "089 - Lead - -1/Unknown - 10000/211,968,000 - 0",
    "090 - Bismuth - -1/Unknown - 10000/212,992,000 - 0",
    "093 - Radon - 295/Gas - 10000/225,280,000 - 0",
    "096 - Thorium - -1/Unknown - 10000/235,520,000 - 0",
    "097 - Uranium-235 - -1/Unknown - 10000/240,640,000 - 0",
    "098 - Uranium-238 - -1/Unknown - 10000/243,712,000 - 0",
    "100 - Plutonium-239 - -1/Unknown - 10000/251,904,000 - 0",
    "101 - Plutonium-241 - -1/Unknown - 10000/248,832,000 - 0",
    "103 - Americium - -1/Unknown - 10000/250,880,000 - 0",
    "129 - Neutronium - -1/Unknown - 10000/-679,215,104 - 0",
    "495 - Liquid Air - 79/Liquid - 10000/14,336,000 - 0",
    "496 - Noble Gases - 79/Liquid - 10000/10,240,000 - 0",
    "497 - Carbon Dioxide - 295/Gas - 10000/14,336,000 - 0",

    "324 - Naquadah - 5400/Liquid - 0/0 - 0",
    "326 - Enriched Naquadah - 4500/Liquid - 0/0 - 0",
    "327 - Naquadria - 9000/Liquid - 0/0 - 0",
    "376 - Titaniumtetrachloride - 295/Liquid - 0/0 - 0",
    "377 - Magnesiumchloride - 300/Solid - 0/0 - 0",
    "460 - Hydrogen Sulfide - 295/Gas - 0/0 - 0",
    "485 - Alduorite - 300/Solid - 0/0 - 0",
    "515 - Dilithium - 300/Solid - 0/0 - 0",
    "518 - Forcicium - 300/Solid - 0/0 - 0",
    "519 - Forcillium - 300/Solid - 0/0 - 0",
    "534 - Phosphorus - 300/Solid - 0/0 - 0",
    "606 - Diluted Hydrochloric Acid - 295/Liquid - 0/0 - 0",
    "608 - Raw Growth Medium - 295/Liquid - 0/0 - 0",
    "609 - Sterilized Growth Medium - 295/Liquid - 0/0 - 0",
    "627 - Biodiesel - 295/Liquid - 0/0 - 0",
    "628 - Nitration Mixture - 295/Liquid - 0/0 - 0",
    "629 - Glycerol - 295/Liquid - 0/0 - 0",
    "632 - Dichlorobenzene - 295/Liquid - 0/0 - 0",
    "637 - Styrene - 295/Liquid - 0/0 - 0",
    "638 - Isoprene - 295/Liquid - 0/0 - 0",
    "639 - Tetranitromethane - 295/Liquid - 0/0 - 0",
    "640 - Diluted Sulfuric Acid - 295/Liquid - 0/0 - 0",
    "641 - Ethenone - 295/Gas - 0/0 - 0",
    "642 - Ethane - 295/Gas - 0/0 - 0",
    "643 - Propane - 295/Gas - 0/0 - 0",
    "644 - Butane - 295/Gas - 0/0 - 0",
    "645 - Butene - 295/Gas - 0/0 - 0",
    "646 - Butadiene - 295/Gas - 0/0 - 0",
    "647 - Toluene - 295/Liquid - 0/0 - 0",
    "648 - Epichlorohydrin - 295/Liquid - 0/0 - 0",
    "650 - Vinyl Chloride - 295/Gas - 0/0 - 0",
    "651 - Sulfur Dioxide - 295/Gas - 0/0 - 0",
    "652 - Sulfur Trioxide - 295/Gas - 0/0 - 0",
    "653 - Nitric Acid - 295/Liquid - 0/0 - 0",
    "654 - 1,1-Dimethylhydrazine - 295/Liquid - 0/0 - 0",
    "655 - Chloramine - 295/Liquid - 0/0 - 0",
    "656 - Dimethylamine - 295/Gas - 0/0 - 0",
    "657 - Dinitrogen Tetroxide - 295/Gas - 0/0 - 0",
    "658 - Nitric Oxide - 295/Gas - 0/0 - 0",
    "659 - Ammonia - 295/Gas - 0/0 - 0",
    "660 - Wood Gas - 295/Gas - 0/0 - 0",
    "661 - Wood Vinegar - 295/Liquid - 0/0 - 0",
    "662 - Wood Tar - 295/Liquid - 0/0 - 0",
    "663 - Dimethildichlorosilane - 295/Liquid - 0/0 - 0",
    "664 - Chloromethane - 295/Gas - 0/0 - 0",
    "665 - Phosphorus Pentoxide - 300/Solid - 0/0 - 0",
    "666 - Tetrafluoroethylene - 295/Gas - 0/0 - 0",
    "667 - Hydrofluoric Acid - 295/Liquid - 0/0 - 0",
    "668 - Chloroform - 295/Liquid - 0/0 - 0",
    "669 - Bisphenol A - 432/Liquid - 0/0 - 0",
    "670 - Acetic Acid - 295/Liquid - 0/0 - 0",
    "671 - Calcium Acetate Solution - 295/Liquid - 0/0 - 0",
    "672 - Acetone - 295/Liquid - 0/0 - 0",
    "673 - Methanol - 295/Liquid - 0/0 - 0",
    "674 - Carbon Monoxide - 295/Gas - 0/0 - 0",
    "675 - Charcoal Byproducts - 775/Gas - 0/0 - 0",
    "677 - Ethylene - 295/Gas - 0/0 - 0",
    "678 - Propene - 295/Gas - 0/0 - 0",
    "679 - Vynil Acetate - 295/Liquid - 0/0 - 0",
    "680 - Polyvynil Acetate - 295/Liquid - 0/0 - 0",
    "681 - Methyl Acetate - 295/Liquid - 0/0 - 0",
    "682 - Allyl Chloride - 295/Liquid - 0/0 - 0",
    "683 - Hydrochloric Acid - 295/Liquid - 0/0 - 0",
    "684 - Hypochlorous Acid - 295/Liquid - 0/0 - 0",
    "686 - Benzene - 295/Liquid - 0/0 - 0",
    "687 - Phenol - 295/Liquid - 0/0 - 0",
    "688 - Cumene - 295/Liquid - 0/0 - 0",
    "689 - Phosphoric Acid - 295/Liquid - 0/0 - 0",
    "691 - Fermented Biomass - 295/Liquid - 0/0 - 0",
    "692 - Salt Water - 295/Liquid - 0/0 - 0",
    "702 - Crushed Ice - 300/Liquid - 0/0 - 0",
    "704 - Biomass - 300/Liquid - 0/0 - 0",
    "705 - Biofuel - -1/Unknown - 0/0 - 0",
    "706 - Ethanol - 300/Liquid - 0/0 - 0",
    "707 - Oil - 300/Liquid - 0/0 - 0",
    "708 - Diesel - 300/Liquid - 0/0 - 0",
    "709 - Cetane-Boosted Diesel - 295/Liquid - 0/0 - 0",
    "711 - Fish Oil - 295/Liquid - 0/0 - 0",
    "712 - Creosote - 300/Liquid - 0/0 - 0",
    "713 - Seed Oil - 300/Liquid - 0/0 - 0",
    "714 - Glyceril Trinitrate - 295/Liquid - 0/0 - 0",
    "715 - Methane - 295/Gas - 0/0 - 0",
    "716 - Nitro-Carbon - -1/Unknown - 0/0 - 0",
    "717 - Nitrogen Dioxide - 295/Gas - 0/0 - 0",
    "718 - Sodium Persulfate - 295/Liquid - 0/0 - 0",
    "720 - Sulfuric Acid - 295/Liquid - 0/0 - 0",
    "721 - UU-Amplifier - 295/Liquid - 0/0 - 0",
    "722 - Hemp Seed Oil - -1/Unknown - 0/0 - 0",
    "723 - Lin Seed Oil - -1/Unknown - 0/0 - 0",
    "724 - Lubricant - 295/Liquid - 0/0 - 0",
    "725 - Honey - 300/Liquid - 0/0 - 0",
    "726 - Glue - 295/Liquid - 0/0 - 0",
    "727 - Hot Frying Oil - 400/Liquid - 0/0 - 0",
    "728 - Snow - 300/Solid - 0/0 - 0",
    "729 - Holy Water - 295/Liquid - 0/0 - 0",
    "730 - Heavy Oil - 295/Liquid - 0/0 - 0",
    "731 - Raw Oil - 295/Liquid - 0/0 - 0",
    "732 - Light Oil - 295/Liquid - 0/0 - 0",
    "733 - Natural Gas - 295/Gas - 0/0 - 0",
    "734 - Sulfuric Gas - 295/Gas - 0/0 - 0",
    "735 - Refinery Gas - 295/Gas - 0/0 - 0",
    "736 - Sulfuric Naphtha - 295/Liquid - 0/0 - 0",
    "737 - Sulfuric Light Fuel - 295/Liquid - 0/0 - 0",
    "738 - Sulfuric Heavy Fuel - 295/Liquid - 0/0 - 0",
    "739 - Naphtha - 295/Liquid - 0/0 - 0",
    "740 - Light Fuel - 295/Liquid - 0/0 - 0",
    "741 - Heavy Fuel - 295/Liquid - 0/0 - 0",
    "742 - LPG - 295/Liquid - 0/0 - 0",
    "811 - Glowstone - 300/Solid - 0/0 - 0",
    "833 - Phosphate - 300/Solid - 0/0 - 0",
    "837 - Silicon Dioxide - 300/Solid - 0/0 - 0",
    "853 - Cobalt Hexahydrate - 300/Solid - 0/0 - 0",
    "865 - Graphite - 300/Solid - 0/0 - 0",
    "885 - Milk - 300/Liquid - 0/0 - 0",
    "999 - Mc Guffum 239 - 295/Liquid - 0/0 - 0"
] as IFormattedText[];


#=========================================================#
# FUNCTIONS

function AddMaterial(MaterialInfo as IFormattedText)
{   
    /*
     * gregtech:gt.metaitem.01:00XXX - Tiny Pile
     * gregtech:gt.metaitem.01:01XXX - Small Pile
     * gregtech:gt.metaitem.01:02XXX - Dust
     * gregtech:gt.metaitem.01:03XXX - Impure Dust
     * gregtech:gt.metaitem.01:04XXX - Purified Dust
     * gregtech:gt.metaitem.01:05XXX - Crushed Ore
     * gregtech:gt.metaitem.01:06XXX - Purified Ore
     * gregtech:gt.metaitem.01:07XXX - Centrifuged Ore
     * gregtech:gt.metaitem.01:08XXX - Gem
     * gregtech:gt.metaitem.01:09XXX - Nugget (Chip)
     * -------------------------------
     * gregtech:gt.metaitem.01:11XXX - Ingot
     * gregtech:gt.metaitem.01:12XXX - Hot Ingot
     * -------------------------------
     * gregtech:gt.metaitem.01:17XXX - Plate (Sheet, Plank, Pane)
     * gregtech:gt.metaitem.01:18XXX - Double Plate
     * gregtech:gt.metaitem.01:19XXX - Triple Plate
     * gregtech:gt.metaitem.01:20XXX - Quadruple Plate
     * gregtech:gt.metaitem.01:21XXX - Quintuple Plate
     * gregtech:gt.metaitem.01:22XXX - Dense Plate
     * gregtech:gt.metaitem.01:23XXX - Rod (Stick)
     * gregtech:gt.metaitem.01:24XXX - Lens
     * gregtech:gt.metaitem.01:25XXX - Round
     * gregtech:gt.metaitem.01:26XXX - Bolt (Short Stick)
     * gregtech:gt.metaitem.01:27XXX - Screw
     * gregtech:gt.metaitem.01:28XXX - Ring
     * gregtech:gt.metaitem.01:29XXX - Foil
     * -------------------------------
     * gregtech:gt.GregTech_FluidDisplay:XZ
     * gregtech:gt.metaitem.01:30XXX - Cell (Liquid or Non-Liquid)
     * gregtech:gt.metaitem.01:31XXX - Plasma Cell
     * ===============================
     * gregtech:gt.metaitem.02:16XXX - Turbine Blade
     * -------------------------------
     * gregtech:gt.metaitem.02:19XXX - Fine Wire
     * gregtech:gt.metaitem.02:20XXX - Small Gear
     * gregtech:gt.metaitem.02:21XXX - Rotor
     * gregtech:gt.metaitem.02:22XXX - Long Rod (Long Stick)
     * gregtech:gt.metaitem.02:23XXX - Small Spring
     * gregtech:gt.metaitem.02:24XXX - Spring
     * gregtech:gt.metaitem.02:25XXX - Arrow
     * -------------------------------
     * gregtech:gt.metaitem.02:27XXX - Chipped Gem
     * gregtech:gt.metaitem.02:28XXX - Flawed Gem
     * gregtech:gt.metaitem.02:29XXX - Flawless Gem
     * gregtech:gt.metaitem.02:30XXX - Exquisite Gem
     * gregtech:gt.metaitem.02:31XXX - Gear
     * ===============================
     * gregtech:gt.metaitem.03:00XXX ~ Crate (Packed Dust)
     * gregtech:gt.metaitem.03:01XXX ~ Crate (Packed Ingot)
     * ===============================
     * gregtech:gt.blockmachines:1200-2025 - Wires and Cables
     * gregtech:gt.blockmachines:4XXX + 96 - Frame Box
     * gregtech:gt.blockmachines:5101-5174 - Fluid Pipes
     * gregtech:gt.blockmachines:5602-5639 - Item Pipes
     * gregtech:gt.blockmetal1-8:XZ - Block
     * ===============================
     * gregtech:gt.blockores:0XXX - Stone Ore
     * gregtech:gt.blockores:1XXX - Netherrack Ore
     * gregtech:gt.blockores:2XXX - Endstone Ore
     * gregtech:gt.blockores:3XXX - Blackgranite Ore
     * gregtech:gt.blockores:4XXX - Redgranite Ore
     */

    // Excluded: Cells, Plasma Cells
    val Arr_METAITEM_01  = [0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  11, 12, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29] as int[];
    val Arr_STACKSIZE_01 = [64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 32, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64] as byte[];
    val Arr_METAITEM_02  = [16, 19, 20, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31] as int[];
    val Arr_STACKSIZE_02 = [64, 64, 64, 16, 64, 64, 64, 64, 64, 64, 64, 64, 16] as byte[];

    val DataArr = Utils.split(MaterialInfo, " - ") as IFormattedText[];
    var Arr as IFormattedText[];
    var Item as IItemStack;
    var Material as IOreDictEntry;

    val Meta = Utils.StringToInt(DataArr[0]) as int;
    val OreDict = DataArr[1] as IFormattedText;
    val Level = Utils.StringToInt(DataArr[2]) as int;
    val Temperature = Utils.StringToInt(DataArr[3]) as int;
    val Durability = Utils.StringToInt(DataArr[4]) as int;

    Arr = ["deltarising:material", OreDict];
    Material = Utils.getOreDictEntryFromString(Utils.concat(Arr));
    ShowMaterialStats(Material, Level, Temperature, Durability);

    for i, MetaOffset in Arr_METAITEM_01 {
        Arr = ["gregtech:gt.metaitem.01:", Utils.IntToString(MetaOffset * 1000 + Meta)];
        Item = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr)));
        Material.add(Item);
        Item.addShiftTooltip(format.blue("Normal-sized item. Stack size is " + Arr_STACKSIZE_01[i]));
    }
    for i, MetaOffset in Arr_METAITEM_02 {
        Arr = ["gregtech:gt.metaitem.02:", Utils.IntToString(MetaOffset * 1000 + Meta)];
        Item = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr)));
        Material.add(Item);
        Item.addShiftTooltip(format.blue("Normal-sized item. Stack size is " + Arr_STACKSIZE_02[i]));
    }
}


function ShowMaterialStats(Material as IOreDictEntry, Level as int, Temperature as int, Durability as int)
{
    Material.addTooltip(format.darkGray("Press ") + format.yellow("Shift") + format.darkGray(" for Material Stats"));
    Material.addShiftTooltip("");
    Material.addShiftTooltip(format.darkGray("- ") + format.gray("Processing Temperature: ") + format.gold(Utils.IntToString(Temperature) + " K "));
    Material.addShiftTooltip(format.darkGray("- ") + format.gray("Durability: ") + format.green(Utils.IntToString(Durability)));
    Material.addShiftTooltip(format.darkGray("- ") + format.gray("Material ") + format.yellow("lvl " + Utils.IntToString(Level)));
    Material.addShiftTooltip("");
}


function AddCell(CellInfo as IFormattedText) {
// Meta - Name - Cell Temperature/State/EU/Generator - Plasma Temperature/EU
    val DataArr = Utils.split(CellInfo, " - ") as IFormattedText[];
    val CellArr = Utils.split(DataArr[2], "/") as IFormattedText[];
    val PlasmaArr = Utils.split(DataArr[3], "/") as IFormattedText[];
    val FusionArr = Utils.split(DataArr[4], "/") as IFormattedText[];
    val Meta = Utils.StringToInt(DataArr[0]);

    // Cell
    var Arr = ["gregtech:gt.metaitem.01:", Utils.IntToString(30000 + Meta)] as IFormattedText[];
    var Cell = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr))) as IItemStack;
    if (Utils.StringToInt(CellArr[0]) > 0) {   
        Cell.addTooltip(format.blue("State: ") + format.blue(CellArr[1]));
        Cell.addTooltip(format.red("Temperature: ") + format.red(CellArr[0] + " K"));
    }

    // Plasma Cell
    if (Utils.StringToInt(PlasmaArr[0]) > 0) {    
        Arr = ["gregtech:gt.metaitem.01:", Utils.IntToString(31000 + Meta)];
        Cell = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr)));
        Cell.addTooltip(format.blue("Plasma: ") + format.blue(PlasmaArr[1] + " EU"));
        Cell.addTooltip(format.red("Temperature: ") + format.red(PlasmaArr[0] + " K"));

        ShowFusionReaction(Cell, FusionArr, DataArr[1]);
    }

}

function ShowFusionReaction(PlasmaCell as IItemStack, FusionInfo as IFormattedText[], Name as IFormattedText) {
    PlasmaCell.addTooltip("");

    for Fusion in FusionInfo {
        var Reaction = Utils.split(Fusion, "^") as IFormattedText[];    
        if (Utils.StringToInt(Reaction[0]) > 0) {
            PlasmaCell.addTooltip(format.gray(Name) + format.gold(" <- ") + format.gray(Reaction[1])
                + format.gold(" + ") + format.gray(Reaction[2]));
        } else {
            PlasmaCell.addTooltip(format.gray("Unknown Fusion Reaction"));
        }
    }
}


#=========================================================#
# GENERAL

Utils.executeCommand("/say \u00A76Reloading \u00A76GregTech \u00A76Materials.");

//for Material in Materials {AddMaterial(Material);}
for Cell in Cells {AddCell(Cell);}

Utils.executeCommand("/say \u00A76Done!");

// by EverybodyLies, June 2017