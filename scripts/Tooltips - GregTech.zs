#================================#
# GregTech 5 Unofficial Tooltips #
#================================#

import minetweaker.item.IItemStack;
import minetweaker.item.IIngredient;
import minetweaker.oredict.IOreDictEntry;
import minetweaker.formatting.IFormattedText;

import mods.MTUtils.Utils; // credits to LionZXY

#=========================================================#
# SETTINGS

val EnableOreProducts = 1 as byte;
val EnableOreSpawning = 1 as byte;
val EnableFuelsEnergy = 1 as byte;
val EnablePlasmaEnergy = 1 as byte;
val ShowCircuitsVoltage = 0 as byte;

/*
 * Show tooltips for all compatible ores (by oredict) or just GregTech ones?
 * 0 = by Ore Dictionary
 * 1 = GregTech only [by default]
 */
val AddTooltipsByOreDictionary = 1 as byte;

/*
 * Show information about applicable fuel generators?
 * 0 = Hide 
 * 1 = Show [by default]
 */
val ShowFuelGeneratorsInfo = 1 as byte;

/*
 * Show information about wafers and chips?
 * 0 = Hide 
 * 1 = Show [by default]
 */
val EnableWafersInfo = 1 as byte;


#=========================================================#
# VARIABLES

/*
 * GregTech ID's:
 *
 * gregtech:gt.blockores:0XXX - Stone Ore
 * gregtech:gt.blockores:1XXX - Netherrack Ore
 * gregtech:gt.blockores:2XXX - Endstone Ore
 * gregtech:gt.blockores:3XXX - Blackgranite Ore
 * gregtech:gt.blockores:4XXX - Redgranite Ore
 *
 * Ore Processing:
 *
 * gregtech:gt.metaitem.01:0XXX - Tiny Pile
 * gregtech:gt.metaitem.01:1XXX - Small Pile
 * gregtech:gt.metaitem.01:2XXX - Dust
 * gregtech:gt.metaitem.01:3XXX - Impure Dust
 * gregtech:gt.metaitem.01:4XXX - Purified Dust
 * gregtech:gt.metaitem.01:5XXX - Crushed Ore
 * gregtech:gt.metaitem.01:6XXX - Purified Ore
 * gregtech:gt.metaitem.01:7XXX - Centrifuged Ore
 */

