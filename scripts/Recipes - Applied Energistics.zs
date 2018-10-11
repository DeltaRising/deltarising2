#===============================#
# Applied Energistics 2 Recipes #
#===============================#

import minetweaker.item.IItemStack;
import minetweaker.item.IIngredient;
import minetweaker.liquid.ILiquidStack;
import minetweaker.formatting.IFormattedText;
import mods.MTUtils.Utils;

import mods.buildcraft.AssemblyTable;
import mods.gregtech.Autoclave;
import mods.gregtech.Assembler;
import mods.gregtech.CircuitAssembler;


#====================================================#
# FUNCTIONS

function AddRecipe_Components() {

	// Nether and certus quartz changed on purpose

	val FormationCore = <appliedenergistics2:item.ItemMultiMaterial:43>;
	recipes.remove(FormationCore);
	recipes.addShaped(FormationCore * 2, [
		[null, <ore:pureNetherQuartz>, null],
		[<ore:foilVanadiumSteel>, <ore:dustFluix>, <ore:foilVanadiumSteel>],
		[null, <ore:processorLogic>, null]
	]);

	val AnnihilationCore = <appliedenergistics2:item.ItemMultiMaterial:44>;
	recipes.remove(AnnihilationCore);
	recipes.addShaped(AnnihilationCore * 2, [
		[null, <ore:pureCertusQuartz>, null],
		[<ore:foilVanadiumSteel>, <ore:dustFluix>, <ore:foilVanadiumSteel>],
		[null, <ore:processorLogic>, null]
	]);
}


function AddRecipe_Cables() {

	var Arr as IFormattedText[];
	var CableGlass as IItemStack;
	var CableCovered as IItemStack;
	var CableSmart as IItemStack;
	var CableDense as IItemStack;

	val QuartzFiber = <appliedenergistics2:item.ItemMultiPart:140>;
	val ColorApplicator = <appliedenergistics2:item.ToolColorApplicator>;

	val ITEM = "appliedenergistics2:item.ItemMultiPart:" as IFormattedText;
	val IntegratedCircuit = <gregtech:gt.integrated_circuit:24> as IItemStack;
	val FLUIX_Glass = <appliedenergistics2:item.ItemMultiPart:16> as IItemStack;
	val FLUIX_Covered = <appliedenergistics2:item.ItemMultiPart:36> as IItemStack;
	val FLUIX_Smart = <appliedenergistics2:item.ItemMultiPart:56> as IItemStack;
	val FLUIX_Dense = <appliedenergistics2:item.ItemMultiPart:76> as IItemStack;
	val META_Glass = 0 as int;
	val META_Covered = 20 as int;
	val META_Smart = 40 as int;
	val META_Dense = 60 as int;
	val ChemicalDyes = [
		<liquid:dye.chemical.dyewhite> * 9,
		<liquid:dye.chemical.dyeorange> * 9,
		<liquid:dye.chemical.dyemagenta> * 9,
		<liquid:dye.chemical.dyelightblue> * 9,
		<liquid:dye.chemical.dyeyellow> * 9,
		<liquid:dye.chemical.dyelime> * 9,
		<liquid:dye.chemical.dyepink> * 9,
		<liquid:dye.chemical.dyegray> * 9,
		<liquid:dye.chemical.dyelightgray> * 9,
		<liquid:dye.chemical.dyecyan> * 9,
		<liquid:dye.chemical.dyepurple> * 9,
		<liquid:dye.chemical.dyeblue> * 9,
		<liquid:dye.chemical.dyebrown> * 9,
		<liquid:dye.chemical.dyegreen> * 9,
		<liquid:dye.chemical.dyered> * 9,
		<liquid:dye.chemical.dyeblack> * 9,
		<liquid:molten.plastic> * 9 // fluix
	] as ILiquidStack[];

	for i, Dye in ChemicalDyes {

		Arr = [ITEM, Utils.IntToString(META_Glass + i)];
        	CableGlass = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr)));
			<ore:cableAEGlassColored>.add(CableGlass);
        	recipes.remove(CableGlass);

    	Arr = [ITEM, Utils.IntToString(META_Covered + i)];
        	CableCovered = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr)));
			<ore:cableAECoveredColored>.add(CableCovered);
			recipes.remove(CableCovered);

    	Arr = [ITEM, Utils.IntToString(META_Smart + i)];
        	CableSmart = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr)));
			<ore:cableAESmartColored>.add(CableSmart);
			recipes.remove(CableSmart);

    	Arr = [ITEM, Utils.IntToString(META_Dense + i)];
        	CableDense = Utils.getItemStackFromString(Utils.FormattedTextToString(Utils.concat(Arr)));
			<ore:cableAEDenseColored>.add(CableDense);
			recipes.remove(CableDense);

		// Assembler.addRecipe(CableGlass, [FLUIX_Glass], Dye, 40, 48);
		// Assembler.addRecipe(CableCovered, [CableGlass, <ore:foilPolytetrafluoroethylene>], Dye, 40, 48);
		// Assembler.addRecipe(CableSmart, [CableCovered, <ore:wireFineLumium> * 4], <liquid:molten.plastic> * 36, 40, 48);
		recipes.addShapeless(CableSmart * 4, [CableDense]);
		recipes.addShaped(CableDense, [[CableSmart, CableSmart], [CableSmart, CableSmart]]);
	}

	// Maybe, put it in Laser Precision Chamber...
	recipes.remove(QuartzFiber);
	Autoclave.addRecipe(QuartzFiber * 1, <ore:pureNetherQuartz>, <liquid:molten.palladium> * 16, 9500, 600, 120);
	Autoclave.addRecipe(QuartzFiber * 2, <ore:pureCertusQuartz>, <liquid:molten.palladium> * 16, 9500, 600, 120);

	recipes.removeShaped(FLUIX_Glass * 4);
	Autoclave.addRecipe(FLUIX_Glass * 2, <ore:crystalPureFluix>, <liquid:molten.palladium> * 16, 9500, 600, 240);

	Assembler.addRecipe(FLUIX_Covered, 
		[FLUIX_Glass, <ore:foilGraphene>, IntegratedCircuit * 0], 
	<liquid:molten.plastic> * 72, 120, 48);
	Assembler.addRecipe(FLUIX_Smart, 
		[FLUIX_Covered, <ore:wireFineLumium> * 4, IntegratedCircuit * 0], 
	<liquid:molten.polytetrafluoroethylene> * 36, 120, 48);

	// Colored cables to fluix
	recipes.addShapeless(FLUIX_Glass, [<ore:cableAEGlassColored>, ColorApplicator]);
	recipes.addShapeless(FLUIX_Covered, [<ore:cableAECoveredColored>, ColorApplicator]);
	recipes.addShapeless(FLUIX_Smart, [<ore:cableAESmartColored>, ColorApplicator]);
	recipes.addShapeless(FLUIX_Dense, [<ore:cableAEDenseColored>, ColorApplicator]);
}


