#============================#
# GregTech 5 Ore Dictionary  #
#============================#

import minetweaker.item.IItemStack;
import minetweaker.item.IIngredient;
import minetweaker.oredict.IOreDictEntry;
import minetweaker.formatting.IFormattedText;
import mods.MTUtils.Utils;
import mods.gregtech.Wiremill;

#=========================================================#
# ORE DICTIONARY

// Hulls
    <ore:hullLV>.add(<gregtech:gt.blockmachines:11>);
    <ore:hullMV>.add(<gregtech:gt.blockmachines:12>);
    <ore:hullHV>.add(<gregtech:gt.blockmachines:13>);
    <ore:hullEV>.add(<gregtech:gt.blockmachines:14>);
    <ore:hullIV>.add(<gregtech:gt.blockmachines:15>);
    <ore:hullLuV>.add(<gregtech:gt.blockmachines:16>);
    <ore:hullZPM>.add(<gregtech:gt.blockmachines:17>);
    <ore:hullUV>.add(<gregtech:gt.blockmachines:18>);

// Motors
    <ore:motorLV>.add(<gregtech:gt.metaitem.01:32600>);
    <ore:motorMV>.add(<gregtech:gt.metaitem.01:32601>);
    <ore:motorHV>.add(<gregtech:gt.metaitem.01:32602>);
    <ore:motorEV>.add(<gregtech:gt.metaitem.01:32603>);
    <ore:motorIV>.add(<gregtech:gt.metaitem.01:32604>);
    <ore:motorLuV>.add(<gregtech:gt.metaitem.01:32606>);
    <ore:motorZPM>.add(<gregtech:gt.metaitem.01:32607>);
    <ore:motorUV>.add(<gregtech:gt.metaitem.01:32608>);

// Pistons
    <ore:pistonLV>.add(<gregtech:gt.metaitem.01:32640>);
    <ore:pistonMV>.add(<gregtech:gt.metaitem.01:32641>);
    <ore:pistonHV>.add(<gregtech:gt.metaitem.01:32642>);
    <ore:pistonEV>.add(<gregtech:gt.metaitem.01:32643>);
    <ore:pistonIV>.add(<gregtech:gt.metaitem.01:32644>);
    <ore:pistonLuV>.add(<gregtech:gt.metaitem.01:32645>);
    <ore:pistonZPM>.add(<gregtech:gt.metaitem.01:32646>);
    <ore:pistonUV>.add(<gregtech:gt.metaitem.01:32647>);

// Pumps
    <ore:pumpLV>.add(<gregtech:gt.metaitem.01:32610>);
    <ore:pumpMV>.add(<gregtech:gt.metaitem.01:32611>);
    <ore:pumpHV>.add(<gregtech:gt.metaitem.01:32612>);
    <ore:pumpEV>.add(<gregtech:gt.metaitem.01:32613>);
    <ore:pumpIV>.add(<gregtech:gt.metaitem.01:32614>);
    <ore:pumpLuV>.add(<gregtech:gt.metaitem.01:32620>);
    <ore:pumpZPM>.add(<gregtech:gt.metaitem.01:32621>);
    <ore:pumpUV>.add(<gregtech:gt.metaitem.01:32622>);

// Fluid Regulators
    <ore:regulatorLV>.add(<gregtech:gt.metaitem.01:32615>);
    <ore:regulatorMV>.add(<gregtech:gt.metaitem.01:32616>);
    <ore:regulatorHV>.add(<gregtech:gt.metaitem.01:32617>);
    <ore:regulatorEV>.add(<gregtech:gt.metaitem.01:32618>);
    <ore:regulatorIV>.add(<gregtech:gt.metaitem.01:32619>);

// Conveyors
    <ore:conveyorLV>.add(<gregtech:gt.metaitem.01:32630>);
    <ore:conveyorMV>.add(<gregtech:gt.metaitem.01:32631>);
    <ore:conveyorHV>.add(<gregtech:gt.metaitem.01:32632>);
    <ore:conveyorEV>.add(<gregtech:gt.metaitem.01:32633>);
    <ore:conveyorIV>.add(<gregtech:gt.metaitem.01:32634>);
    <ore:conveyorLuV>.add(<gregtech:gt.metaitem.01:32636>);
    <ore:conveyorZPM>.add(<gregtech:gt.metaitem.01:32637>);
    <ore:conveyorUV>.add(<gregtech:gt.metaitem.01:32638>);

// Robotic Arms
    <ore:armLV>.add(<gregtech:gt.metaitem.01:32650>);
    <ore:armMV>.add(<gregtech:gt.metaitem.01:32651>);
    <ore:armHV>.add(<gregtech:gt.metaitem.01:32652>);
    <ore:armEV>.add(<gregtech:gt.metaitem.01:32653>);
    <ore:armIV>.add(<gregtech:gt.metaitem.01:32654>);
    <ore:armLuV>.add(<gregtech:gt.metaitem.01:32655>);
    <ore:armZPM>.add(<gregtech:gt.metaitem.01:32656>);
    <ore:armUV>.add(<gregtech:gt.metaitem.01:32657>);

// Emitters
    <ore:emitterLV>.add(<gregtech:gt.metaitem.01:32680>);
    <ore:emitterMV>.add(<gregtech:gt.metaitem.01:32681>);
    <ore:emitterHV>.add(<gregtech:gt.metaitem.01:32682>);
    <ore:emitterEV>.add(<gregtech:gt.metaitem.01:32683>);
    <ore:emitterIV>.add(<gregtech:gt.metaitem.01:32684>);
    <ore:emitterLuV>.add(<gregtech:gt.metaitem.01:32685>);
    <ore:emitterZPM>.add(<gregtech:gt.metaitem.01:32686>);
    <ore:emitterUV>.add(<gregtech:gt.metaitem.01:32687>);