val Ores = [
//  "ID - OreDict - Product - Byproducts count - [Ore, Crushed Ore(CRUSH,WASH,CTFG), Purified Ore, Purified Dust, Centrifuged Ore, Impure Dust]"
	"870 - Magnetite - Fe3O4 \u00A78x 2 - 1 - Fe, Au", 													 // 0
	"923 - VanadiumMagnetite - Fe3O4V \u00A78x 2 - 1 - Fe3O4, V", 										 // 1
	"032 - Iron - Fe \u00A78x 2 - 8 - Ni, Ni, Ni, Sn, Sn, Sn, Sn, Ni", 									 // 2
	"086 - Gold - Au \u00A78x 2 - 1 - Cu, Ni", 															 // 3
	"930 - BrownLimonite - FeHO2 \u00A78x 2 - 1 - Cu2CH2O5, FeHO2", 									 // 4
	"931 - YellowLimonite - FeHO2 \u00A78x 2 - 1 - Ni, FeHO2, Co", 										 // 5
	"917 - BandedIron - Fe2O3 \u00A78x 2 - 1 - Fe", 													 // 6
	"871 - Malachite - Cu2CH2O5 \u00A78x 2 - 1 - Cu, FeHO2, CaCO3", 									 // 7
	"538 - Lignite - C2(H20)4C \u00A78x 2 - 1 - \u00A7oCoal", 											 // 8
	"535 - Coal - \u00A7oCoal \u00A78x 2 - 1 - C2(H20)4C, Th", 											 // 9
	"057 - Tin - Sn \u00A78x 2 - 1 - Fe, Zn", 															 // 10
	"824 - Cassiterite - SnO2 \u00A78x 4 - 1 - Sn", 													 // 11
	"878 - Oilsands - \u00A7oOil \u00A78x 500L - 1 - \u00A7oSand", 										 // 12
	"855 - Chalcopyrite - CuFeS2 \u00A78x 2 - 1 - FeS2, Co, Cd, Au", 									 // 13
	"834 - Pyrite - FeS2 \u00A78x 2 - 1 - S, Ca3(PO4)2, Fe", 											 // 14
	"035 - Copper - Cu \u00A78x 2 - 1 - Co, Au, Ni", 													 // 15
	"840 - Tetrahedrite - Cu3SbS3Fe \u00A78x 2 - 1 - Sb, Zn", 											 // 16
	"945 - Stibnite - Sb2S3 \u00A78x 2 - 1 - Sb", 														 // 17
	"822 - Bauxite - (TiO2)2AlH10O11 \u00A78x 2 - 1 - Ca3Al2Si3O12, TiO2, Ga", 							 // 18
	"019 - Aluminium - Al \u00A78x 2 - 1 - (TiO2)2AlH10O11", 											 // 19
	"918 - Ilmenite - FeTiO3 \u00A78x 2 - 1 - Fe, TiO2", 												 // 20
	"810 - Redstone - Si(FeS2)5CrAl2O3Hg3 \u00A78x 10 - 1 - HgS, \u00A7oRare Earth\u00A7r\u00A77, \u00A7oGlowstone", // 21
	"502 - Ruby - CrAl2O3 \u00A78x 2 - 1 - Cr, \u00A7oRed Garnet", 										 // 22
	"826 - Cinnabar - HgS \u00A78x 2 - 1 - Si(FeS2)5CrAl2O3Hg3, S, \u00A7oGlowstone", 					 // 23
	"944 - RockSalt - KCl \u00A78x 4 - 1 - NaCl", 														 // 24
	"817 - Salt - NaCl \u00A78x 4 - 1 - KCl", 															 // 25
	"907 - Lepidolite - KLiAl4F2O10 \u00A78x 2 - 1 - Li, Cs", 											 // 26
	"920 - Spodumene - LiAlSi2O6 \u00A78x 2 - 1 - Al, Li", 												 // 27
	"820 - Almandine - Al2Fe3Si3O12 \u00A78x 2 - 1 - \u00A7oRed Garnet\u00A7r\u00A77, Al", 				 // 28
	"835 - Pyrope - Al2Mg3Si3O12 \u00A78x 2 - 1 - \u00A7oRed Garnet\u00A7r\u00A77, Mg", 				 // 29
	"503 - Sapphire - Al2O3 \u00A78x 2 - 1 - Al, Al2O3", 												 // 30
	"504 - GreenSapphire - Al2O3 \u00A78x 2 - 1 - Al, Al2O3", 											 // 31
	"523 - Quartzite - \u00A7oQuartzite \u00A78x 2 - 1 - \u00A7oCertus Quartz\u00A7r\u00A77, BaSO4", 	 // 32
	"904 - Barite - BaSO4 \u00A78x 2 - 1 - BaSO4", 														 // 33
	"516 - CertusQuartz - \u00A7oCertus Quartz \u00A78x 4 - 1 - \u00A7oQuartzite\u00A7r\u00A77, BaSO4",  // 34
	"927 - Bentonite - NaMg6Si12H6(H2O)5O36 \u00A78x 2 - 1 - Al, Ca, Mg",  								 // 35
	"908 - Magnesite - MgCO3 \u00A78x 2 - 1 - Mg", 														 // 36
	"505 - Olivine - Mg2Fe(SiO2)2 \u00A78x 2 - 1 - Al2Mg3Si3O12, Mg", 									 // 37
	"933 - Glauconite - KMg2Al4H2O12 \u00A78x 2 - 1 - Na, Al, Fe", 										 // 38
	"530 - Apatite - Ca5(PO4)3Cl \u00A78x 8 - 1 - Ca3(PO4)2", 											 // 39
	"534 - Phosphorus - Ca3(PO4)2 \u00A78x 6 - 1 - Ca5(PO4)3Cl, PO4", 									 // 40
	"833 - Phosphate - PO4 \u00A78x 2 - 1 - P", 														 // 41
	"830 - Galena - Pb3Ag3S2 \u00A78x 2 - 1 - S, Ag, Pb", 												 // 42
	"054 - Silver - Ag \u00A78x 2 - 1 - Pb, S", 														 // 43
	"089 - Lead - Pb \u00A78x 2 - 1 - Ag, S", 															 // 44
	"877 - Soapstone - Mg3Si4H2O12 \u00A78x 2 - 1 - Mg3Si4H2O12", 										 // 45
	"902 - Talc - Mg3Si4H2O12 \u00A78x 2 - 1 - Mg3Si4H2O12", 											 // 46
	"909 - Pentlandite - Ni9S8 \u00A78x 2 - 1 - Fe, S, Co", 											 // 47
	"906 - Garnierite - NiO \u00A78x 2 - 1 - Ni", 														 // 48
	"034 - Nickel - Ni \u00A78x 2 - 1 - Co, Pt, Fe", 													 // 49
	"827 - Cobaltite - CoAsS \u00A78x 2 - 1 - Co", 														 // 50
	"873 - Pitchblende - (UO2)3ThPb \u00A78x 2 - 1 - Th, U, Pb", 										 // 51
	"098 - Uranium - U \u00A78x 2 - 1 - Pb, U-235, Th", 												 // 52
	"922 - Uraninite - UO2 \u00A78x 2 - 1 - U, Th", 													 // 53
	"524 - Lazurite - Al6Si6Ca8Na8 \u00A78x 12 - 1 - Al3Si3Na4Cl, \u00A7oLapis",    					 // 54
	"525 - Sodalite - Al3Si3Na4Cl \u00A78x 12 - 1 - Al6Si6Ca8Na8, \u00A7oLapis",    					 // 55
	"526 - Lapis - \u00A7oLapis \u00A78x 12 - 1 - Al6Si6Ca8Na8, Al3Si3Na4Cl, FeS2", 					 // 56
	"823 - Calcite - CaCO3 \u00A78x 2 - 1 - Ca3Fe2Si3O12, Cu2CH2O5", 									 // 57
	"865 - Graphite - \u00A7oGraphite \u00A78x 2 - 1 - C", 												 // 58
	"500 - Diamond - \u00A7oDiamond \u00A78x 2 - 1 - \u00A7oGraphite", 									 // 59
	"905 - Bastnasite - CeCFO3 \u00A78x 2 - 1 - Nd, \u00A7oRare Earth", 								 // 60
	"520 - Monazite - ?PO4 \u00A78x 16 - 1 - Th, Nd, \u00A7oRare Earth", 								 // 61
	"067 - Neodymium - Nd \u00A78x 2 - 1 - ?PO4, \u00A7oRare Earth", 									 // 62
	"008 - Beryllium - Be \u00A78x 2 - 1 - Be3Al2Si6O18", 												 // 63
	"501 - Emerald - Be3Al2Si6O18 \u00A78x 2 - 1 - Be, Al", 											 // 64
	"096 - Thorium - Th \u00A78x 2 - 1 - U, Pb", 														 // 65
	"831 - Grossular - Ca3Al2Si3O12 \u00A78x 2 - 1 - \u00A7oYellow Garnet\u00A7r\u00A77, Ca", 			 // 66
	"838 - Spessartine - Al2Mn3Si3O12 \u00A78x 2 - 1 - \u00A7oRed Garnet\u00A7r\u00A77, Mn",  			 // 67
	"943 - Pyrolusite - MnO2 \u00A78x 2 - 1 - Mn", 														 // 68
	"921 - Tantalite - MnTa2O6 \u00A78x 2 - 1 - Mn, Nb, Ta", 											 // 69
	"910 - Scheelite - WCa2O4 \u00A78x 4 - 1 - Mn, Mo, Ca", 											 // 70
	"841 - Tungstate - WLi2O4 \u00A78x 4 - 1 - Mn, Ag, Li", 											 // 71
	"006 - Lithium - Li \u00A78x 2 - 1 - Li", 															 // 72
	"882 - Wulfenite - PbMoO4 \u00A78x 2 - 1 - PbMoO4", 												 // 73
	"942 - Molybdenite - MoS2 \u00A78x 2 - 1 - Mo", 													 // 74
	"048 - Molybdenum - Mo \u00A78x 2 - 1 - Mo", 														 // 75
	"883 - Powellite - CaMoO4 \u00A78x 2 - 1 - CaMoO4", 												 // 76
	"828 - Cooperite - Pt3NiSPd \u00A78x 2 - 1 - Pd, Ni, Ir", 											 // 77
	"052 - Palladium - Pd \u00A78x 2 - 1 - Pd", 														 // 78
	"085 - Platinum - Pt \u00A78x 2 - 1 - Ni, Ir", 														 // 79
	"084 - Iridium - Ir \u00A78x 2 - 1 - Pt, Os", 														 // 80
	"022 - Sulfur - S \u00A78x 2 - 1 - S", 																 // 81
	"839 - Sphalerite - ZnS \u00A78x 2 - 1 - \u00A7oYellow Garnet\u00A7r\u00A77, Cd, Ga, Zn", 			 // 82
	"522 - NetherQuartz - \u00A7oNether Quartz \u00A78x 4 - 1 - \u00A7oNetherrack Dust", 	   			 // 83
	"324 - Naquadah - Nq \u00A78x 2 - 1 - Nq+", 														 // 84
	"326 - NaquadahEnriched - Nq+ \u00A78x 2 - 1 - Nq, NqX" 											 // 85
] as IFormattedText[];