function AddRecipe_StorageCells() {

	val EngineeringProcessor = <appliedenergistics2:item.ItemMultiMaterial:24>;

	val StorageHousing = <appliedenergistics2:item.ItemMultiMaterial:39>;
	val StorageHousingAdv = <extracells:storage.casing>;
	val FluidStorageHousing = <extracells:storage.casing:1>;

	recipes.remove(StorageHousing);
	Assembler.addRecipe(StorageHousing, <ore:platePlastic> * 4, <ore:dustRedstone> * 4, <liquid:molten.polytetrafluoroethylene> * 288, 400, 48);
	recipes.remove(StorageHousingAdv);
	recipes.remove(FluidStorageHousing);

	val StorageCell = [
		<appliedenergistics2:item.ItemBasicStorageCell.1k>,  // 1k
		<appliedenergistics2:item.ItemBasicStorageCell.4k>,  // 4k
		<appliedenergistics2:item.ItemBasicStorageCell.16k>, // 16k
		<appliedenergistics2:item.ItemBasicStorageCell.64k>, // 64k
		<extracells:storage.physical:0>, // 256k
		<extracells:storage.physical:1>, // 1024k
		<extracells:storage.physical:2>, // 4096k
		<extracells:storage.physical:3>  // 16384k
	] as IItemStack[];

	val StorageComponent = [
		<appliedenergistics2:item.ItemMultiMaterial:35>, // 1k
		<appliedenergistics2:item.ItemMultiMaterial:36>, // 4k
		<appliedenergistics2:item.ItemMultiMaterial:37>, // 16k
		<appliedenergistics2:item.ItemMultiMaterial:38>, // 64k
		<extracells:storage.component:0>, // 256k
		<extracells:storage.component:1>, // 1024k
		<extracells:storage.component:2>, // 4096k
		<extracells:storage.component:3>  // 16384k
	] as IItemStack[];

	val StorageCell_Fluid = [
		<extracells:storage.component:4>, // 1k
		<extracells:storage.component:5>, // 4k
		<extracells:storage.component:6>, // 16k
		<extracells:storage.component:7>, // 64k
		<extracells:storage.component:8>, // 256k
		<extracells:storage.component:9>, // 1024k
		<extracells:storage.component:10>  // 4096k
	] as IItemStack[];

	val StorageCell_Processor = [
		// <appliedenergistics2:item.ItemMultiMaterial:20>, // Silicon
		<appliedenergistics2:item.ItemMultiMaterial:23>, // Calculation
		<appliedenergistics2:item.ItemMultiMaterial:22>, // Logic
		<appliedenergistics2:item.ItemMultiMaterial:24>, // Engineering
		<appliedenergistics2:item.ItemMultiMaterial:24>, // Engineering
		<appliedenergistics2:item.ItemMultiMaterial:24>, // Engineering
		<appliedenergistics2:item.ItemMultiMaterial:24>, // Engineering
		<appliedenergistics2:item.ItemMultiMaterial:24>, // Engineering
		<appliedenergistics2:item.ItemMultiMaterial:24>  // Engineering
	] as IIngredient[];

	val StorageCell_Storage = [
		<appliedenergistics2:item.ItemMultiMaterial:1>,  // Charged Quartz
		<appliedenergistics2:item.ItemMultiMaterial:35>, // 1k
		<appliedenergistics2:item.ItemMultiMaterial:36>, // 4k
		<appliedenergistics2:item.ItemMultiMaterial:37>, // 16k
		<appliedenergistics2:item.ItemMultiMaterial:38>, // 64k
		<extracells:storage.component:0>, // 256k
		<extracells:storage.component:1>, // 1024k
		<extracells:storage.component:2>, // 4096k
	] as IIngredient[];

	val StorageCell_Chip = [
		<gregtech:gt.metaitem.03:32039> * 16, // RAM
		<gregtech:gt.metaitem.03:32037> * 3,  // LC
		<gregtech:gt.metaitem.03:32045> * 3,  // CPU
		<gregtech:gt.metaitem.03:32055> * 3,  // nCPU
		<gregtech:gt.metaitem.03:32057> * 3,  // QBit
		<gregtech:gt.metaitem.03:32057> * 3,  // QBit
		<gregtech:gt.metaitem.03:32057> * 3,  // QBit
		<gregtech:gt.metaitem.03:32057> * 3   // QBit
	] as IIngredient[];

	val StorageCell_SMD = [
	/*
		<gregtech:gt.metaitem.03:32018>, // Transistor
		<gregtech:gt.metaitem.03:32011>, // Resistor
		<gregtech:gt.metaitem.03:32016>, // Diode
		<gregtech:gt.metaitem.03:32020>, // Capacitor
	*/
		<ore:circuitBasic>,
		<ore:circuitGood>,
		<ore:circuitAdvanced>,
		<ore:circuitData>,
		<ore:circuitElite>,
		<ore:circuitMaster>,
		<ore:circuitUltimate>,
		<ore:circuitSuperconductor>
	] as IIngredient[];

	val StorageCell_Field = [
		<ore:fieldLV>,
		<ore:fieldMV>,
		<ore:fieldHV>,
		<ore:fieldEV>,
		<ore:fieldIV>,
		<ore:fieldLuV>,
		<ore:fieldZPM>,
		<ore:fieldUV>
	] as IIngredient[];

	val StorageCell_Wire = [
		// <ore:wireFineGallium>,
		<ore:wireFineAnnealedCopper>,
		<ore:wireFineElectrum>,
		<ore:wireFinePlatinum>,
		<ore:wireFineNiobium>,
		<ore:wireFineNaquadria>,
		<ore:wireFineEuropium>,
		<ore:wireFineAmericium>,
		<ore:wireFineNeutronium>
	] as IIngredient[];

	val StorageCell_Liquid = [
		<liquid:molten.electrum>,
		<liquid:molten.chrome>,
		<liquid:molten.niobium>,
		<liquid:molten.naquadria>,
		<liquid:molten.europium>,
		<liquid:molten.americium>,
		<liquid:molten.neutronium>
	] as ILiquidStack[];

	val StorageCell_CraftingVoltage = [24, 96, 384, 1536, 6144, 24576, 98304, 393216] as int[];

	for i, Component in StorageComponent {
		recipes.remove(Component);
		recipes.remove(StorageCell[i]);

		CircuitAssembler.addRecipe(Component, [
			StorageCell_Processor[i],
			StorageCell_Storage[i] * 3,
			StorageCell_Chip[i],
			StorageCell_SMD[i] * 4,
			StorageCell_Wire[i] * 8,
		], <liquid:molten.solderingalloy> * 144, 400, StorageCell_CraftingVoltage[i]);

		if (i < 4) {
			recipes.addShapeless(StorageCell[i], [StorageHousing, Component]);
		} else {
			recipes.addShapeless(StorageCell[i], [StorageHousingAdv, Component]);
		}
	}

	for i, FluidCell in StorageCell_Fluid {
		recipes.remove(FluidCell);
		CircuitAssembler.addRecipe(FluidCell, [EngineeringProcessor, StorageComponent[i], StorageCell_Field[i]],
		StorageCell_Liquid[i] * 144, 400, StorageCell_CraftingVoltage[i]);
	}

	val SpatialComponent = [
		<appliedenergistics2:item.ItemMultiMaterial:32>, // 2^3
		<appliedenergistics2:item.ItemMultiMaterial:33>, // 16^3
		<appliedenergistics2:item.ItemMultiMaterial:34>  // 128^3
	] as IItemStack[];
	// for Component in SpatialComponent {recipes.removeShaped(Component);}
}