// Sensors
    <ore:sensorLV>.add(<gregtech:gt.metaitem.01:32690>);
    <ore:sensorMV>.add(<gregtech:gt.metaitem.01:32691>);
    <ore:sensorHV>.add(<gregtech:gt.metaitem.01:32692>);
    <ore:sensorEV>.add(<gregtech:gt.metaitem.01:32693>);
    <ore:sensorIV>.add(<gregtech:gt.metaitem.01:32694>);
    <ore:sensorLuV>.add(<gregtech:gt.metaitem.01:32695>);
    <ore:sensorZPM>.add(<gregtech:gt.metaitem.01:32696>);
    <ore:sensorUV>.add(<gregtech:gt.metaitem.01:32697>);
    
// Field Generators
    <ore:fieldLV>.add(<gregtech:gt.metaitem.01:32670>);
    <ore:fieldMV>.add(<gregtech:gt.metaitem.01:32671>);
    <ore:fieldHV>.add(<gregtech:gt.metaitem.01:32672>);
    <ore:fieldEV>.add(<gregtech:gt.metaitem.01:32673>);
    <ore:fieldIV>.add(<gregtech:gt.metaitem.01:32674>);
    <ore:fieldLuV>.add(<gregtech:gt.metaitem.01:32675>);
    <ore:fieldZPM>.add(<gregtech:gt.metaitem.01:32676>);
    <ore:fieldUV>.add(<gregtech:gt.metaitem.01:32677>);


// Chips
    <ore:chipLC>.add(<gregtech:gt.metaitem.03:32037>);
    <ore:chipRAM>.add(<gregtech:gt.metaitem.03:32039>);
    <ore:chipNAND>.add(<gregtech:gt.metaitem.03:32041>);
    <ore:chipNOR>.add(<gregtech:gt.metaitem.03:32043>);
    <ore:chipCPU>.add(<gregtech:gt.metaitem.03:32045>);
    <ore:chipSOC>.add(<gregtech:gt.metaitem.03:32047>);
    <ore:chipASOC>.add(<gregtech:gt.metaitem.03:32049>);
    <ore:chipPIC>.add(<gregtech:gt.metaitem.03:32051>);
    <ore:chipHPIC>.add(<gregtech:gt.metaitem.03:32053>);
    <ore:chipNCPU>.add(<gregtech:gt.metaitem.03:32055>);
    <ore:chipQBIT>.add(<gregtech:gt.metaitem.03:32057>);


#=========================================================#
# MATERIALS

/*
 * <ore:foilVanadiumSteel>, <ore:foilStainlessSteel>
 * <ore:ingotBarium>, <ore:plateBarium>
 * <ore:ingotGraphene>, <ore:plateGraphene>, <ore:foilGraphene>, <ore:stickGraphene>, <ore:wireFineGraphene>
 * <ore:gearGtSmallIronMagnetic>, <ore:gearGtSmallSteelMagnetic>, <ore:gearGtSmallNeodymiumMagnetic>
 * <ore:ringIronMagnetic>, <ore:ringSteelMagnetic>, <ore:ringNeodymiumMagnetic>, <ore:gearGtSmallIronMagnetic>
 *
 * Fine Wire fix:
 *
 * <ore:plateLumium>, <ore:foilLumium>, <ore:stickLumium>, <ore:wireFineLumium>
 * <ore:platePalladium>, <ore:foilPalladium>, <ore:stickPalladium>, <ore:wireFinePalladium>
 * <ore:plateVanadium>, <ore:foilVanadium>, <ore:stickVanadium>
 * <ore:plateNiobium>, <ore:foilNiobium>, <ore:stickNiobium>
 * <ore:plateGallium>, <ore:foilGallium>, <ore:stickGallium>
 * <ore:plateEuropium>, <ore:foilEuropium>, <ore:stickEuropium>
 * <ore:plateAmericium>, <ore:foilAmericium>, <ore:stickAmericium>
 * <ore:plateNeutronium>, <ore:foilNeutronium>, <ore:stickNeutronium>
 * <ore:plateNaquadria>, <ore:foilNaquadria>, <ore:stickNaquadria>
 * <ore:plateLumium>, <ore:foilLumium>, <ore:stickLumium>
 */

val Materials = ["Vanadium", "Niobium", "Gallium", "Europium", "Americium", "Neutronium",
    "Naquadria", "Lumium", "Palladium", "Graphene"] as IFormattedText[];

for Material in Materials {

    var Arr = ["wireFine", Material] as IFormattedText[];
    val WireDict = Utils.getOreDictEntryFromString(Utils.FormattedTextToString(Utils.concat(Arr))) as IOreDictEntry;

    Arr = ["foil", Material];
    val Foil = Utils.getOreDictEntryFromString(Utils.FormattedTextToString(Utils.concat(Arr))) as IIngredient;

    Arr = ["stick", Material];
    val Rod = Utils.getOreDictEntryFromString(Utils.FormattedTextToString(Utils.concat(Arr))) as IIngredient;

    for Wire in WireDict.items {
        Wiremill.addRecipe(Wire * 2, Foil, 200, 8);
        Wiremill.addRecipe(Wire * 4, Rod, 200, 8);
    }
}

// by EverybodyLies, June 2017