val Veins = [
//  "Ore Indexes - Spawn Types - Vein Name - Height Min, Max - Weight, Density, Size - Dimensions"
	"0,2,1 - 3,4,8 - Magnetite - 50,120 - 160,3,32 - Overworld, Nether",
	"0,1,3 - 3,4,8 - Gold - 60,80 - 160,3,32 - Overworld, Nether",
	"4,5,6,7 - 1,2,4,8 - Iron - 10,40 - 120,4,24 - Overworld, Nether",
	"8,9 - 7,8 - Lignite - 50,130 - 160,8,32 - Overworld, Nether",
	"9,8 - 7,8 - Coal - 50,80 - 80,6,32 - Overworld",
	"10,11 - 11,4 - Cassiterite - 40,120 - 50,5,24 - Overworld, Nether, The End",
	"12 - 0 - Oilsands - 50,80 - 80,6,32 - Overworld, Nether",
	"13,2,14,15 - 1,2,4,8 - Copper - 10,30 - 80,4,24 - Overworld, Nether",
	"16,15,17 - 3,4,8 - Tetrahedrite - 80,120 - 70,4,24 - Overworld, Nether",
	"18,19,20 - 3,4,8 - Bauxite - 50,90 - 80,4,24 - Overworld, Nether",
	"21,22,23 - 3,4,8 - Redstone - 10,40 - 60,3,24 - Overworld, Nether",
	"24,25,26,27 - 1,2,4,8 - Salts - 50,60 - 50,3,24 - Overworld",
	"28,29,30,31 - 1,2,4,8 - Sapphire - 10,40 - 60,3,16 - Overworld, Nether",
	"32,33,34 - 1,2,12 - Quartz - 40,80 - 60,3,16 - Overworld, Nether",
	"35,36,37,38 - 35,36,37,38 - Olivine - 10,40 - 60,3,16 - Overworld, Nether, The End",
	"39,40,41 - 3,4,8 - Apatite - 40,60 - 60,3,16 - Overworld, Nether",
	"42,43,44 - 3,4,8 - Galena - 30,60 - 40,5,16 - Overworld, Nether",
	"45,46,38,47 - 1,2,4,8 - Soapstone - 10,40 - 40,3,16 - Overworld, Nether",
	"48,49,50,47 - 1,2,4,8 - Nickel - 10,40 - 40,3,16 - Overworld, Nether, The End",
	"51,52,53 - 3,4,8 - Pitchblende - 10,40 - 40,3,16 - Overworld, Nether",
	"53,52 - 3,12 - Uranium - 20,30 - 20,3,16 - Overworld",
	"54,55,56,57 - 1,2,4,8 - Lapis - 20,50 - 40,5,16 - Overworld, Nether, The End",
	"58,59,9 - 3,4,8 - Diamond - 5,20 - 40,2,16 - Overworld, Nether",
	"60,61,62 - 3,4,8 - Monazite - 20,40 - 30,3,16 - Overworld, Nether",
	"63,64,65 - 3,4,8 - Beryllium - 5,30 - 30,3,16 - Overworld, Nether, The End",
	"66,67,68,69 - 66,67,68,69 - Manganese - 20,30 - 20,3,16 - Overworld, Nether, The End",
	"70,71,72 - 3,4,8 - Tungstate - 20,50 - 10,3,16 - Overworld, Nether, The End",
	"73,74,75,76 - 1,2,4,8 - Molybdenum - 20,50 - 5,3,16 - Overworld, Nether, The End",
	"77,78,79,80 - 1,2,4,8 - Platinum - 40,50 - 5,3,16 - Overworld, Nether, The End",
	"81,14,82 - 3,4,8 - Sulfur - 5,20 - 100,5,24 - Nether",
	"83 - 0 - Nether Quartz - 40,80 - 80,5,24 - Nether",
	"84,85 - 7,8 - Naquadah - 10,60 - 10,5,32 - The End"
] as IFormattedText[];