function AddRecipe_UpgradeCards() {

	val LogicProcessor = <appliedenergistics2:item.ItemMultiMaterial:22>;
	val EngineeringProcessor = <appliedenergistics2:item.ItemMultiMaterial:24>;

	// Basic Cards
	val BasicCard = <appliedenergistics2:item.ItemMultiMaterial:25> as IItemStack;
	Assembler.addRecipe(BasicCard, [<ore:platePlastic> * 2, LogicProcessor],
		<liquid:molten.polytetrafluoroethylene> * 72, 400, 48);
	recipes.remove(BasicCard);

	val RedstoneCard = <appliedenergistics2:item.ItemMultiMaterial:26> as IItemStack;
	Assembler.addRecipe(RedstoneCard, [BasicCard,
		<BuildCraft|Transport:pipeGate>.withTag({mat: 1 as byte, ex: ["buildcraft:fader"], logic: 0 as byte}),
		<ore:wireFineRedAlloy> * 4], <liquid:molten.plastic> * 72, 400, 48);
	recipes.remove(RedstoneCard);

	val CapacityCard = <appliedenergistics2:item.ItemMultiMaterial:27> as IItemStack;
	Assembler.addRecipe(CapacityCard, [BasicCard, <ore:chipNAND> * 4, <ore:wireFineTin> * 4],
		<liquid:molten.plastic> * 72, 400, 48);
	recipes.remove(CapacityCard);

	val CraftingCard = <appliedenergistics2:item.ItemMultiMaterial:53> as IItemStack;
	Assembler.addRecipe(CraftingCard, [BasicCard, <ore:chipCPU> * 4, <ore:wireFineTin> * 4],
		<liquid:molten.plastic> * 72, 400, 48);
	recipes.remove(CraftingCard);

	// Advanced Cards
	val AdvancedCard = <appliedenergistics2:item.ItemMultiMaterial:28> as IItemStack;
	Assembler.addRecipe(AdvancedCard, [<ore:platePlastic> * 2, EngineeringProcessor],
		<liquid:molten.polytetrafluoroethylene> * 72, 400, 48);
	recipes.remove(AdvancedCard);

	val FuzzyCard = <appliedenergistics2:item.ItemMultiMaterial:29> as IItemStack;
	Assembler.addRecipe(FuzzyCard, [AdvancedCard,
		<BuildCraft|Transport:pipeGate>.withTag({mat: 3 as byte, ex: ["buildcraft:fader"], logic: 0 as byte}),
		<ore:wireFineRedAlloy> * 4], <liquid:molten.plastic> * 72, 400, 48);
	recipes.remove(FuzzyCard);

	val AccelerationCard = <appliedenergistics2:item.ItemMultiMaterial:30> as IItemStack;
	Assembler.addRecipe(AccelerationCard, [AdvancedCard, <ore:chipNCPU> * 4, <ore:wireFineTin> * 4],
		<liquid:molten.plastic> * 72, 400, 48);
	recipes.remove(AccelerationCard);

	val InverterCard = <appliedenergistics2:item.ItemMultiMaterial:31> as IItemStack;
	Assembler.addRecipe(InverterCard, [AdvancedCard, <ore:chipNOR> * 4, <ore:wireFineTin> * 4],
		<liquid:molten.plastic> * 72, 400, 48);
	recipes.remove(InverterCard);
}