val SmallOres = [
//  "Ore Indexes - Spawn Types - Vein Name - Height Min, Max - Weight, Density, Size - Dimensions"
	"",

] as IFormattedText[];

val Wafers = [
// "ID - Name - Lenses - Needs Cleanroom - Min Tier - Source Wafers Type (0: Custom, 1-3: Si-Gl-Nq)"
	"36 - Integrated Logic Circuit - Jasper / Red Garnet / Ruby Lens - 0 - MV - 3",
	"38 - Random Accsess Memory Chip - Green Sapphire Lens - 0 - MV - 3",
	"40 - NAND Memory Chip - Enderpearl Lens - 1 - HV - 2",
	"42 - NOR Memory Chip - Endereye Lens - 1 - HV - 2",
	"44 - Central Processing Unit - Diamond / Glass Lens - 1 - MV - 3",
	"46 - System on a Chip - Yellow Garnet Lens - 1 - EV - 1",
	"48 - Advanced System on a Chip - Topaz Lens - 1 - EV - 1",
	"50 - Power Circuit - Opal / Blue Topaz / Sapphire Lens - 1 - HV - 2",
	"52 - High Power Circuit - Power Circuit Wafer - 0 - EV - 0",
	"54 - Nanocomponent Central Processing Unit - CPU Wafer - 0 - EV - 0",
	"56 - Quantum CPU - NanoCPU Wafer - 0 - EV - 0"
] as IFormattedText[];