function AddRecipe_Panels() {

	val MemoryCard = <appliedenergistics2:item.ToolMemoryCard>;
	val CraftingCard = <appliedenergistics2:item.ItemMultiMaterial:53>;

	val ToggleBus = <appliedenergistics2:item.ItemMultiPart:80>;
	val ToggleBusInverted = <appliedenergistics2:item.ItemMultiPart:100>;
	recipes.addShapeless(ToggleBus, [ToggleBusInverted]);

	// Input-Output stuff

	val ExportBus = <appliedenergistics2:item.ItemMultiPart:260>;
	recipes.remove(ExportBus);
	recipes.addShaped(ExportBus, [
		[<ore:wireFineVanadium>, <ore:plateVanadiumSteel>, <ore:wireFineVanadium>],
		[<ore:coreFormation>, <ore:pistonEV>, <ore:coreFormation>]
	]);

	val ImportBus = <appliedenergistics2:item.ItemMultiPart:240>;
	recipes.remove(ImportBus);
	recipes.addShaped(ImportBus, [
		[<ore:wireFineVanadium>, <ore:plateVanadiumSteel>, <ore:wireFineVanadium>],
		[<ore:coreAnnihilation>, <ore:pistonEV>, <ore:coreAnnihilation>]
	]);

	val StorageBus = <appliedenergistics2:item.ItemMultiPart:220>;
	recipes.remove(StorageBus);
	recipes.addShaped(StorageBus, [
		[<ore:coreAnnihilation>, <ore:processorCalculation>, <ore:coreAnnihilation>],
		[<ore:pistonEV>, <ore:plateVanadiumSteel>, <ore:pistonEV>],
		[<ore:coreFormation>, <ore:processorLogic>, <ore:coreFormation>]
	]);

	val Interface = <appliedenergistics2:item.ItemMultiPart:440>;
	recipes.remove(Interface);
	recipes.addShaped(Interface, [
		[<ore:wireFineVanadium>, <ore:plateVanadiumSteel>, <ore:wireFineVanadium>],
		[<ore:coreFormation>, <ore:pistonEV>, <ore:coreAnnihilation>]
	]);

	val P2P_Tunnel = <appliedenergistics2:item.ItemMultiPart:460>;
	recipes.remove(P2P_Tunnel);
	recipes.addShaped(P2P_Tunnel, [
		[<ore:wireFineVanadium>, MemoryCard, <ore:wireFineVanadium>],
		[<ore:pistonEV>, <ore:plateVanadiumSteel>, <ore:pistonEV>],
		[<ore:coreFormation>, <ore:processorCalculation>, <ore:coreAnnihilation>]
	]);

	val FormationPlane = <appliedenergistics2:item.ItemMultiPart:320>;
	recipes.remove(FormationPlane);
	recipes.addShaped(FormationPlane, [
		[<ore:wireFineVanadium>, <ore:plateVanadiumSteel>, <ore:wireFineVanadium>],
		[<ore:processorCalculation>, <ore:pistonEV>, <ore:processorCalculation>],
		[<ore:coreFormation>, <ore:coreFormation>, <ore:coreFormation>]
	]);

	val AnnihilationPlane = <appliedenergistics2:item.ItemMultiPart:300>;
	recipes.remove(AnnihilationPlane);
	recipes.addShaped(AnnihilationPlane, [
		[<ore:wireFineVanadium>, <ore:plateVanadium>, <ore:wireFineVanadium>],
		[<ore:processorCalculation>, <ore:pistonEV>, <ore:processorCalculation>],
		[<ore:coreAnnihilation>, <ore:coreAnnihilation>, <ore:coreAnnihilation>]
	]);

	// Panels

	val IlluminatedPanel = <appliedenergistics2:item.ItemMultiPart:180>;
	recipes.remove(IlluminatedPanel);
	Assembler.addRecipe(IlluminatedPanel, [
		<ThermalDynamics:cover>.withTag({Meta: 0 as byte, Block: "appliedenergistics2:tile.BlockQuartzLamp"})
		.onlyWithTag({Meta: 0 as byte, Block: "appliedenergistics2:tile.BlockQuartzLamp"}),
		<ore:dustFluix>,
		<ore:plateVanadiumSteel>
	], <liquid:molten.plastic> * 36, 40, 48); /*
	recipes.addShaped(IlluminatedPanel, [[
		<ThermalDynamics:cover>.withTag({Meta: 0 as byte, Block: "appliedenergistics2:tile.BlockQuartzLamp"})
		.onlyWithTag({Meta: 0 as byte, Block: "appliedenergistics2:tile.BlockQuartzLamp"}),
		<ore:dustFluix>,
		<ore:plateVanadiumSteel>
	]]); */

	val ME_Terminal = <appliedenergistics2:item.ItemMultiPart:380>;

	val ME_CraftingTerminal = <appliedenergistics2:item.ItemMultiPart:360>;
	recipes.remove(ME_CraftingTerminal);
	recipes.addShaped(ME_CraftingTerminal, [[ME_Terminal, CraftingCard]]);

	val ME_PatternTerminal = <appliedenergistics2:item.ItemMultiPart:340>;
	recipes.remove(ME_PatternTerminal);
	recipes.addShaped(ME_PatternTerminal, [[ME_CraftingTerminal, <ore:processorEngineering>]]);
	
	val ME_InterfaceTerminal = <appliedenergistics2:item.ItemMultiPart:480>;
	recipes.remove(ME_InterfaceTerminal);
	recipes.addShaped(ME_InterfaceTerminal, [[ME_Terminal, Interface, <ore:processorEngineering>]]);
}


function AddRecipe_Processors() {

	//OutputStack, InputRF, InputArray
	AssemblyTable.addRecipe(<BuildCraft|Transport:pipePlug>, 5000, [<minecraft:gravel>, <minecraft:cobblestone> * 2, <minecraft:glass>]);
}


function AddRecipe_Panels_ExtraCells() {

	val FluidLevelEmitter = <extracells:part.base:4>;
	val ME_Terminal = <appliedenergistics2:item.ItemMultiPart:380>;

	// Input-Output stuff

	val FluidExportBus = <extracells:part.base>;
	recipes.remove(FluidExportBus);
	recipes.addShaped(FluidExportBus, [
		[<ore:wireFineVanadium>, <ore:plateVanadiumGallium>, <ore:wireFineVanadium>],
		[<ore:coreFormation>, <ore:pistonEV>, <ore:coreFormation>]
	]);

	val FluidImportBus = <extracells:part.base:1>;
	recipes.remove(FluidImportBus);
	recipes.addShaped(FluidImportBus, [
		[<ore:wireFineVanadium>, <ore:plateVanadiumGallium>, <ore:wireFineVanadium>],
		[<ore:coreAnnihilation>, <ore:pistonEV>, <ore:coreAnnihilation>]
	]);

	val FluidStorageBus = <extracells:part.base:2>;
	recipes.remove(FluidStorageBus);
	recipes.addShaped(FluidStorageBus, [
		[<ore:coreAnnihilation>, <ore:processorCalculation>, <ore:coreAnnihilation>],
		[<ore:pistonEV>, <ore:plateVanadiumGallium>, <ore:pistonEV>],
		[<ore:coreFormation>, <ore:processorLogic>, <ore:coreFormation>]
	]);

	val FluidInterface = <extracells:part.base:9>;
	recipes.remove(FluidInterface);
	recipes.addShaped(FluidInterface, [
		[<ore:wireFineVanadium>, <ore:plateVanadiumGallium>, <ore:wireFineVanadium>],
		[<ore:coreFormation>, <ore:pistonEV>, <ore:coreAnnihilation>]
	]);

	val FluidFormationPlane = <extracells:part.base:6>;
	recipes.remove(FluidFormationPlane);
	recipes.addShaped(FluidFormationPlane, [
		[<ore:wireFineVanadium>, <ore:plateVanadiumGallium>, <ore:wireFineVanadium>],
		[<ore:processorCalculation>, <ore:pistonEV>, <ore:processorCalculation>],
		[<ore:coreFormation>, <ore:coreFormation>, <ore:coreFormation>]
	]);

	val FluidAnnihilationPlane = <extracells:part.base:5>;
	recipes.remove(FluidAnnihilationPlane);
	recipes.addShaped(FluidAnnihilationPlane, [
		[<ore:wireFineVanadium>, <ore:plateVanadiumGallium>, <ore:wireFineVanadium>],
		[<ore:processorCalculation>, <ore:pistonEV>, <ore:processorCalculation>],
		[<ore:coreAnnihilation>, <ore:coreAnnihilation>, <ore:coreAnnihilation>]
	]);

	// Panels

	val ME_FluidStorageMonitor = <extracells:part.base:10>;
	recipes.remove(ME_FluidStorageMonitor);
	recipes.addShapeless(ME_FluidStorageMonitor, [FluidLevelEmitter, <ore:itemIlluminatedPanel>]);

	val ME_FluidTerminal = <extracells:part.base:3>;
	recipes.remove(ME_FluidTerminal);
	recipes.addShaped(ME_FluidTerminal, [[ME_Terminal, <ore:pumpEV>, <ore:circuitData>]]);
}


function AddRecipe_Machines_Processing() {

	val SkyStoneBlock = <appliedenergistics2:tile.BlockSkyStone:1>;
//	val SkyStoneSlab = <appliedenergistics2:tile.SkyStoneBlockSlabBlock>;
	val FluixWireCoil = <immersiveintegration:aeDecoration>;
	val MolecularAssembler = <appliedenergistics2:tile.BlockMolecularAssembler>;

/*	val VibrationChamber = <appliedenergistics2:tile.BlockVibrationChamber>;
	ShowEnergyTooltip(VibrationChamber, 10.0, 1, 0);
	recipes.remove(VibrationChamber);
	recipes.addShaped(VibrationChamber, [
		[SkyStoneBlock, SkyStoneBlock, SkyStoneBlock],
		[SkyStoneBlock, <ore:gemFluix>, SkyStoneBlock],
		[SkyStoneBlock, <IC2:blockGenerator>, SkyStoneBlock]
	]); */

	val Inscriber = <appliedenergistics2:tile.BlockInscriber>;
	ShowEnergyTooltip(Inscriber, 10.0, 1000, 0);
/*	recipes.remove(Inscriber);
	recipes.addShaped(Inscriber, [
		[<ore:plateDoubleVanadium>, <ore:pistonLV>, <ore:plateDoubleVanadium>],
		[SkyStoneSlab, <ore:conveyorLV>, SkyStoneSlab],
		[SkyStoneBlock, SkyStoneBlock, SkyStoneBlock]
	]); */

	val Charger = <appliedenergistics2:tile.BlockCharger>;
	ShowEnergyTooltip(Charger, 100.0, 1500, 0);
	recipes.remove(Charger);
	recipes.addShaped(Charger, [
		[SkyStoneBlock, <ore:emitterEV>, <ore:foilVanadium>],
		[<ore:plateDoubleVanadium>, <ore:gemFluix>, null],
		[SkyStoneBlock, <ore:sensorEV>, <ore:foilVanadium>]
	]);

	val CrystalGrowthAccelerator = <appliedenergistics2:tile.BlockQuartzGrowthAccelerator>;
	ShowEnergyTooltip(CrystalGrowthAccelerator, 8.0, 0, 0);
	recipes.remove(CrystalGrowthAccelerator);
	recipes.addShaped(CrystalGrowthAccelerator, [
		[<ore:wireFineVanadiumGallium>, <ore:blockFluix>, <ore:wireFineVanadiumGallium>],
		[<ore:emitterEV>, FluixWireCoil, <ore:emitterEV>],
		[<ore:wireFineVanadiumGallium>, <ore:blockFluix>, <ore:wireFineVanadiumGallium>]
	]);

	val MatterCondenser = <appliedenergistics2:tile.BlockCondenser>;
	recipes.remove(MatterCondenser);
	recipes.addShaped(MatterCondenser, [
		[<ore:coreAnnihilation>, <ore:spatialComponent2>, <ore:coreAnnihilation>],
		[<ore:spatialComponent2>, MolecularAssembler, <ore:spatialComponent2>],
		[<ore:coreAnnihilation>, <ore:spatialComponent2>, <ore:coreAnnihilation>]
	]);
}