val Fuels = [
// Fuel - kEU - Generator - Item
	"Lin Seed Oil - 2 - Semifluid Boiler - gregtech:gt.metaitem.01:30723",
	"Seed Oil - 2 - Semifluid Boiler - gregtech:gt.metaitem.01:30713",
	"Fish Oil - 2 - Semifluid Boiler - gregtech:gt.metaitem.01:30711",
	"Hemp Seed Oil - 2 - Semifluid Boiler - gregtech:gt.metaitem.01:30722",
	"Creosote - 8 - Semifluid Boiler - gregtech:gt.metaitem.01:30712",
	//"Creosote - 8 - Semifluid Boiler - railcraft:",
	"Biomass - 8 - Semifluid Boiler - gregtech:gt.metaitem.01:30704",
	"Oil - 16 - Semifluid Boiler - gregtech:gt.metaitem.01:30707",
	"Light Oil - 16 - Semifluid Boiler - gregtech:gt.metaitem.01:30732",
	"Raw Oil - 24 - Semifluid Boiler - gregtech:gt.metaitem.01:30731",
	"Sulfuric Heavy Fuel - 32 - Semifluid Boiler - gregtech:gt.metaitem.01:30738",
	"Heavy Oil - 32 - Semifluid Boiler - gregtech:gt.metaitem.01:30730",
	"Heavy Fuel - 192 - Semifluid Boiler - gregtech:gt.metaitem.01:30741",

	"Biofuel - 6 - Diesel Generator - gregtech:gt.metaitem.01:30705",
	"Sulfuric Light Fuel - 32 - Diesel Generator - gregtech:gt.metaitem.01:30737",
	"Methanol - 84 - Diesel Generator - gregtech:gt.metaitem.01:30673",
	"Diesel Fuel - 128 - Diesel Generator - gregtech:gt.metaitem.01:30708",
	"Biodiesel - 128 - Diesel Generator - ImmersiveEngineering:fluidContainers:7",
	"Ethanol - 148 - Diesel Generator - gregtech:gt.metaitem.01:30706",
	"Bio Diesel - 192 - Diesel Generator - gregtech:gt.metaitem.01:30627",
	"Light Fuel - 256 - Diesel Generator - gregtech:gt.metaitem.01:30740",
	"Cetane-Boosted Diesel - 512 - Diesel Generator - gregtech:gt.metaitem.01:30709",

	"Natural Gas - 15 - Gas Turbine - gregtech:gt.metaitem.01:30733",
	"Hydrogen - 20 - Gas Turbine - gregtech:gt.metaitem.01:30001",
	"Sulfuric Gas - 20 - Gas Turbine - gregtech:gt.metaitem.01:30734",
	"Carbon Monoxide - 24 - Gas Turbine - gregtech:gt.metaitem.01:30674",
	"Wood Gas - 24 - Gas Turbine - gregtech:gt.metaitem.01:30660",
	"Biogas - 32 - Gas Turbine - IC2:itemCellEmpty:7",
	"Sulfuric Naphtha - 32 - Gas Turbine - gregtech:gt.metaitem.01:30736",
	"Methane - 104 - Gas Turbine - gregtech:gt.metaitem.01:30715",
	"Refinery Gas - 128 - Gas Turbine - gregtech:gt.metaitem.01:30735",
	"Ethylene - 128 - Gas Turbine - gregtech:gt.metaitem.01:30677",
	"Ethane - 168 - Gas Turbine - gregtech:gt.metaitem.01:30642",
	"Propene - 192 - Gas Turbine - gregtech:gt.metaitem.01:30678",
	"Butadiene - 206 - Gas Turbine - gregtech:gt.metaitem.01:30646",
	"Propane - 232 - Gas Turbine - gregtech:gt.metaitem.01:30643",
	"Butene - 256 - Gas Turbine - gregtech:gt.metaitem.01:30645",
	"Naphtha - 256 - Gas Turbine - gregtech:gt.metaitem.01:30739",
	"LPG - 256 - Gas Turbine - gregtech:gt.metaitem.01:30742",
	"Phenol - 288 - Gas Turbine - gregtech:gt.metaitem.01:30687",
	"Benzene - 288 - Gas Turbine - gregtech:gt.metaitem.01:30686",
	"Butane - 296 - Gas Turbine - gregtech:gt.metaitem.01:30644",
	"Toluene - 328 - Gas Turbine - gregtech:gt.metaitem.01:30647",

	"Endereye Plate - 10 - Magic Fuel - gregtech:gt.metaitem.01:17533",
	"Bottle o' Enchanting - 10 - Magic Fuel - minecraft:experience_bottle",
	"Endereye Dust - 10 - Magic Fuel - gregtech:gt.metaitem.01:2533",
	"Eye of Ender - 20 - Magic Fuel - minecraft:ender_eye",
	"Mercury - 32 - Magic Fuel - gregtech:gt.metaitem.01:30087",
	"Ghast Tear - 50 - Magic Fuel - minecraft:ghast_tear",
	"Golden Apple - 6,400 - Magic Fuel - minecraft:golden_apple:1",
	"Nether Star Dust - 50,000 - Magic Fuel - gregtech:gt.metaitem.01:2506",
	"Nether Star Plate - 50,000 - Magic Fuel - gregtech:gt.metaitem.01:17506",
	"Beacon - 100,000 - Magic Fuel - minecraft:beacon",
	"Nether Star - 100,000 - Magic Fuel - minecraft:nether_star",

	"Enriched Naquadah Bolt - 25,000 - Small Naquadah Reactor - gregtech:gt.metaitem.01:26326",
	"Enriched Naquadah Cell - 1,400,000 - Fluid Naquadah Reactor - gregtech:gt.metaitem.01:30326",

	"Sulfuric Acid - 18 - Acid Battery - gregtech:gt.metaitem.01:30720"
] as IFormattedText[];


#=========================================================#
# FUNCTIONS