function AddRecipe_Machines_Network() {

	val EngravedLapotronChip = <gregtech:gt.metaitem.01:32714>;
	val StorageBus = <appliedenergistics2:item.ItemMultiPart:220>;
	val ME_InterfaceTerminal = <appliedenergistics2:item.ItemMultiPart:480>;
	val ME_Drive = <appliedenergistics2:tile.BlockDrive>;

	val EnergyCell = <appliedenergistics2:tile.BlockEnergyCell>;
	EnergyCell.addShiftTooltip(format.darkGray("Capacity: ") + format.aqua("200000 AE"));
	recipes.remove(EnergyCell);
	recipes.addShaped(EnergyCell, [
		[<ore:plateVanadiumSteel>, <ore:gemFluix>, <ore:plateVanadiumSteel>],
		[<ore:gemFluix>, EngravedLapotronChip, <ore:gemFluix>],
		[<ore:plateVanadiumSteel>, <ore:gemFluix>, <ore:plateVanadiumSteel>]
	]);
	Assembler.addRecipe(EnergyCell, [
		<ore:frameGtVanadiumSteel>,
		<ore:gemFluix> * 4,
		EngravedLapotronChip,
		<ore:cableAECovered> * 2,
		<ore:wireFineVanadium> * 4
	], null, 1200, 240);

	val DenseEnergyCell = <appliedenergistics2:tile.BlockDenseEnergyCell>;
	DenseEnergyCell.addShiftTooltip(format.darkGray("Capacity: ") + format.aqua("1600000 AE"));
	recipes.remove(DenseEnergyCell);
	recipes.addShaped(DenseEnergyCell, [
		[<ore:plateVanadiumGallium>, <ore:blockFluix>, <ore:plateVanadiumGallium>],
		[<ore:blockFluix>, EngravedLapotronChip, <ore:blockFluix>],
		[<ore:plateVanadiumGallium>, <ore:blockFluix>, <ore:plateVanadiumGallium>]
	]);
	Assembler.addRecipe(DenseEnergyCell, [
		<ore:frameGtVanadiumGallium>,
		<ore:blockFluix> * 4,
		EngravedLapotronChip,
		<ore:cableAECovered> * 2,
		<ore:wireFineVanadium> * 4
	], null, 1200, 480);

	val EnergyAcceptor = <appliedenergistics2:tile.BlockEnergyAcceptor>;
	//EnergyAcceptor.addTooltip(format.darkGray("Power convertion ratio: ")
	//	+ format.aqua("1 AE") + format.darkGray(" = ") + format.aqua("2 RF") + format.darkGray(" = ") + format.aqua("0.5 EU"));
	recipes.remove(EnergyAcceptor);
	recipes.addShaped(EnergyAcceptor, [
		[<ore:plateVanadiumSteel>, <ore:gemFluix>, <ore:plateVanadiumSteel>],
		[<ore:gemFluix>, <ore:frameGtPolytetrafluoroethylene>, <ore:gemFluix>],
		[<ore:plateVanadiumSteel>, <ore:gemFluix>, <ore:plateVanadiumSteel>]
	]);


	val ME_Controller = <appliedenergistics2:tile.BlockController>;
	ShowEnergyTooltip(ME_Controller, 3.0, 0, 0);
	recipes.remove(ME_Controller);
	recipes.addShaped(ME_Controller, [
		[<ore:plateDoubleVanadium>, <ore:cableAEDense>, <ore:plateDoubleVanadium>],
		[<ore:circuitElite>, EnergyAcceptor, <ore:circuitElite>],
		[<ore:plateDoubleVanadium>, <ore:cableAEDense>, <ore:plateDoubleVanadium>]
	]);
	Assembler.addRecipe(ME_Controller, [
		EnergyAcceptor,
		<ore:circuitElite> * 2,
		<ore:plateVanadium> * 6,
		<ore:cableAEDense> * 2
	], <liquid:molten.plastic> * 576, 400, 480);

	val ME_IO_Port = <appliedenergistics2:tile.BlockIOPort>;
	ShowEnergyTooltip(ME_IO_Port, 1.0, 0, 1);
	recipes.remove(ME_IO_Port);
	recipes.addShaped(ME_IO_Port, [
		[<ore:plateVanadiumSteel>, StorageBus, <ore:plateVanadiumSteel>],
		[<ore:storageComponent16k>, ME_Drive, <ore:storageComponent16k>],
		[<ore:plateDoubleVanadium>, <ore:cableAEDense>, <ore:plateDoubleVanadium>]
	]);
}


function AddRecipe_Machines_Storage() {

	val ME_Terminal = <appliedenergistics2:item.ItemMultiPart:380>;
	val Interface = <appliedenergistics2:item.ItemMultiPart:440>;

	val ME_Interface = <appliedenergistics2:tile.BlockInterface>;
	ShowEnergyTooltip(ME_Interface, 1.0, 0, 1);
	recipes.remove(ME_Interface);
	recipes.addShaped(ME_Interface, [
		[<ore:plateVanadiumSteel>, Interface, <ore:plateVanadiumSteel>],
		[<ore:cableAECovered>, <ore:frameGtPolytetrafluoroethylene>, <ore:cableAECovered>],
		[<ore:plateVanadiumSteel>, Interface, <ore:plateVanadiumSteel>]
	]);
	Assembler.addRecipe(ME_Interface, [
		<ore:frameGtPolytetrafluoroethylene>,
		Interface * 2,
		<ore:plateVanadiumSteel> * 2,
		<ore:cableAECovered> * 2
	], <liquid:molten.plastic> * 288, 200, 120);

	val ME_Chest = <appliedenergistics2:tile.BlockChest>;
	ShowEnergyTooltip(ME_Chest, 1.5, 0, 1);
	recipes.remove(ME_Chest);
	recipes.addShaped(ME_Chest, [
		[<ore:plateVanadiumSteel>, ME_Terminal, <ore:plateVanadiumSteel>],
		[<ore:processorLogic>, <OpenComputers:diskDrive>, <ore:processorLogic>],
		[<ore:plateDoubleVanadium>, <ore:cableAESmart>, <ore:plateDoubleVanadium>]
	]); /*
	recipes.addShaped(ME_Chest, [
		[<ore:plateVanadium>, ME_Terminal, <ore:plateVanadium>],
		[<ore:processorLogic>, <OpenComputers:diskDrive>, <ore:processorLogic>],
		[<ore:plateDoubleVanadium>, <ore:cableAESmart>, <ore:plateDoubleVanadium>]
	]); */

	val ME_Drive = <appliedenergistics2:tile.BlockDrive>;
	ShowEnergyTooltip(ME_Drive, 2.0, 0, 1);
	recipes.remove(ME_Drive);
	recipes.addShaped(ME_Drive, [
		[<ore:plateVanadium>, <ore:plateVanadiumSteel>, <ore:plateVanadium>],
		[<ore:processorEngineering>, <OpenComputers:raid>, <ore:processorEngineering>],
		[<ore:plateDoubleVanadium>, <ore:cableAEDense>, <ore:plateDoubleVanadium>]
	]);
}


function AddRecipe_Machines_Autocraft() {

	val ME_StorageMonitor = <appliedenergistics2:item.ItemMultiPart:400>;
	val ME_PatternTerminal = <appliedenergistics2:item.ItemMultiPart:340>;
	val QuartzGlass = <appliedenergistics2:tile.BlockQuartzGlass>;
	val FormationPlane = <appliedenergistics2:item.ItemMultiPart:320>;
	val AnnihilationPlane = <appliedenergistics2:item.ItemMultiPart:300>;
	val FuzzyCard = <appliedenergistics2:item.ItemMultiMaterial:29>;
	val AccelerationCard = <appliedenergistics2:item.ItemMultiMaterial:30>;

	val MolecularAssembler = <appliedenergistics2:tile.BlockMolecularAssembler>;
	ShowEnergyTooltip(MolecularAssembler, 0.0, -1, 1);
	recipes.remove(MolecularAssembler);
	recipes.addShaped(MolecularAssembler, [
		[QuartzGlass, FormationPlane, QuartzGlass],
		[<ore:processorCalculation>, ME_PatternTerminal, <ore:processorCalculation>],
		[QuartzGlass, AnnihilationPlane, QuartzGlass]
	]);

	val CraftingMonitor = <appliedenergistics2:tile.BlockCraftingMonitor>;
	recipes.remove(CraftingMonitor);
	recipes.addShaped(CraftingMonitor, [
		[<ore:plateVanadiumSteel>, ME_StorageMonitor, <ore:plateVanadiumSteel>],
		[<ore:processorCalculation>, <ore:frameGtPolytetrafluoroethylene>, <ore:processorCalculation>],
		[<ore:plateVanadiumSteel>, <ore:cableAESmart>, <ore:plateVanadiumSteel>]
	]);

	val CraftingUnit = <appliedenergistics2:tile.BlockCraftingUnit:0>;
	recipes.remove(CraftingUnit);
	recipes.addShaped(CraftingUnit, [
		[<ore:plateVanadiumSteel>, <ore:processorCalculation>, <ore:plateVanadiumSteel>],
		[<ore:circuitElite>, <ore:frameGtPolytetrafluoroethylene>, <ore:circuitElite>],
		[<ore:plateVanadiumSteel>, <ore:cableAESmart>, <ore:plateVanadiumSteel>]
	]);

	val CraftingStorage1k = <appliedenergistics2:tile.BlockCraftingStorage:0>;
	recipes.remove(CraftingStorage1k);
	Assembler.addRecipe(CraftingStorage1k, [CraftingUnit,
		FuzzyCard, AccelerationCard,
		<ore:storageComponent1k>,
		<ore:processorEngineering>
	], <liquid:molten.plastic> * 576, 1200, 120);

	val CraftingStorage4k = <appliedenergistics2:tile.BlockCraftingStorage:1>;
	recipes.remove(CraftingStorage4k);
	Assembler.addRecipe(CraftingStorage4k, [CraftingUnit,
		FuzzyCard, AccelerationCard * 2,
		<ore:storageComponent4k>,
		<ore:processorEngineering>
	], <liquid:molten.plastic> * 576, 1200, 480);

	val CraftingStorage16k = <appliedenergistics2:tile.BlockCraftingStorage:2>;
	recipes.remove(CraftingStorage16k);
	Assembler.addRecipe(CraftingStorage16k, [CraftingUnit,
		FuzzyCard, AccelerationCard * 3,
		<ore:storageComponent16k>,
		<ore:processorEngineering>
	], <liquid:molten.plastic> * 576, 1200, 1920);

	val CraftingStorage64k = <appliedenergistics2:tile.BlockCraftingStorage:3>;
	recipes.remove(CraftingStorage64k);
	Assembler.addRecipe(CraftingStorage64k, [CraftingUnit,
		FuzzyCard, AccelerationCard * 4,
		<ore:storageComponent64k>,
		<ore:processorEngineering>
	], <liquid:molten.plastic> * 576, 1200, 7680);

	val CraftingCoProcessingUnit = <appliedenergistics2:tile.BlockCraftingUnit:1>;
	recipes.remove(CraftingCoProcessingUnit);
	Assembler.addRecipe(CraftingCoProcessingUnit, [CraftingUnit,
		FuzzyCard, AccelerationCard * 6,
		<ore:circuitUltimate>,
		<ore:processorEngineering>
	], <liquid:molten.plastic> * 576, 2400, 7680);
}