function ShowOreProducts(OreData as IFormattedText, OreSelectionMode as int) {

	val OrePrefix = ["ore", "oreNetherrack", "oreEndstone", "oreBlackgranite", "oreRedgranite", "oreBasalt", "oreMarble"] as IFormattedText[];
	val DataArr = Utils.split(OreData, " - ") as IFormattedText[];
	var Ore as IIngredient;
	var Dust as IItemStack;
	var Arr as IFormattedText[];
	var Byproducts = Utils.split(DataArr[4], " / ") as IFormattedText[];
	var Tip = "SOMETHING GOES WRONG" as IFormattedText;
	/*
	if (Utils.StringToInt(DataArr[3]) > 1) {
		for i, Byproduct in Byproducts {
			
		}
	}
	*/
	for i, Prefix in OrePrefix {
		if (OreSelectionMode == 0) {
			Arr = [Prefix, DataArr[1]];
			val OreEntry = Utils.getOreDictEntryFromString(Utils.concat(Arr)) as IOreDictEntry;
			Ore = OreEntry;

		} else {
			Arr = ["gregtech:gt.blockores:", Utils.IntToString(i * 1000 + Utils.StringToInt(DataArr[0]))];
			val OreBlock = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr))) as IItemStack;
			Ore = OreBlock;
		}

		Ore.addTooltip(format.darkGray("Product: ") + format.gray(DataArr[2]));

		if (Utils.StringToInt(DataArr[3]) == 1) {
			Ore.addTooltip(format.darkGray("Byproducts: ") + format.gray(Byproducts[0]));
		}

		/*
		if ((Utils.eqString([Utils.FormattedTextToString(DataArr[2]),
			Utils.FormattedTextToString(DataArr[3])]) == false) | (HideEqualByproducts == 0)) {
			Ore.addTooltip(format.darkGray("Byproducts: ") + format.gray(DataArr[3]));
		} */

		Ore.addTooltip("");
		Ore.addTooltip(format.darkGray("Press ") + format.yellow("Shift") + format.darkGray(" for Ore Spawning"));
		Ore.addShiftTooltip("");

	}

	/* DUSTS BYPRODUCTS:
	 * gregtech:gt.metaitem.01:3XXX - Impure Dust - problematic one
	 * gregtech:gt.metaitem.01:4XXX - Purified Dust
	 * gregtech:gt.metaitem.01:5XXX - Crushed Ore
	 * gregtech:gt.metaitem.01:6XXX - Purified Ore
	 * gregtech:gt.metaitem.01:7XXX - Centrifuged Ore
	 */
	Arr = ["gregtech:gt.metaitem.01:", Utils.IntToString(4000 + Utils.StringToInt(DataArr[0]))];
	Dust = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr)));
	Dust.addTooltip(format.darkGray("Byproducts: ") + format.gray(DataArr[4]));

	Arr = ["gregtech:gt.metaitem.01:", Utils.IntToString(5000 + Utils.StringToInt(DataArr[0]))];
	Dust = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr)));
	Dust.addTooltip(format.darkGray("Byproducts: ") + format.gray(DataArr[4]));

	Arr = ["gregtech:gt.metaitem.01:", Utils.IntToString(6000 + Utils.StringToInt(DataArr[0]))];
	Dust = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr)));
	Dust.addTooltip(format.darkGray("Byproducts: ") + format.gray(DataArr[4]));

	Arr = ["gregtech:gt.metaitem.01:", Utils.IntToString(7000 + Utils.StringToInt(DataArr[0]))];
	Dust = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr)));
	Dust.addTooltip(format.darkGray("Byproducts: ") + format.gray(DataArr[4]));
}


function ShowVeinInfo(Ores as IFormattedText[], Index as int, OreType as IFormattedText, Name as IFormattedText,
	H as IFormattedText, S as IFormattedText, W as IFormattedText, D as IFormattedText,
	Dimensions as IFormattedText, OreSelectionMode as int) {

	val OrePrefix = ["ore", "oreNetherrack", "oreEndstone", "oreBlackgranite", "oreRedgranite", "oreBasalt", "oreMarble"] as IFormattedText[];
	var OreDataArr as IFormattedText[];
	var Arr as IFormattedText[];
	var Ore as IIngredient;

	for i, Prefix in OrePrefix {
		OreDataArr = Utils.split(Ores[Index], " - ");

		if (OreSelectionMode == 0) {
			Arr = [Prefix, OreDataArr[1]];
			val OreEntry = Utils.getOreDictEntryFromString(Utils.concat(Arr)) as IOreDictEntry;
			Ore = OreEntry;

		} else {
			Arr = ["gregtech:gt.blockores:", Utils.IntToString(i * 1000 + Utils.StringToInt(OreDataArr[0]))];
			val OreBlock = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr))) as IItemStack;
			Ore = OreBlock;
		}

		Ore.addShiftTooltip("< " + format.white(Name + " Vein") + format.gray(" - ")
			+ format.white(OreType + " Ore") + format.gray(" >"));
		Ore.addShiftTooltip(format.darkGray("- Height: ") + H + format.darkGray("Size: ") + S);
		Ore.addShiftTooltip(format.darkGray("- Weight: ") + W + format.darkGray("Density: ") + D);
		Ore.addShiftTooltip(format.darkGray("- Spawns in ") + format.gray(Dimensions));
		Ore.addShiftTooltip("");
	}
}