function AddRecipe_Machines_Quantum() {

	val ME_Controller = <appliedenergistics2:tile.BlockController>;
	val MolecularAssembler = <appliedenergistics2:tile.BlockMolecularAssembler>;
	val ME_Chest = <appliedenergistics2:tile.BlockChest>;
	val DenseEnergyCell = <appliedenergistics2:tile.BlockDenseEnergyCell>;
	val WirelessReciever = <appliedenergistics2:item.ItemMultiMaterial:41>;

	val QuantumRing = <appliedenergistics2:tile.BlockQuantumRing>;
	ShowEnergyTooltip(QuantumRing, 22, 0, 0);
	recipes.remove(QuantumRing);
	recipes.addShaped(QuantumRing, [
		[<ore:wireFineNaquadria>, <ore:spatialComponent16>, <ore:wireFineNaquadria>],
		[<ore:spatialComponent16>, ME_Controller, <ore:spatialComponent16>],
		[<ore:wireFineNaquadria>, <ore:spatialComponent16>, <ore:wireFineNaquadria>]
	]);

	val QuantumLinkChamber = <appliedenergistics2:tile.BlockQuantumLinkChamber>;
	ShowEnergyTooltip(QuantumLinkChamber, 22, 0, 0);
	recipes.remove(QuantumLinkChamber);
	recipes.addShaped(QuantumLinkChamber, [
		[<ore:wireFineEuropium>, <ore:spatialComponent16>, <ore:wireFineEuropium>],
		[<ore:spatialComponent16>, MolecularAssembler, <ore:spatialComponent16>],
		[<ore:wireFineEuropium>, <ore:spatialComponent16>, <ore:wireFineEuropium>]
	]); /*
	recipes.addShaped(QuantumLinkChamber, [
		[<ore:wireFineEuropium>, <ore:spatialComponent128>, <ore:wireFineEuropium>],
		[<ore:spatialComponent128>, MolecularAssembler, <ore:spatialComponent128>],
		[<ore:wireFineEuropium>, <ore:spatialComponent128>, <ore:wireFineEuropium>]
	]); */

	val SpatialIOPort = <appliedenergistics2:tile.BlockSpatialIOPort>;
	ShowEnergyTooltip(SpatialIOPort, 1.0, 0, 1);
	recipes.remove(SpatialIOPort);
	recipes.addShaped(SpatialIOPort, [
		[<ore:plateVanadiumSteel>, WirelessReciever, <ore:plateVanadiumSteel>],
		[<ore:spatialComponent16>, MolecularAssembler, <ore:spatialComponent16>],
		[<ore:cableAEDense>, ME_Chest, <ore:cableAEDense>]
	]);

	val SpatialPylon = <appliedenergistics2:tile.BlockSpatialPylon>;
	ShowEnergyTooltip(SpatialPylon, 0.5, 0, 1);
	recipes.remove(SpatialPylon);
	recipes.addShaped(SpatialPylon, [
		[<ore:plateNiobiumTitanium>, <ore:emitterIV>, <ore:plateNiobiumTitanium>],
		[<ore:spatialComponent2>, <ore:frameGtNaquadah>, <ore:spatialComponent2>],
		[<ore:plateNiobiumTitanium>, <ore:sensorIV>, <ore:plateNiobiumTitanium>]
	]);
	Assembler.addRecipe(SpatialPylon, [
		<ore:frameGtNaquadah>, <ore:plateNiobiumTitanium> * 3, <ore:plateVanadiumSteel> * 3,
		<ore:spatialComponent2> * 2, <ore:emitterIV>, <ore:sensorIV>
	], <liquid:molten.plastic> * 576, 1200, 7680);
}


function ShowEnergyTooltip(Item as IItemStack, Power as float, ItIsGenerator as int, RequiresChannels as int) {
	val AE_EnergyMultiplier = 2.0 as float;

	// Item.addTooltip(format.darkGray("Press ") + format.aqua("Shift") + format.darkGray(" for Details"));
	// Item.addShiftTooltip("");

	if (ItIsGenerator == 1) {
		// Generation
		Item.addTooltip(format.darkGray("Power generation: ") + format.aqua(Utils.FloatToString(Power)) + " AE/t max");
	} else {
		if (ItIsGenerator > 0) {
			// Energy Per Operation
			Item.addTooltip(format.darkGray("Power usage: ") + format.aqua(Utils.FloatToString(Power)) + " AE/t max");
			Item.addTooltip(format.darkGray("Energy: ") + format.aqua(Utils.IntToString(ItIsGenerator)) + " AE "
				+ format.darkGray("per operation"));
		} if (ItIsGenerator == 0) {
			// Passive Drain per tick
			Item.addTooltip(format.darkGray("Passive Drain: ") + format.aqua(Utils.FloatToString(Power)) + " AE/t "
			+ format.darkGray("<") + format.aqua("x") + Utils.FloatToString(AE_EnergyMultiplier) + format.darkGray(">"));
		} if (ItIsGenerator < 0) {
			Item.addTooltip(format.darkGray("Has no Passive Drain"));
		}
	}

	if (RequiresChannels == 1) Item.addTooltip(format.aqua(format.italic("Requires Channel")));
}


#====================================================#
# GENERAL

AddRecipe_Components();
AddRecipe_Cables();
AddRecipe_StorageCells();
AddRecipe_UpgradeCards();

AddRecipe_Panels();
AddRecipe_Panels_ExtraCells();
AddRecipe_Processors();
// AddRecipe_Tools();

AddRecipe_Machines_Processing();
AddRecipe_Machines_Network();
AddRecipe_Machines_Storage();
AddRecipe_Machines_Autocraft();
AddRecipe_Machines_Quantum();


// Lumium: Pt2?AgAu

// by EverybodyLies, November 2017 - February 2018