function AddVein(Ores as IFormattedText[], VeinData as IFormattedText, OreSelectionMode as int) {

	val VeinDataArr = Utils.split(VeinData, " - ") as IFormattedText[];
	val IndexArr = Utils.split(VeinDataArr[0], ",") as IFormattedText[];
	val MaskArr = Utils.split(VeinDataArr[1], ",") as IFormattedText[];
	val Name = VeinDataArr[2];
	val HeightArr = Utils.split(VeinDataArr[3], ",") as IFormattedText[];
	val WDSArr = Utils.split(VeinDataArr[4], ",") as IFormattedText[];

	val Weight = Utils.StringToInt(WDSArr[0]) as int;
	val Size = Utils.StringToInt(WDSArr[2]) as int;
	val H = format.gold(HeightArr[0] + " - " + HeightArr[1] + ", ") as IFormattedText;
	var S = format.gold(Utils.IntToString(Size)) as IFormattedText;
	var W = format.red(Utils.IntToString(Weight) + ", ") as IFormattedText;
	val D = format.gold(WDSArr[1]) as IFormattedText;

	// Size: 16, 24, 32.
	if (Size > 16) {
		if (Size > 24) {
			S = format.green(Utils.IntToString(Size));
		} else {
			S = format.yellow(Utils.IntToString(Size));
		}
	}

	// Weight color groups: 5-10-20, 30-40-50, 60-70-80, 100-120-160.
	if (Weight > 20) {
		if (Weight > 50) {
			if (Weight > 80) {
				W = format.green(Utils.IntToString(Weight) + ", ");
			} else {
				W = format.yellow(Utils.IntToString(Weight) + ", ");
			}
		} else {
			W = format.gold(Utils.IntToString(Weight) + ", ");
		}
	}

	// Tooltips
	for i, Index in IndexArr {
		var OreType = "" as IFormattedText;
		var OreTypeMask = Utils.StringToInt(MaskArr[i]) as int;
		var ore_types_count = 0 as int;

		val ORE_SINGLE 	= 0 as int;
		val ORE_PRIMARY = 1 as int;
		val ORE_SECONDARY = 2 as int;
		val ORE_INBETWEEN = 4 as int;
		val ORE_SPORADIC = 8 as int;

		if (OreTypeMask == ORE_SINGLE) {
			OreType = Utils.StringToFormattedText("Single");
		} else {
			if ((OreTypeMask & ORE_PRIMARY) == ORE_PRIMARY) {
				OreType = Utils.StringToFormattedText("Primary");
				ore_types_count = 1;
			}
			if ((OreTypeMask & ORE_SECONDARY) == ORE_SECONDARY) {
				if (ore_types_count > 0) OreType = OreType + Utils.StringToFormattedText(", ");
				OreType = OreType + Utils.StringToFormattedText("Secondary");
				ore_types_count = ore_types_count + 1;
			}
			if ((OreTypeMask & ORE_INBETWEEN) == ORE_INBETWEEN) {
				if (ore_types_count > 0) OreType = OreType + Utils.StringToFormattedText(", ");
				OreType = OreType + Utils.StringToFormattedText("Inbetween");
				ore_types_count = ore_types_count + 1;
			} 
			if ((OreTypeMask & ORE_SPORADIC) == ORE_SPORADIC) {
				if (ore_types_count > 0) OreType = OreType + Utils.StringToFormattedText(", ");
				OreType = OreType + Utils.StringToFormattedText("Sporadic");
				ore_types_count = ore_types_count + 1;
			}
		}

		ShowVeinInfo(Ores, Utils.StringToInt(Index), OreType, Name, H, S, W, D, VeinDataArr[5], OreSelectionMode);
	}
}

/*
function AddSmallOre(SmallOre as IFormattedText) {


}
*/


function ShowWaferInfo(Info as IFormattedText) {

	val DataArr = Utils.split(Info, " - ") as IFormattedText[];
	var Arr as IFormattedText[];
	var Tip as IFormattedText;
	val SHOW_MIN_MACHINE_TIER = 1 as int;
	val SHOW_LENSES_ON_CHIP = 0 as int;

	// Getting items
	Arr = ["gregtech:gt.metaitem.03:", Utils.IntToString(32000 + Utils.StringToInt(DataArr[0]))];
	val Wafer = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr))) as IItemStack;
	Arr = ["gregtech:gt.metaitem.03:", Utils.IntToString(32001 + Utils.StringToInt(DataArr[0]))];
	val Chip = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr))) as IItemStack;

	// Needs Cleanroom?
	if (Utils.StringToInt(DataArr[3]) == 1) Wafer.addTooltip(format.white("Needs Cleanroom"));

	// Lenses & Materials
	if (Utils.StringToInt(DataArr[5]) > 0) { // Require Laser Engraver
		Tip = format.blue("Requires " + DataArr[2]) as IFormattedText;
		if (SHOW_MIN_MACHINE_TIER == 1) Tip = Tip + format.blue(" (" + DataArr[4] + ")");
	} else {
		// Tip = format.blue("Upgrade of " + DataArr[2]);
		Tip = format.blue("Upgrade of " + DataArr[2] + " (" + DataArr[4] + ")");
	}

	Wafer.addTooltip(Tip);
	if (SHOW_LENSES_ON_CHIP == 1) Chip.addTooltip(Tip);

	// UNUSED: Si/Gl/Nq source wafers information
}


function ShowFuelInfo(Fuel as IFormattedText, ShowFuelGeneratorsInfo as int) {

    val DataArr = Utils.split(Fuel, " - ") as IFormattedText[];

    var Item = Utils.getItemStackFromString(Utils.FormattedTextToString(DataArr[3])) as IItemStack;
    if (ShowFuelGeneratorsInfo == 1) {
        Item.addTooltip(format.gray(DataArr[2] + ": " + DataArr[1] + ",000 EU"));
    } else {
        Item.addTooltip(format.gray("Fuel Value: " + DataArr[1] + ",000 EU"));
    }
}


function AddMissingChemicalTooltips() {

	<minecraft:coal:*>.addTooltip("C");
	<minecraft:diamond>.addTooltip("C");
	<minecraft:iron_ingot>.addTooltip("Fe");
	<minecraft:gold_ingot>.addTooltip("Au");
	<minecraft:flint>.addTooltip("SiO2");
	<minecraft:redstone>.addTooltip("Si(FeS2)5CrAl2O3Hg3");
	<minecraft:snowball>.addTooltip("H2O");
	<minecraft:clay_ball>.addTooltip("Na2LiAl2Si2(H2O)6");
	//<minecraft:glowstone_dust>.addTooltip("AuSi(FeS2)5CrAl2O3Hg3");
	<minecraft:dye:4>.addTooltip("(Al6Si6Ca8Na8)12(Al3Si3Na4Cl)2FeS2CaCO3");
	<minecraft:ender_pearl>.addTooltip("BeK4N5Ma6");
	<minecraft:blaze_rod>.addTooltip("?SMa");
	<minecraft:gold_nugget>.addTooltip("Au");
	<minecraft:blaze_powder>.addTooltip("?SMa");
	<minecraft:ender_eye>.addTooltip("BeK4N5Ma6?SMa");
	<minecraft:emerald>.addTooltip("Be3Al2Si6O18");
	//<minecraft:nether_star>.addTooltip("?Ma");
	//<minecraft:quartz>.addTooltip("SiO2");
}


#=========================================================#
# GENERAL

Utils.executeCommand("/say \u00A76Reloading \u00A76GregTech \u00A76tooltips.");

for Ore in Ores {ShowOreProducts(Ore, AddTooltipsByOreDictionary);}
for Vein in Veins {AddVein(Ores, Vein, AddTooltipsByOreDictionary);}
//for SmallOre in SmallOres {AddSmallOre(SmallOre);}
for Fuel in Fuels {ShowFuelInfo(Fuel, ShowFuelGeneratorsInfo);}
for Wafer in Wafers {ShowWaferInfo(Wafer);}
AddMissingChemicalTooltips();


// Fools Ruby tips
val FoolsRubyTip = "Wait, is that a Ruby?" as IFormattedText;
<ore:dustFoolsRuby>.addTooltip(FoolsRubyTip);
<ore:dustTinyFoolsRuby>.addTooltip(FoolsRubyTip);
<ore:dustSmallFoolsRuby>.addTooltip(FoolsRubyTip);
<ore:gemFoolsRuby>.addTooltip(FoolsRubyTip);
<ore:gemChippedFoolsRuby>.addTooltip(FoolsRubyTip);
<ore:gemFlawedFoolsRuby>.addTooltip(FoolsRubyTip);
<ore:gemFlawlessFoolsRuby>.addTooltip(FoolsRubyTip);
<ore:gemExquisiteFoolsRuby>.addTooltip(FoolsRubyTip);
<ore:lensFoolsRuby>.addTooltip(FoolsRubyTip);
<ore:blockFoolsRuby>.addTooltip(FoolsRubyTip);


// Maintenance hatch tools
val MaintenanceHatch = <gregtech:gt.blockmachines:90>;
MaintenanceHatch.addTooltip(format.darkGray("Press ") + format.yellow("Shift") + format.darkGray(" for problems fix"));
MaintenanceHatch.addShiftTooltip("");
MaintenanceHatch.addShiftTooltip(format.darkGray(" - ") + format.gray("Pipe is loose.") + format.darkGray(" - ")
	+ format.yellow("Wrench"));
MaintenanceHatch.addShiftTooltip(format.darkGray(" - ") + format.gray("Screws are missing.") + format.darkGray(" - ")
	+ format.yellow("Screwdriver"));
MaintenanceHatch.addShiftTooltip(format.darkGray(" - ") + format.gray("Something is stuck.") + format.darkGray(" - ")
	+ format.yellow("Soft Mallet"));
MaintenanceHatch.addShiftTooltip(format.darkGray(" - ") + format.gray("Platings are dented.") + format.darkGray(" - ")
	+ format.yellow("Hammer"));
MaintenanceHatch.addShiftTooltip(format.darkGray(" - ") + format.gray("Circuitry burned out.") + format.darkGray(" - ")
	+ format.yellow("Soldering Iron"));
MaintenanceHatch.addShiftTooltip(format.darkGray(" - ") + format.gray("That doesn't belong there.") + format.darkGray(" - ")
	+ format.yellow("Crowbar"));
MaintenanceHatch.addShiftTooltip("");
MaintenanceHatch.addShiftTooltip(format.darkGray("Just use BrainTech Aerospace Duct Tape FAL-84."));


Utils.executeCommand("/say \u00A76Done!");

// by EverybodyLies, July 2016 - July 2017