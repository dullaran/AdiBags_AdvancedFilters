local AddonName, AddonTable = ...
local L = AddonTable.L

--AdiBags filters
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

-- Textos
local FILTER_NAME = 'Advanced Item Filter'
local FILTER_DESCRIPTIONS = 'Advanced Item Filter'

-- Constantes
local CLASSIC_ID = 0
local THE_BURNING_CRUSADE_ID = 1
local WRATH_OF_THE_LICH_KING_ID = 2
local CATACLYSM_ID = 3
local MISTS_OF_PANDARIA_ID = 4
local WARLORDS_OF_DRAENOR_ID = 5
local LEGION_ID = 6
local BATTLE_FOR_AZEROTH_ID = 7
local OTHER_ID = 20
local OLD_EXPANSIONS_ID = 21

-- Item category
local WEAPONS_ID = 30
local ARMOR_ID = 31
local CONTAINERS_ID = 32
local CONSUMABLES_ID = 33
local GLYPHS_ID = 34
local TRADE_GOODS_ID = 35
local RECIPES_ID = 36
local GEMS_ID = 37
local MISCELLANEOUS_ID = 38
local CURRENCY_ID = 39
local QUEST_ID = 40
local KEYS_ID = 41

-- Consumable category
local C_BANDAGES_ID = 42
local C_CONSUMABLES_ID = 43
local C_ELIXIRS_ID = 44
local C_FLASKS_ID = 45
local C_FOOD_DRINKS_ID = 46
local C_ITEM_ENHANCEMENTS_ID = 47
local C_POTIONS_ID = 48
local C_SCROLLS_ID = 49
local C_OTHER_ID = 50

-- Trade goods category
local T_ARMOR_ENCHANTMENTS_ID = 51
local T_CLOTH_ID = 52
local T_DEVICES_ID = 53
local T_ELEMENTAL_ID = 54
local T_ENCHANTING_ID = 55
local T_EXPLOSIVES_ID = 56
local T_HERBS_ID = 57
local T_JEWELCRAFTING_ID = 58
local T_LEATER_ID = 59
local T_MATERIALS_ID = 60
local T_MEAT_ID = 61
local T_METAL_STONE_ID = 62
local T_PARTS_ID = 63
local T_WEAPON_ENCHANTMENTS_ID = 64
local T_OTHER_ID = 65
local T_FISH_ID = 100
local T_EGG_ID = 101
local T_ANIMAL_ID = 102
local T_FISHING_ID = 103
local T_COOKING_ID = 104
local T_ENGINEERING_ID = 105

-- Recipes category
local R_BOOKS_ID = 66
local R_ALCHEMY_ID = 67
local R_BLACKSMITHING_ID = 68
local R_COOKING_ID = 69
local R_ENCHANTING_ID = 70
local R_ENGINEERING_ID = 71
local R_FIRST_AID_ID = 72
local R_FISHING_ID = 73
local R_INSCRIPTIONS_ID = 74
local R_JEWELCRAFTING_ID = 75
local R_LEATHERWORKING_ID = 76
local R_MINING_ID = 77
local R_TAILORING_ID = 78

-- Professions category
local P_ALCHEMY_ID = 79
local P_BLACKSMITHING_ID = 80
local P_ENCHANTING_ID = 81
local P_ENGINEERING_ID = 82
local P_HERBALISM_ID = 83
local P_INSCRIPTION_ID = 84
local P_JEWELCRAFTING_ID = 85
local P_LEATHERWORKING_ID = 86
local P_MINING_ID = 87
local P_SKINNING_ID = 88
local P_TAILORING_ID = 89
local P_ARCHAEOLOGY_ID = 90
local P_COOKING_ID = 91
local P_FIRST_AID_ID = 92
local P_FISHING_ID = 93
local P_RIDING_ID = 94

-- All expansions category
local PET_ID = 110
local PET_BATTLE_STONE_ID = 111
local PET_CONSUMABLE_ID = 112
local PET_SUPPLIES_ID = 113
local PET_TRAINING_STONE_ID = 114

-- Warlords of Draenor
local GARRISON_ID = 150
local GARRISON_BLUEPRINTS_ID = 151
local GARRISON_FOLLOWERS_ID = 152
local GARRISON_IRONHORDE_ID = 153
local GARRISON_MINING_ID = 154
local GARRISON_SHIPYARD_ID = 155
local GARRISON_WORKORDERS_ID = 156

local ASHRAN_ID = 157
local ASHRAN_BOOKS_ID = 158

local EXPANSIONS_LIST = {
    CLASSIC_ID, THE_BURNING_CRUSADE_ID, WRATH_OF_THE_LICH_KING_ID, 
    CATACLYSM_ID, MISTS_OF_PANDARIA_ID, WARLORDS_OF_DRAENOR_ID, 
    LEGION_ID, BATTLE_FOR_AZEROTH_ID}
local CATEGORY_LIST = {TRADE_GOODS_ID}
local CATEGORY_HAS_SUBCATEGORY = {
    [TRADE_GOODS_ID] = {
        T_CLOTH_ID, 
        T_ELEMENTAL_ID, 
        T_ENCHANTING_ID, 
        T_HERBS_ID, 
        T_JEWELCRAFTING_ID, 
        T_LEATER_ID, 
        T_METAL_STONE_ID, 
        T_COOKING_ID,
        T_FISHING_ID,
        T_ENGINEERING_ID},
    [T_COOKING_ID] = {T_ANIMAL_ID, T_EGG_ID, T_FISH_ID},
    [PET_ID] = {PET_BATTLE_STONE_ID, PET_CONSUMABLE_ID, PET_SUPPLIES_ID, PET_TRAINING_STONE_ID},
    [GARRISON_ID] = {
        GARRISON_BLUEPRINTS_ID,
        GARRISON_FOLLOWERS_ID,
        GARRISON_IRONHORDE_ID,
        GARRISON_MINING_ID,
        GARRISON_SHIPYARD_ID,
        GARRISON_WORKORDERS_ID},
    [ASHRAN_ID] = {ASHRAN_BOOKS_ID},
}
local EXPANSION_IDEPENDENDT_CATEGORY_LIST = {PET_ID}
local EXPANSION_SPECIFIC_SUBCATEGORY = {[WARLORDS_OF_DRAENOR_ID] = {GARRISON_ID, ASHRAN_ID}}

local Label_Expansions_Text = {
    [CLASSIC_ID] = 'CLS',
    [THE_BURNING_CRUSADE_ID] = 'TBC',
    [WRATH_OF_THE_LICH_KING_ID] = 'WotLK',
    [CATACLYSM_ID] = 'CTC',
    [MISTS_OF_PANDARIA_ID] = 'MoP',
    [WARLORDS_OF_DRAENOR_ID] = 'WoD',
    [LEGION_ID] = 'LGN',
    [BATTLE_FOR_AZEROTH_ID] = 'BfA'}

local Label_Text = {
    [CLASSIC_ID] = 'Classic',
    [THE_BURNING_CRUSADE_ID] = 'The Burning Crusade',
    [WRATH_OF_THE_LICH_KING_ID] = 'Wrath of the Lich King',
    [CATACLYSM_ID] = 'Cataclysm',
    [MISTS_OF_PANDARIA_ID] = 'Mists of Pandaria',
    [WARLORDS_OF_DRAENOR_ID] = 'Warlords of Draenor',
    [LEGION_ID] = 'Legion',
    [BATTLE_FOR_AZEROTH_ID] = 'Battle for Azeroth',
    [OTHER_ID] = 'Other',
    [OLD_EXPANSIONS_ID] ='Old Expansions',

    -- item category
    [WEAPONS_ID] = '',
    [ARMOR_ID] = '',
    [CONTAINERS_ID] = '',
    [CONSUMABLES_ID] = '',
    [GLYPHS_ID] = '',
    [TRADE_GOODS_ID] = 'Trade Goods',
    [RECIPES_ID] = '',
    [GEMS_ID] = '',
    [MISCELLANEOUS_ID] = '',
    [CURRENCY_ID] = '',
    [QUEST_ID] = '',
    [KEYS_ID] = '',

    -- consumable category
    [C_BANDAGES_ID] = '',
    [C_CONSUMABLES_ID] = '',
    [C_ELIXIRS_ID] = '',
    [C_FLASKS_ID] = '',
    [C_FOOD_DRINKS_ID] = '',
    [C_ITEM_ENHANCEMENTS_ID] = '',
    [C_POTIONS_ID] = '',
    [C_SCROLLS_ID] = '',
    [C_OTHER_ID] = '',

    -- trade goods category
    [T_ARMOR_ENCHANTMENTS_ID] = 'Armor Enchantments',
    [T_CLOTH_ID] = 'Cloth',
    [T_DEVICES_ID] = 'Devices',
    [T_ELEMENTAL_ID] = 'Elemental',
    [T_ENCHANTING_ID] = 'Enchanting',
    [T_EXPLOSIVES_ID] = 'Explosives',
    [T_HERBS_ID] = 'Herbs',
    [T_JEWELCRAFTING_ID] = 'Jewelcrafting',
    [T_LEATER_ID] = 'Leather',
    [T_MATERIALS_ID] = 'Materials',
    [T_MEAT_ID] = 'Meat',
    [T_METAL_STONE_ID] = 'Metal & Stone',
    [T_PARTS_ID] = 'Parts',
    [T_WEAPON_ENCHANTMENTS_ID] = 'Weapon Enchantments',
    [T_OTHER_ID] = 'Others',

    -- recipes category
    [R_BOOKS_ID] = '',
    [R_ALCHEMY_ID] = '',
    [R_BLACKSMITHING_ID] = '',
    [R_COOKING_ID] = '',
    [R_ENCHANTING_ID] = '',
    [R_ENGINEERING_ID] = '',
    [R_FIRST_AID_ID] = '',
    [R_FISHING_ID] = '',
    [R_INSCRIPTIONS_ID] = '',
    [R_JEWELCRAFTING_ID] = '',
    [R_LEATHERWORKING_ID] = '',
    [R_MINING_ID] = '',
    [R_TAILORING_ID] = '',

    -- professions category
    [P_ALCHEMY_ID] = 'Alchemy',
    [P_BLACKSMITHING_ID] = 'Blacksmithing',
    [P_ENCHANTING_ID] = 'Enchanting',
    [P_ENGINEERING_ID] = 'Engineering',
    [P_HERBALISM_ID] = 'Herbalism',
    [P_INSCRIPTION_ID] = 'Inscription',
    [P_JEWELCRAFTING_ID] = 'Jewelcrafting',
    [P_LEATHERWORKING_ID] = 'Leatherworking',
    [P_MINING_ID] = 'Mining',
    [P_SKINNING_ID] = 'Skinning',
    [P_TAILORING_ID] = 'Tailoring',
    [P_ARCHAEOLOGY_ID] = 'Archaeology',
    [P_COOKING_ID] = 'Cooking',
    [P_FIRST_AID_ID] = 'First Aid',
    [P_FISHING_ID] = 'Fishing',
    [P_RIDING_ID] = '',

    -- another category
    [T_FISH_ID] = 'Fish',
    [T_EGG_ID] = 'Egg',
    [T_ANIMAL_ID] = 'Animal',
    [T_FISHING_ID] = 'Fishing',
    [T_COOKING_ID] = 'Cooking',
    [T_ENGINEERING_ID] = 'Engineering',

    -- all expansions category

    [PET_ID] = 'Pet',
    [PET_BATTLE_STONE_ID] = 'Battle-Stone',
    [PET_CONSUMABLE_ID] = 'Pet Consumable',
    [PET_SUPPLIES_ID] = 'Supplies',
    [PET_TRAINING_STONE_ID] = 'Training-Stone',

    -- warlords of draenor

    [GARRISON_ID] = 'Garrison',
    [GARRISON_BLUEPRINTS_ID] = 'Blueprints',
    [GARRISON_FOLLOWERS_ID] = 'Followers',
    [GARRISON_IRONHORDE_ID] = 'Iron Horde',
    [GARRISON_MINING_ID] = 'Mining Consumables',
    [GARRISON_SHIPYARD_ID] = 'Shipyard',
    [GARRISON_WORKORDERS_ID] = 'Work Orders',

    [ASHRAN_ID] = 'Ashran',
    [ASHRAN_BOOKS_ID] = 'Ashran Books'}

-- Variáveis
local ItemsIDs = nil
local ItemsExpansionIDs = {}
local DatabaseIDs = {}

function getAddedArray(array1, array2)
    retorno = {}
    if array1 then
        for _, elemento in ipairs(array1) do
            table.insert(retorno, elemento)
        end
    end
    if array2 then
        for _, elemento in ipairs(array2) do
            table.insert(retorno, elemento)
        end
    end
    return retorno
end

-- Inicializa a variável DatabaseIDs com as chaves necessarias
do 
    for number_expansion, expansion in ipairs(EXPANSIONS_LIST) do
        DatabaseIDs[expansion] = {}
        local categoriasDaExpansao = getAddedArray(CATEGORY_LIST, EXPANSION_SPECIFIC_SUBCATEGORY[expansion])
        for number_category, category in ipairs(categoriasDaExpansao) do
            DatabaseIDs[expansion][category] = {}
            if CATEGORY_HAS_SUBCATEGORY[category] then
                for number_subcategory, subcategory in ipairs(CATEGORY_HAS_SUBCATEGORY[category]) do
                    DatabaseIDs[expansion][category][subcategory] = {}
                end
            end
        end
    end

    for number_expansion_idependent, expansion_idependent in ipairs(EXPANSION_IDEPENDENDT_CATEGORY_LIST) do
        DatabaseIDs[expansion_idependent] = {}
        if CATEGORY_HAS_SUBCATEGORY[expansion_idependent] then
            for number_subcategory, category in ipairs(CATEGORY_HAS_SUBCATEGORY[expansion_idependent]) do
                DatabaseIDs[expansion_idependent][category] = {}
            end
        end
    end
end

-- Database: Legion
DatabaseIDs[LEGION_ID][TRADE_GOODS_ID][T_CLOTH_ID] = {
    127004, -- Imbued Silkweave
    124437, -- Shal'dorei Silk
    127037, -- Runic Catgut
    127681, -- Sharp Spritethorn
    151567, -- Lightweave Cloth
    146710, -- Bolt of Shadowcloth
    146711} -- Bolt of Starweave
DatabaseIDs[LEGION_ID][TRADE_GOODS_ID][T_COOKING_ID] = {
    133588, -- Flaked Sea Salt
    133589, -- Dalapeño Pepper
    133590, -- Muskenbutter
    133591, -- River Onion
    133592, -- Stonedark Snail
    133593} -- Royal Olive
DatabaseIDs[LEGION_ID][TRADE_GOODS_ID][T_COOKING_ID][T_ANIMAL_ID] = {
    133680, -- Slice of Bacon
    124118, -- Fatty Bearsteak
    124119, -- Big Gamy Ribs
    124120, -- Leyblood
    124117} -- Lean Shank
DatabaseIDs[LEGION_ID][TRADE_GOODS_ID][T_COOKING_ID][T_EGG_ID] = {
    142336, -- Falcosaur Egg
    124121} -- Wildfowl Egg
DatabaseIDs[LEGION_ID][TRADE_GOODS_ID][T_COOKING_ID][T_FISH_ID] = {
    124107, -- Cursed Queenfish
    124108, -- Mossgill Perch
    124109, -- Highmountain Salmon
    124110, -- Stormray
    124111, -- Runescale Koi
    124112, -- Black Barracuda
    133607} -- Silver Mackerel
DatabaseIDs[LEGION_ID][TRADE_GOODS_ID][T_ELEMENTAL_ID] = {
    124124, -- Blood of Sargeras
    151568, -- Primal Sargerite
    124122, -- Leyfire
    124123, -- Demonfire
    141323} -- Wild Transmutation
DatabaseIDs[LEGION_ID][TRADE_GOODS_ID][T_ENCHANTING_ID] = {
    124442, -- Chaos Crystal
    124441, -- Leylight Shard
    124440} -- Arkhana
DatabaseIDs[LEGION_ID][TRADE_GOODS_ID][T_ENGINEERING_ID] = {
    140781, -- X-87, -- Battle Circuit
    144329, -- Hardened Felglass
    136636, -- Sniping Scope
    136637, -- Oversized Blasting Cap
    136638, -- True Iron Barrel
    136633, -- Loose Trigger
    140782, -- Neural Net Detangler
    140783, -- Predictive Combat Operations Databank
    140784, -- Fel Piston Stabilizer
    140785, -- Hardened Circuitboard Plating
    147619} -- [QA] Big Stack Test
DatabaseIDs[LEGION_ID][TRADE_GOODS_ID][T_FISHING_ID] = {
    138967, -- Big Fountain Goldfish
    133725, -- Leyshimmer Blenny
    133727, -- Ghostly Queenfish
    133728, -- Terrorfin
    133729, -- Thorned Flounder
    133730, -- Ancient Mossgill
    133731, -- Mountain Puffer
    133732, -- Coldriver Carp
    133733, -- Ancient Highmountain Salmon
    133734, -- Oodelfjisk
    133735, -- Graybelly Lobster
    133736, -- Thundering Stormray
    133737, -- Magic-Eater Frog
    133739, -- Tainted Runescale Koi
    133740, -- Axefish
    133742, -- Ancient Black Barracuda
    133726, -- Nar'thalas Hermit
    139652, -- Leyshimmer Blenny
    139653, -- Nar'thalas Hermit
    139654, -- Ghostly Queenfish
    139655, -- Terrorfin
    139656, -- Thorned Flounder
    139657, -- Ancient Mossgill
    139658, -- Mountain Puffer
    139659, -- Coldriver Carp
    139660, -- Ancient Highmountain Salmon
    139661, -- Oodelfjisk
    139662, -- Graybelly Lobster
    139663, -- Thundering Stormray
    139664, -- Magic-Eater Frog
    139666, -- Tainted Runescale Koi
    139667, -- Axefish
    139669} -- Ancient Black Barracuda
DatabaseIDs[LEGION_ID][TRADE_GOODS_ID][T_HERBS_ID] = {
    128304, --Yseralline Seed
    124106, --Felwort
    129289, --Felwort Seed
    124101, --Aethril
    129284, --Aethril Seed
    124102, --Dreamleaf
    129285, --Dreamleaf Seed
    124103, --Foxflower
    129286, --Foxflower Seed
    124104, --Fjarnskaggl
    129287, --Fjarnskaggl Seed
    124105, --Starlight Rose
    129288, --Starlight Rose Seed
    151565} --Astral Glory
DatabaseIDs[LEGION_ID][TRADE_GOODS_ID][T_JEWELCRAFTING_ID] = {
    144344, -- Orange Gem
    151579, -- Labradorite
    151719, -- Lightsphene
    151720, -- Chemirine
    151721, -- Hesselian
    151722, -- Florid Malachite
    130178, -- Furystone
    130179, -- Eye of Prophecy
    130180, -- Dawnlight
    130181, -- Pandemonite
    130182, -- Maelstrom Sapphire
    130183, -- Shadowruby
    130245, -- Saber's Eye
    151718, -- Argulite
    144347, -- Red Gem
    144348, -- Yellow Gem
    144349, -- Green Gem
    144350, -- Blue Gem
    144351, -- Purple Gem
    130172, -- Sangrite
    130173, -- Deep Amber
    130174, -- Azsunite
    130175, -- Chaotic Spinel
    130176, -- Skystone
    130177, -- Queen's Opal
    129100} -- Gem Chip
DatabaseIDs[LEGION_ID][TRADE_GOODS_ID][T_LEATER_ID] = {
    124116, -- Felhide
    136533, -- Dreadhide Leather
    136534, -- Gravenscale
    151566, -- Fiendish Leather
    124113, -- Stonehide Leather
    124115, -- Stormscale
    146712, -- Wisp-Touched Elderhide
    146713} -- Prime Wardenscale
DatabaseIDs[LEGION_ID][TRADE_GOODS_ID][T_METAL_STONE_ID] = {
    124444, -- Infernal Brimstone
    151564, -- Empyrium
    123919, -- Felslate
    124461, -- Demonsteel Bar
    123918} -- Leystone Ore

-- Database: Warlords of Draenor
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][TRADE_GOODS_ID][T_CLOTH_ID] = {
    111556, -- Hexweave Cloth
    111557} -- Sumptuous Fur
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][TRADE_GOODS_ID][T_COOKING_ID][T_ANIMAL_ID] = {
    109131, -- Raw Clefthoof Meat
    109134, -- Raw Elekk Meat
    109135, -- Raw Riverbeast Meat
    109136, -- Raw Boar Meat
    109132, -- Raw Talbuk Meat
    128500} -- Fel Ham
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][TRADE_GOODS_ID][T_COOKING_ID][T_EGG_ID] = {
    109133, -- Rylak Egg
    128499} -- Fel Egg
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][TRADE_GOODS_ID][T_COOKING_ID][T_FISH_ID] = {
    109143, -- Abyssal Gulper Eel Flesh
    109144, -- Blackwater Whiptail Flesh
    109140, -- Blind Lake Sturgeon Flesh
    109137, -- Crescent Saberfish Flesh
    109139, -- Fat Sleeper Flesh
    109141, -- Fire Ammonite Tentacle
    109138, -- Jawless Skulker Flesh
    109142} -- Sea Scorpion Segment
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][TRADE_GOODS_ID][T_ELEMENTAL_ID] = {
    113261, -- Sorcerous Fire
    113262, -- Sorcerous Water
    113263, -- Sorcerous Earth
    113264, -- Sorcerous Air
    120945} -- Primal Spirit
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][TRADE_GOODS_ID][T_ENCHANTING_ID] = {
    113588, -- Temporal Crystal
    111245, -- Luminous Shard
    109693, -- Draenic Dust
    115504, -- Fractured Temporal Crystal
    115502} -- Small Luminous Shard
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][TRADE_GOODS_ID][T_ENGINEERING_ID] = {
    114056, -- Didi's Delicate Assembly
    111366, -- Gearspring Parts
    119299} -- Secret of Draenor Engineering
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][TRADE_GOODS_ID][T_FISHING_ID] = {
    111671, -- Enormous Abyssal Gulper Eel
    111664, -- Abyssal Gulper Eel
    111659, -- Small Abyssal Gulper Eel
    116818, -- Abyssal Gulper Lunker
    111670, -- Enormous Blackwater Whiptail
    111663, -- Blackwater Whiptail
    111662, -- Small Blackwater Whiptail
    116817, -- Blackwater Whiptail Lunker
    111674, -- Enormous Blind Lake Sturgeon
    111667, -- Blind Lake Sturgeon
    111652, -- Small Blind Lake Sturgeon
    116820, -- Blind Lake Lunker
    111601, -- Enormous Crescent Saberfish
    111595, -- Crescent Saberfish
    111589, -- Small Crescent Saberfish
    111675, -- Enormous Fat Sleeper
    111668, -- Fat Sleeper
    111651, -- Small Fat Sleeper
    116821, -- Fat Sleeper Lunker
    111673, -- Enormous Fire Ammonite
    111666, -- Fire Ammonite
    111656, -- Small Fire Ammonite
    116819, -- Fire Ammonite Lunker
    111676, -- Enormous Jawless Skulker
    111669, -- Jawless Skulker
    111650, -- Small Jawless Skulker
    116822, -- Jawless Skulker Lunker
    111672, -- Enormous Sea Scorpion
    111665, -- Sea Scorpion
    111658, -- Small Sea Scorpion
    122696, -- Sea Scorpion Lunker
    118565, -- Savage Piranha
    127994, -- Felmouth Frenzy Lunker
    127991} -- Felmouth Frenzy
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][TRADE_GOODS_ID][T_HERBS_ID] = {

    109124, --Frostweed
    109624, --Broken Frostweed Stem
    109125, --Fireweed
    109625, --Broken Fireweed Stem
    109126, --Gorgrond Flytrap
    109626, --Gorgrond Flytrap Ichor
    109127, --Starflower
    109627, --Starflower Petal
    109128, --Nagrand Arrowbloom
    109628, --Nagrand Arrowbloom Petal
    109129, --Talador Orchid
    109629, --Talador Orchid Petal
    109130} --Chameleon Lotus
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][TRADE_GOODS_ID][T_LEATER_ID] = {
    110611, -- Burnished Leather
    110609, -- Raw Beast Hide
    110610} -- Raw Beast Hide Scraps
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][TRADE_GOODS_ID][T_METAL_STONE_ID] = {
    108257, -- Truesteel Ingot
    109118, -- Blackrock Ore
    157516, -- Blackrock Fragment
    109119, -- True Iron Ore
    157517} -- True Iron Nugget

DatabaseIDs[WARLORDS_OF_DRAENOR_ID][GARRISON_ID] = {
    116395, -- Comprehensive Outpost Construction Guide
    116394} -- Outpost Building Assembly Notes
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][GARRISON_ID][GARRISON_BLUEPRINTS_ID] = {
    118215, -- Book of Garrison Blueprints
    111812, -- Garrison Blueprint: Alchemy Lab, Level 1
    111929, -- Garrison Blueprint: Alchemy Lab, Level 2
    111930, -- Garrison Blueprint: Alchemy Lab, Level 3
    111968, -- Garrison Blueprint: Barn, Level 2
    111969, -- Garrison Blueprint: Barn, Level 3
    111956, -- Garrison Blueprint: Barracks, Level 1
    111970, -- Garrison Blueprint: Barracks, Level 2
    111971, -- Garrison Blueprint: Barracks, Level 3
    111966, -- Garrison Blueprint: Dwarven Bunker, Level 2
    111967, -- Garrison Blueprint: Dwarven Bunker, Level 3
    111817, -- Garrison Blueprint: Enchanter's Study, Level 1
    111972, -- Garrison Blueprint: Enchanter's Study, Level 2
    111973, -- Garrison Blueprint: Enchanter's Study, Level 3
    109258, -- Garrison Blueprint: Engineering Works, Level 1
    109256, -- Garrison Blueprint: Engineering Works, Level 2
    109257, -- Garrison Blueprint: Engineering Works, Level 3
    109578, -- Garrison Blueprint: Fishing Shack
    111927, -- Garrison Blueprint: Fishing Shack, Level 2
    111928, -- Garrison Blueprint: Fishing Shack, Level 3
    116248, -- Garrison Blueprint: Frostwall Mines, Level 2
    116249, -- Garrison Blueprint: Frostwall Mines, Level 3
    116431, -- Garrison Blueprint: Frostwall Tavern, Level 2
    116432, -- Garrison Blueprint: Frostwall Tavern, Level 3
    111814, -- Garrison Blueprint: Gem Boutique, Level 1
    111974, -- Garrison Blueprint: Gem Boutique, Level 2
    111975, -- Garrison Blueprint: Gem Boutique, Level 3
    111980, -- Garrison Blueprint: Gladiator's Sanctum, Level 2
    111981, -- Garrison Blueprint: Gladiator's Sanctum, Level 3
    111984, -- Garrison Blueprint: Gnomish Gearworks, Level 2
    111985, -- Garrison Blueprint: Gnomish Gearworks, Level 3
    116200, -- Garrison Blueprint: Goblin Workshop, Level 2
    116201, -- Garrison Blueprint: Goblin Workshop, Level 3
    109577, -- Garrison Blueprint: Herb Garden, Level 2
    111997, -- Garrison Blueprint: Herb Garden, Level 3
    109254, -- Garrison Blueprint: Lumber Mill, Level 2
    109255, -- Garrison Blueprint: Lumber Mill, Level 3
    109576, -- Garrison Blueprint: Lunarfall Excavation, Level 2
    111996, -- Garrison Blueprint: Lunarfall Excavation, Level 3
    107694, -- Garrison Blueprint: Lunarfall Inn, Level 2
    109065, -- Garrison Blueprint: Lunarfall Inn, Level 3
    109062, -- Garrison Blueprint: Mage Tower, Level 2
    109063, -- Garrison Blueprint: Mage Tower, Level 3
    111998, -- Garrison Blueprint: Menagerie, Level 2
    111999, -- Garrison Blueprint: Menagerie, Level 3
    111957, -- Garrison Blueprint: Salvage Yard, Level 1
    111976, -- Garrison Blueprint: Salvage Yard, Level 2
    111977, -- Garrison Blueprint: Salvage Yard, Level 3
    111815, -- Garrison Blueprint: Scribe's Quarters, Level 1
    111978, -- Garrison Blueprint: Scribe's Quarters, Level 2
    111979, -- Garrison Blueprint: Scribe's Quarters, Level 3
    116196, -- Garrison Blueprint: Spirit Lodge, Level 2
    116197, -- Garrison Blueprint: Spirit Lodge, Level 3
    112002, -- Garrison Blueprint: Stables, Level 2
    112003, -- Garrison Blueprint: Stables, Level 3
    111982, -- Garrison Blueprint: Storehouse, Level 2
    111983, -- Garrison Blueprint: Storehouse, Level 3
    111816, -- Garrison Blueprint: Tailoring Emporium, Level 1
    111992, -- Garrison Blueprint: Tailoring Emporium, Level 2
    111993, -- Garrison Blueprint: Tailoring Emporium, Level 3
    111813, -- Garrison Blueprint: The Forge, Level 1
    111990, -- Garrison Blueprint: The Forge, Level 2
    111991, -- Garrison Blueprint: The Forge, Level 3
    111818, -- Garrison Blueprint: The Tannery, Level 1
    111988, -- Garrison Blueprint: The Tannery, Level 2
    111989, -- Garrison Blueprint: The Tannery, Level 3
    111986, -- Garrison Blueprint: Trading Post, Level 2
    111987, -- Garrison Blueprint: Trading Post, Level 3
    116185, -- Garrison Blueprint: War Mill, Level 2
    116186, -- Garrison Blueprint: War Mill, Level 3
    127267, -- Ship Blueprint: Carrier
    127268, -- Ship Blueprint: Transport
    127269, -- Ship Blueprint: Battleship (horde)
    127270, -- Ship Blueprint: Submarine
    127268, -- Ship Blueprint: Transport
    126900, -- Ship Blueprint: Destroyer
    128492, -- Ship Blueprint: Battleship (alliance)
    -- Blueprints dropped by rare mobs in Tanaan Jungle
    126950, -- Equipment Blueprint: Bilge Pump
    128258, -- Equipment Blueprint: Felsmoke Launchers
    128232, -- Equipment Blueprint: High Intensity Fog Lights
    128255, -- Equipment Blueprint: Ice Cutter
    128231, -- Equipment Blueprint: Trained Shark Tank
    128252, -- Equipment Blueprint: True Iron Rudder
    128257, -- Equipment Blueprint: Ghostly Spyglass
    -- Other blueprints
    128256, -- Equipment Blueprint: Gyroscopic Internal Stabilizer
    128250, -- Equipment Blueprint: Unsinkable
    128251, -- Equipment Blueprint: Tuskarr Fishing Net
    128260, -- Equipment Blueprint: Blast Furnace
    128490, -- Blueprint: Oil Rig
    128444} -- Blueprint: Oil Rig
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][GARRISON_ID][GARRISON_FOLLOWERS_ID] = {
    -- Armor
    120301, -- Armor Enhancement Token
    114745, -- Braced Armor Enhancement
    114808, -- Fortified Armor Enhancement
    114822, -- Heavily Reinforced Armor Enhancement
    114807, -- War Ravaged Armor Set
    114806, -- Blackrock Armor Set
    114746, -- Goredrenched Armor Set
    -- Weapon
    120302, -- Weapon Enhancement Token
    114128, -- Balanced Weapon Enhancement
    114129, -- Striking Weapon Enhancement
    114131, -- Power Overrun Weapon Enhancement
    114616, -- War Ravaged Weaponry
    114081, -- Blackrock Weaponry
    114622, -- Goredrenched Weaponry
    -- Armor & Weapon 
    120313, -- Sanketsu
    128314, -- Frozen Arms of a Hero
    -- Abilities & Traits
    118354, -- Follower Re-training Certificate
    122272, -- Follower Ability Retraining Manual
    122273, -- Follower Trait Retraining Guide
    123858, -- Follower Retraining Scroll Case
    118475, -- Hearthstone Strategy Guide
    118474, -- Supreme Manual of Dance
    122584, -- Winning with Wildlings
    122583, -- Grease Monkey Guide
    122582, -- Guide to Arakkoa Relations
    122580, -- Ogre Buddy Handbook
    -- Other enhancements
    120311, -- The Blademaster's Necklace
    122298, -- Bodyguard Miniaturization Device
    -- Contracts
    116915, -- Inactive Apexis Guardian
    114245, -- Abu'Gar's Favorite Lure
    114243, -- Abu'Gar's Finest Reel
    114242, -- Abu'Gar's Vitality
    119161, -- Contract: Karg Bloodfury
    119162, -- Contract: Cleric Maluuf
    119165, -- Contract: Professor Felblast
    119166, -- Contract: Cacklebone
    119167, -- Contract: Vindicator Heluun
    119248, -- Contract: Dawnseeker Rukaryx
    119233, -- Contract: Kaz the Shrieker
    119240, -- Contract: Lokra
    119242, -- Contract: Magister Serena
    119243, -- Contract: Magister Krelas
    119244, -- Contract: Hulda Shadowblade
    119245, -- Contract: Dark Ranger Velonara
    119252, -- Contract: Rangari Erdanii
    119253, -- Contract: Spirit of Bony Xuk
    119254, -- Contract: Pitfighter Vaandaam
    119255, -- Contract: Bruto
    119256, -- Contract: Glirin
    119257, -- Contract: Penny Clobberbottom
    119267, -- Contract: Ziri'ak
    119288, -- Contract: Daleera Moonfang
    119291, -- Contract: Artificer Andren
    119292, -- Contract: Vindicator Onaala
    119296, -- Contract: Rangari Chel
    119298, -- Contract: Ranger Kaalya
    119418, -- Contract: Morketh Bladehowl
    119420, -- Contract: Miall
    122135, -- Contract: Greatmother Geyah
    122136, -- Contract: Kal'gor the Honorable
    122137, -- Contract: Bruma Swiftstone
    122138, -- Contract: Ulna Thresher
    112737, -- Contract: Ka'la of the Frostwolves
    112848, -- Contract: Daleera Moonfang
    114825, -- Contract: Ulna Thresher
    114826, -- Contract: Bruma Swiftstone
    119164, -- Contract: Arakkoa Outcasts Follower
    119168, -- Contract: Vol'jin's Spear Follower
    119169, -- Contract: Wrynn's Vanguard Follower
    119821, -- Contract: Dawnseeker Rukaryx
    128439, -- Contract: Pallas
    128440, -- Contract: Dowser Goodwell
    128441, -- Contract: Solar Priest Vayx
    128445} -- Contract: Dowser Bigspark   
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][GARRISON_ID][GARRISON_IRONHORDE_ID] = {
    113681, -- Iron Horde Scraps
    113823, -- Crusted Iron Horde Pauldrons
    113822, -- Ravaged Iron Horde Belt
    113821} -- Battered Iron Horde Helmet
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][GARRISON_ID][GARRISON_MINING_ID] = {
    118897, -- Miner's Coffee
    118903} -- Preserved Mining Pick
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][GARRISON_ID][GARRISON_SHIPYARD_ID] = {
    125787, -- Bilge Pump
    127882, -- Blast Furnace
    127884, -- Felsmoke Launcher
    127895, -- Ghostly Spyglass
    127881, -- Gyroscopic Internal Stabilizer
    127662, -- High Intensity Fog Lights
    127880, -- Ice Cutter
    127663, -- Trained Shark Tank
    127883, -- True Iron Rudder
    127894, -- Tuskarr Fishing Net
    127886} -- Unsinkable
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][GARRISON_ID][GARRISON_WORKORDERS_ID] = {
    114119, -- Crate of Salvage
    114116, -- Bag of Salvaged Goods
    114120, -- Big Crate of Salvage
    114781, -- Timber
    116053, -- Draenic Seeds
    115508, -- Draenic Stone
    113991, -- Iron Trap
    115009, -- Improved Iron Trap
    115010, -- Deadly Iron Trap
    119813, -- Furry Caged Beast
    119814, -- Leathery Caged Beast
    119810, -- Meaty Caged Beast
    119819, -- Caged Mighty Clefthoof
    119817, -- Caged Mighty Riverbeast
    119815, -- Caged Mighty Wolf
    117397, -- Nat's Lucky Coin
    128373, -- Rush Order: Shipyard
    122307, -- Rush Order: Barn
    122487, -- Rush Order: Gladiator's Sanctum
    122490, -- Rush Order: Dwarven Bunker
    122491, -- Rush Order: War Mill
    122496, -- Rush Order: Garden Shipment
    122497, -- Rush Order: Garden Shipment
    122500, -- Rush Order: Gnomish Gearworks
    122501, -- Rush Order: Goblin Workshop
    122502, -- Rush Order: Mine Shipment
    122503, -- Rush Order: Mine Shipment
    122576, -- Rush Order: Alchemy Lab
    122590, -- Rush Order: Enchanter's Study
    122591, -- Rush Order: Engineering Works
    122592, -- Rush Order: Gem Boutique
    122593, -- Rush Order: Scribe's Quarters
    122594, -- Rush Order: Tailoring Emporium
    122595, -- Rush Order: The Forge
    122596} -- Rush Order: The Tannery

DatabaseIDs[WARLORDS_OF_DRAENOR_ID][ASHRAN_ID] = {
    114982, --  Song Flower
    111842, --  Star Root Tuber
    116410, --  Scroll of Speed
    116411, --  Scroll of Protection
    116412, --  Scroll of Mass Invisibility
    116413, --  Scroll of Town Portal
    117013, --  Wand of Lightning Shield
    117014, --  Wand of Neutralization
    117015, --  Wand of Mana Stealing
    117016, --  Wand of Arcane Imprisonment
    116999, --  Scroll of Replenishment
    117381, --  Wand of Death
    116984, --  Frost Wyrm Egg
    118425, --  Nesingwary's Lost Horn
    118426, --  Scroll of Invoke Yu'lon, the Jade Serpent
    116925, --  Vintage Free Action Potion
    114124, --  Phantom Potion
    117017, --  Ghost Truffle
    115793, --  S.O.S. Relief Flare
    115500, --  Disposable Pocket Flying Machine
    114126, --  Disposable Pocket Flying Machine
    118109, --  Disposable Pocket Flying Machine
    118110, --  Disposable Pocket Flying Machine
    115500, --  Disposable Pocket Flying Machine
    116397, --  Swift Riding Crop
    116398, --  Flimsy X-Ray Goggles
    114125, --  Preserved Discombobulator Ray
    114629, --  Proximity Alarm-o-Bot 2000

    -- Usable only in Ashran???
    115512, --  Gazlowe's Gargantuan Grenade
    115501, --  Kowalski's Music Box
    115505} --  LeBlanc's Recorder
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][ASHRAN_ID][ASHRAN_BOOKS_ID] = {
    114846, -- Sigil of Dark Simulacrum
    118760, -- Book of Rebirth
    114842, -- Book of Flight Form
    112154, -- Guide: Disengage
    116983, -- Guide: Rogue Tracking
    114845, -- Tome of Blink
    114844, -- Scroll of Touch of Death
    112005, -- The Jailer's Libram
    111926, -- Codex of Ascension
    114843, -- Handbook: Pick Pocket
    116982, -- Handbook: Vanish
    114847, -- Tablet of Ghost Wolf
    114848, -- Grimoire Of Convert Demon
    114849} -- Manual Of Spell Reflection

-- Database: Mists of Pandaria
DatabaseIDs[MISTS_OF_PANDARIA_ID][TRADE_GOODS_ID][T_CLOTH_ID] = {
    82447, -- Imperial Silk
    92960, -- Silkworm Cocoon
    98619, -- Celestial Cloth
    82441, -- Bolt of Windwool Cloth
    72988} -- Windwool Cloth
DatabaseIDs[MISTS_OF_PANDARIA_ID][TRADE_GOODS_ID][T_COOKING_ID] = {
    102540, -- Fresh Mangos
    102542, -- Ancient Pandaren Spices
    102543, -- Aged Mogu'shan Cheese
    74659, -- Farm Chicken
    74660, -- Pandaren Peach
    74661, -- Black Pepper
    74662, -- Rice Flour
    74832, -- Barley
    74840, -- Green Cabbage
    74841, -- Juicycrunch Carrot
    74842, -- Mogu Pumpkin
    74843, -- Scallions
    74844, -- Red Blossom Leek
    74845, -- Ginseng
    102541, -- Aged Balsamic Vinegar
    74847, -- Jade Squash
    74848, -- Striped Melon
    74849, -- Pink Turnip
    74850, -- White Turnip
    74851, -- Rice
    74852, -- Yak Milk
    74853, -- 100 Year Soy Sauce
    74854, -- Instant Noodles
    79246, -- Delicate Blossom Petals
    79250, -- Fresh Pomfruit
    85583, -- Needle Mushrooms
    85584, -- Silkworm Pupa
    85585, -- Red Beans
    102536, -- Fresh Lushroom
    102538, -- Fresh Shao-Tien Rice
    102539, -- Fresh Strawberries
    74846} -- Witchberries
DatabaseIDs[MISTS_OF_PANDARIA_ID][TRADE_GOODS_ID][T_COOKING_ID][T_ANIMAL_ID] = {
    85506, -- Viseclaw Meat
    74833, -- Raw Tiger Steak
    74834, -- Mushan Ribs
    74837, -- Raw Turtle Meat
    74838, -- Raw Crab Meat
    74839, -- Wildfowl Breast
    75014} -- Raw Crocolisk Belly
DatabaseIDs[MISTS_OF_PANDARIA_ID][TRADE_GOODS_ID][T_COOKING_ID][T_EGG_ID] = {102537} -- Fresh Silkfeather Hawk Eggs
DatabaseIDs[MISTS_OF_PANDARIA_ID][TRADE_GOODS_ID][T_COOKING_ID][T_FISH_ID] = {
    74856, -- Jade Lungfish
    74857, -- Giant Mantis Shrimp
    74859, -- Emperor Salmon
    74860, -- Redbelly Mandarin
    74861, -- Tiger Gourami
    74863, -- Jewel Danio
    74864, -- Reef Octopus
    74865, -- Krasarang Paddlefish
    74866} -- Golden Carp
DatabaseIDs[MISTS_OF_PANDARIA_ID][TRADE_GOODS_ID][T_ELEMENTAL_ID] = {
    76061, -- Spirit of Harmony
    89112} -- Mote of Harmony
DatabaseIDs[MISTS_OF_PANDARIA_ID][TRADE_GOODS_ID][T_ENCHANTING_ID] = {
    74248, -- Sha Crystal
    105718, -- Sha Crystal Fragment
    74247, -- Ethereal Shard
    74252, -- Small Ethereal Shard
    80433, -- Blood Spirit
    94289, -- Haunting Spirit
    102218, -- Spirit of War
    74250, -- Mysterious Essence
    74249, -- Spirit Dust
    89738} -- Essence or Dust
DatabaseIDs[MISTS_OF_PANDARIA_ID][TRADE_GOODS_ID][T_ENGINEERING_ID] = {
    94111, -- Lightning Steel Ingot
    94113, -- Jard's Peculiar Energy Source
    98717, -- Balanced Trillium Ingot
    77467, -- Ghost Iron Bolts
    77468, -- High-Explosive Gunpowder
    90146} -- Tinker's Kit
DatabaseIDs[MISTS_OF_PANDARIA_ID][TRADE_GOODS_ID][T_HERBS_ID] = {
    72238, --Golden Lotus
    79011, --Fool's Cap
    97623, --Fool's Cap Spores
    79010, --Snow Lily
    97622, --Snow Lily Petal
    72235, --Silkweed
    97621, --Silkweed Stem
    72234, --Green Tea Leaf
    97619, --Torn Green Tea Leaf
    72237, --Rain Poppy
    97620, --Rain Poppy Petal

    89639, --Desecrated Herb
    97624} --Desecrated Herb Pod
DatabaseIDs[MISTS_OF_PANDARIA_ID][TRADE_GOODS_ID][T_JEWELCRAFTING_ID] = {
    76734, -- Serpent's Eye
    76131, -- Primordial Ruby
    76138, -- River's Heart
    76139, -- Wild Jade
    76140, -- Vermilion Onyx
    76141, -- Imperial Amethyst
    76142, -- Sun's Radiance
    76132, -- Primal Diamond
    76130, -- Tiger Opal
    76133, -- Lapis Lazuli
    76134, -- Sunstone
    76135, -- Roguestone
    76136, -- Pandarian Garnet
    76137} -- Alexandrite
DatabaseIDs[MISTS_OF_PANDARIA_ID][TRADE_GOODS_ID][T_LEATER_ID] = {
    72163, -- Magnificent Hide
    98617, -- Hardened Magnificent Hide
    79101, -- Prismatic Scale
    112157, -- Prismatic Scale Fragment
    72120, -- Exotic Leather
    72162} -- Sha-Touched Leather
DatabaseIDs[MISTS_OF_PANDARIA_ID][TRADE_GOODS_ID][T_METAL_STONE_ID] = {
    72094, -- Black Trillium Ore
    72095, -- Trillium Bar
    72103, -- White Trillium Ore
    72104, -- Living Steel
    72093, -- Kyparite
    97546, -- Kyparite Fragment
    72092, -- Ghost Iron Ore
    97512, -- Ghost Iron Nugget
    72096} -- Ghost Iron Bar

-- Database: Cataclysm
DatabaseIDs[CATACLYSM_ID][TRADE_GOODS_ID][T_CLOTH_ID] = {
    54440, -- Dreamcloth
    53010, -- Embersilk Cloth
    53643} -- Bolt of Embersilk Cloth
DatabaseIDs[CATACLYSM_ID][TRADE_GOODS_ID][T_COOKING_ID] = {
    62779, -- Monstrous Claw
    62780} -- Snake Eye
DatabaseIDs[CATACLYSM_ID][TRADE_GOODS_ID][T_COOKING_ID][T_ANIMAL_ID] = {
    62781, -- Giant Turtle Tongue
    62782, -- Dragon Flank
    62783, -- Basilisk "Liver"
    62784, -- Crocolisk Tail
    62785, -- Delicate Wing
    62791, -- Blood Shrimp
    67229} -- Stag Flank
DatabaseIDs[CATACLYSM_ID][TRADE_GOODS_ID][T_COOKING_ID][T_FISH_ID] = {
    53068, -- Lavascale Catfish
    53062, -- Sharptooth
    53064, -- Highland Guppy
    53065, -- Albino Cavefish
    53066, -- Blackbelly Mudfish
    53067, -- Striped Lurker
    53063, -- Mountain Trout
    53069, -- Murglesnout 
    53070, -- Fathom Eel
    53071, -- Algaefin Rockfish
    53072} -- Deepsea Sagefish
DatabaseIDs[CATACLYSM_ID][TRADE_GOODS_ID][T_ELEMENTAL_ID] = {
    52325, -- Volatile Fire
    52326, -- Volatile Water
    52327, -- Volatile Earth
    52328, -- Volatile Air
    52329, -- Volatile Life
    54464} -- Random Volatile Element
DatabaseIDs[CATACLYSM_ID][TRADE_GOODS_ID][T_ENCHANTING_ID] = {
    52722, -- Maelstrom Crystal
    52721, -- Heavenly Shard
    52720, -- Small Heavenly Shard
    52723, -- Runed Elementium Rod
    52719, -- Greater Celestial Essence
    52718, -- Lesser Celestial Essence
    52555} -- Hypnotic Dust
DatabaseIDs[CATACLYSM_ID][TRADE_GOODS_ID][T_ENGINEERING_ID] = {
    60224, -- Handful of Obsidium Bolts
    67749} -- Electrified Ether
DatabaseIDs[CATACLYSM_ID][TRADE_GOODS_ID][T_HERBS_ID] = {
    52987, --Twilight Jasmine
    108364, --Twilight Jasmine Petal
    52988, --Whiptail
    108365, --Whiptail Stem
    52986, --Heartblossom
    108363, --Heartblossom Petal
    52984, --Stormvine
    108361, --Stormvine Stalk
    52985, --Azshara's Veil
    108362, --Azshara's Veil Stem
    52983, --Cinderbloom
    108360} --Cinderbloom Petal
DatabaseIDs[CATACLYSM_ID][TRADE_GOODS_ID][T_JEWELCRAFTING_ID] = {
    77951, -- Shadowy Gem
    77952, -- Elementium Gem Cluster
    71806, -- Lightstone
    71807, -- Deepholm Iolite
    71808, -- Lava Coral
    71805, -- Queen's Garnet
    71810, -- Elven Peridot
    52196, -- Chimera's Eye
    52303, -- Shadowspirit Diamond
    52339, -- Flawless Pearl
    71809, -- Shadow Spinel
    52190, -- Inferno Ruby
    52191, -- Ocean Sapphire
    52192, -- Dream Emerald
    52193, -- Ember Topaz
    52194, -- Demonseye
    52195, -- Amberjewel
    52177, -- Carnelian
    52178, -- Zephyrite
    52179, -- Alicite
    52180, -- Nightstone
    52181, -- Hessonite
    52182, -- Jasper
    52338} -- Darkfathom Pearl
DatabaseIDs[CATACLYSM_ID][TRADE_GOODS_ID][T_LEATER_ID] = {
    52980, -- Pristine Hide
    52979, -- Blackened Dragonscale
    112156, -- Blackened Dragonscale Fragment
    52982, -- Deepsea Scale
    112155, -- Deepsea Scale Fragment
    52981, -- Scarred Shell Fragment
    56516, -- Heavy Savage Leather
    52976, -- Savage Leather
    52977} -- Savage Leather Scraps
DatabaseIDs[CATACLYSM_ID][TRADE_GOODS_ID][T_METAL_STONE_ID] = {
    51950, -- Pyrium Bar
    52183, -- Pyrite Ore
    108309, -- Pyrite Ore Nugget
    58480, -- Truegold
    52185, -- Elementium Ore
    108308, -- Elementium Ore Nugget
    52186, -- Elementium Bar
    53039, -- Hardened Elementium Bar
    53038, -- Obsidium Ore
    108307, -- Obsidium Ore Nugget
    54849, -- Obsidium Bar
    65365} -- Folded Obsidium

-- Database: Wrath of the Lick King
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][TRADE_GOODS_ID][T_CLOTH_ID] = {
    41593, -- Ebonweave
    41594, -- Moonshroud
    41595, -- Spellweave
    41511, -- Bolt of Imbued Frostweave
    42253, -- Iceweb Spider Silk
    33470, -- Frostweave Cloth
    38426, -- Eternium Thread
    41510} -- Bolt of Frostweave
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][TRADE_GOODS_ID][T_COOKING_ID][T_ANIMAL_ID] = {
    36782, -- Succulent Clam Meat
    34736, -- Chunk o' Mammoth
    43009, -- Shoveltusk Flank
    43010, -- Worm Meat
    43011, -- Worg Haunch
    43013, -- Chilled Meat
    44834} -- Wild Turkey
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][TRADE_GOODS_ID][T_COOKING_ID][T_EGG_ID] = {43501} -- Northern Egg
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][TRADE_GOODS_ID][T_COOKING_ID][T_FISH_ID] = {
    41808, -- Bonescale Snapper 
    41800, -- Deep Sea Monsterbelly
    41802, -- Imperial Manta Ray
    41803, -- Rockfin Grouper
    41805, -- Borean Man O' War
    41806, -- Musselback Sculpin
    41807, -- Dragonfin Angelfish
    41801, -- Moonglow Cuttlefish
    41809, -- Glacial Salmon
    41810, -- Fangtooth Herring
    41812, -- Barrelhead Goby
    41813, -- Nettlefish
    41814, -- Glassfin Minnow
    43012} -- Rhino Meat
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][TRADE_GOODS_ID][T_ELEMENTAL_ID] = {
    37700, -- Crystallized Air
    35622, -- Eternal Water
    35624, -- Eternal Earth
    35625, -- Eternal Life
    35627, -- Eternal Shadow
    36860, -- Eternal Fire
    35623, -- Eternal Air
    37701, -- Crystallized Earth
    37702, -- Crystallized Fire
    37703, -- Crystallized Shadow
    37704, -- Crystallized Life
    37705} -- Crystallized Water
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][TRADE_GOODS_ID][T_ENCHANTING_ID] = {
    44452, -- Runed Titanium Rod
    34057, -- Abyss Crystal
    34052, -- Dream Shard
    34053, -- Small Dream Shard
    34055, -- Greater Cosmic Essence
    34056, -- Lesser Cosmic Essence
    34054, -- Infinite Dust
    41741, -- Cobalt Rod
    41745} -- Titanium Rod
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][TRADE_GOODS_ID][T_ENGINEERING_ID] = {
    44499, -- Salvaged Iron Golem Parts
    44501, -- Goblin-Machined Piston
    40533, -- Walnut Stock
    44500, -- Elementium-Plated Exhaust Pipe
    39690, -- Volatile Blasting Trigger
    39681, -- Handful of Cobalt Bolts
    39684, -- Hair Trigger
    39682, -- Overcharged Capacitor
    39683} -- Froststeel Tube
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][TRADE_GOODS_ID][T_FISHING_ID] = {
    43571, -- Sewer Carp
    43572, -- Magic Eater
    43647, -- Shimmering Minnow
    43652, -- Slippery Eel
    43646} -- Fountain Goldfish
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][TRADE_GOODS_ID][T_HERBS_ID] = {
    36908, --Frost Lotus
    36905, --Lichbloom
    108355, --Lichbloom Stalk
    36906, --Icethorn
    108356, --Icethorn Bramble
    36903, --Adder's Tongue
    108353, --Adder's Tongue Stem
    39970, --Fire Leaf
    108359, --Fire Leaf Bramble
    36901, --Goldclover
    108352, --Goldclover Leaf
    36904, --Tiger Lily
    108354, --Tiger Lily Petal
    36907, --Talandra's Rose
    108357, --Talandra's Rose Petal
    37921, --Deadnettle
    108358} --Deadnettle Bramble
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][TRADE_GOODS_ID][T_JEWELCRAFTING_ID] = {
    41266, -- Skyflare Diamond
    36919, -- Cardinal Ruby
    36925, -- Majestic Zircon
    36928, -- Dreadstone
    36931, -- Ametrine
    36934, -- Eye of Zul
    36918, -- Scarlet Ruby
    36921, -- Autumn's Glow
    36924, -- Sky Sapphire
    36927, -- Twilight Opal
    36930, -- Monarch Topaz
    36933, -- Forest Emerald
    36922, -- King's Amber
    41334, -- Earthsiege Diamond
    42225, -- Dragon's Eye
    46849, -- Titanium Powder
    36784, -- Siren's Tear
    36783, -- Northsea Pearl
    36917, -- Bloodstone
    36920, -- Sun Crystal
    36923, -- Chalcedony
    36926, -- Shadow Crystal
    36929, -- Huge Citrine
    36932, -- Dark Jade
    45054} -- Prismatic Black Diamond
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][TRADE_GOODS_ID][T_LEATER_ID] = {
    38425, -- Heavy Borean Leather
    44128, -- Arctic Fur
    38557, -- Icy Dragonscale
    112158, -- Icy Dragonscale Fragment
    38561, -- Jormungar Scale
    112178, -- Jormungar Scale Fragment
    33567, -- Borean Leather Scraps
    33568, -- Borean Leather
    38558, -- Nerubian Chitin
    112177} -- Nerubian Chitin Fragment
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][TRADE_GOODS_ID][T_METAL_STONE_ID] = {
    36910, -- Titanium Ore
    108391, -- Titanium Ore Nugget
    37663, -- Titansteel Bar
    41163, -- Titanium Bar
    36913, -- Saronite Bar
    36912, -- Saronite Ore
    108306, -- Saronite Ore Nugget
    36909, -- Cobalt Ore
    108305, -- Cobalt Ore Nugget
    36916} -- Cobalt Bar

-- Database: The Burning Crusade
DatabaseIDs[THE_BURNING_CRUSADE_ID][TRADE_GOODS_ID][T_CLOTH_ID] = {
    21845, -- Primal Mooncloth
    24271, -- Spellcloth
    24272, -- Shadowcloth
    21844, -- Bolt of Soulcloth
    21842, -- Bolt of Imbued Netherweave
    21840, -- Bolt of Netherweave
    21877, -- Netherweave Cloth
    21881} -- Netherweb Spider Silk
DatabaseIDs[THE_BURNING_CRUSADE_ID][TRADE_GOODS_ID][T_COOKING_ID][T_ANIMAL_ID] = {
    24477, -- Jaggal Clam Meat
    27681, -- Warped Flesh
    27674, -- Ravager Flesh
    27677, -- Chunk o' Basilisk
    27678, -- Clefthoof Meat
    27671, -- Buzzard Meat
    27682, -- Talbuk Venison
    31670, -- Raptor Ribs
    31671, -- Serpent Flesh 
    35562, -- Bear Flank
    27669} -- Bat Flesh
DatabaseIDs[THE_BURNING_CRUSADE_ID][TRADE_GOODS_ID][T_COOKING_ID][T_FISH_ID] = {
    33823, -- Bloodfin Catfish
    33824, -- Crescent-Tail Skullfish
    27422, -- Barbed Gill Trout
    27425, -- Spotted Feltail
    27429, -- Zangarian Sporefish
    27435, -- Figluster's Mudfish
    27437, -- Icefin Bluefish
    27438, -- Golden Darter
    27439} -- Furious Crawdad
DatabaseIDs[THE_BURNING_CRUSADE_ID][TRADE_GOODS_ID][T_ELEMENTAL_ID] = {
    30183, -- Nether Vortex
    22578, -- Mote of Water
    23572, -- Primal Nether
    21884, -- Primal Fire
    21885, -- Primal Water
    21886, -- Primal Life
    22451, -- Primal Air
    22452, -- Primal Earth
    23571, -- Primal Might
    22457, -- Primal Mana
    22572, -- Mote of Air
    22573, -- Mote of Earth
    22574, -- Mote of Fire
    22575, -- Mote of Life
    22576, -- Mote of Mana
    22577, -- Mote of Shadow
    22456} -- Primal Shadow
DatabaseIDs[THE_BURNING_CRUSADE_ID][TRADE_GOODS_ID][T_ENCHANTING_ID] = {
    25845, -- Eternium Rod
    22449, -- Large Prismatic Shard
    25844, -- Adamantite Rod
    22450, -- Void Crystal
    22448, -- Small Prismatic Shard
    22446, -- Greater Planar Essence
    22461, -- Runed Fel Iron Rod
    22462, -- Runed Adamantite Rod
    22463, -- Runed Eternium Rod
    22447, -- Lesser Planar Essence
    22445, -- Arcane Dust
    25843} -- Fel Iron Rod
DatabaseIDs[THE_BURNING_CRUSADE_ID][TRADE_GOODS_ID][T_ENGINEERING_ID] = {
    23785, -- Hardened Adamantite Tube
    23786, -- Khorium Power Core
    23787, -- Felsteel Stabilizer
    32423, -- Icy Blasting Primers
    23784, -- Adamantite Frame
    23781, -- Elemental Blasting Powder
    23782, -- Fel Iron Casing
    23783} -- Handful of Fel Iron Bolts
DatabaseIDs[THE_BURNING_CRUSADE_ID][TRADE_GOODS_ID][T_FISHING_ID] = {35285} -- Giant Sunfish   
DatabaseIDs[THE_BURNING_CRUSADE_ID][TRADE_GOODS_ID][T_HERBS_ID] = {
    22794, --Fel Lotus
    22792, --Nightmare Vine
    108350, --Nightmare Vine Stem
    22793, --Mana Thistle
    108351, --Mana Thistle Leaf
    22797, --Nightmare Seed
    22791, --Netherbloom
    108349, --Netherbloom Leaf
    22790, --Ancient Lichen
    108348, --Ancient Lichen Petal
    22788, --Flame Cap
    22787, --Ragveil
    108346, --Ragveil Cap
    22785, --Felweed
    108344, --Felweed Stalk
    22786, --Dreaming Glory
    108345, --Dreaming Glory Petal
    22789, --Terocone
    108347, --Terocone Leaf
    22710} --Bloodthistle
DatabaseIDs[THE_BURNING_CRUSADE_ID][TRADE_GOODS_ID][T_JEWELCRAFTING_ID] = {
    24243, -- Adamantite Powder
    32227, -- Crimson Spinel
    32229, -- Lionseye
    32230, -- Shadowsong Amethyst
    32231, -- Pyrestone
    32249, -- Seaspray Emerald
    23436, -- Living Ruby
    23437, -- Talasite
    23438, -- Star of Elune
    23439, -- Noble Topaz
    23440, -- Dawnstone
    23441, -- Nightseye
    25867, -- Earthstorm Diamond
    25868, -- Skyfire Diamond
    32228, -- Empyrean Sapphire
    21929, -- Flame Spessarite
    23079, -- Deep Peridot
    23107, -- Shadow Draenite
    23112, -- Golden Draenite
    23117, -- Azure Moonstone
    23077, -- Blood Garnet
    31079, -- Mercurial Adamantite
    21752, -- Thorium Setting
    24478, -- Jaggal Pearl
    24479, -- Shadow Pearl
    20963, -- Mithril Filigree
    20817, -- Bronze Setting
    20816} -- Delicate Copper Wire
DatabaseIDs[THE_BURNING_CRUSADE_ID][TRADE_GOODS_ID][T_LEATER_ID] = {
    25707, -- Fel Hide
    112182, -- Patch of Fel Hide
    23793, -- Heavy Knothide Leather
    21887, -- Knothide Leather
    25649, -- Knothide Leather Scraps
    25699, -- Crystal Infused Leather
    112180, -- Patch of Crystal Infused Leather
    25700, -- Fel Scales
    112181, -- Fel Scale Fragment
    25708, -- Thick Clefthoof Leather
    112179, -- Patch of Thick Clefthoof Leather
    29539, -- Cobra Scales
    112184, -- Cobra Scale Fragment
    29547, -- Wind Scales
    112185, -- Wind Scale Fragment
    29548, -- Nether Dragonscales
    112183} -- Nether Dragonscale Fragment
DatabaseIDs[THE_BURNING_CRUSADE_ID][TRADE_GOODS_ID][T_METAL_STONE_ID] = {
    23426, -- Khorium Ore
    108304, -- Khorium Ore Nugget
    23447, -- Eternium Bar
    23449, -- Khorium Bar
    35128, -- Hardened Khorium
    23427, -- Eternium Ore
    108303, -- Eternium Ore Nugget
    23425, -- Adamantite Ore
    108302, -- Adamantite Ore Nugget
    23446, -- Adamantite Bar
    23573, -- Hardened Adamantite Bar
    23448, -- Felsteel Bar
    23424, -- Fel Iron Ore
    108301, -- Fel Iron Ore Nugget
    23445} -- Fel Iron Bar

-- Database: Classic
DatabaseIDs[CLASSIC_ID][TRADE_GOODS_ID][T_CLOTH_ID] = {
    14048, -- Bolt of Runecloth
    14342, -- Mooncloth
    14047, -- Runecloth
    14227, -- Ironweb Spider Silk
    14256, -- Felcloth
    14341, -- Rune Thread
    4339, -- Bolt of Mageweave
    4338, -- Mageweave Cloth
    8343, -- Heavy Silken Thread
    10285, -- Shadow Silk
    4305, -- Bolt of Silk Cloth
    4337, -- Thick Spider's Silk
    4291, -- Silken Thread
    4306, -- Silk Cloth
    2997, -- Bolt of Woolen Cloth
    2321, -- Fine Thread
    3182, -- Spider's Silk
    2592, -- Wool Cloth
    2996, -- Bolt of Linen Cloth
    2320, -- Coarse Thread
    2589} -- Linen Cloth
DatabaseIDs[CLASSIC_ID][TRADE_GOODS_ID][T_COOKING_ID] = {
    3404, -- Buzzard Wing
    2251, -- Gooey Spider Leg
    5470} -- Thunder Lizard Tail
DatabaseIDs[CLASSIC_ID][TRADE_GOODS_ID][T_COOKING_ID][T_ANIMAL_ID] = {
    21024, -- Chimaerok Tenderloin
    20424, -- Sandworm Meat
    7974, -- Zesty Clam Meat
    12206, -- Tender Crab Meat
    12208, -- Tender Wolf Meat
    12205, -- White Spider Meat
    4655, -- Giant Clam Meat
    12204, -- Heavy Kodo Meat
    3712, -- Turtle Meat
    12037, -- Mystery Meat
    12184, -- Raptor Flesh
    12202, -- Tiger Meat
    12203, -- Red Wolf Meat
    3667, -- Tender Crocolisk Meat
    5471, -- Stag Meat
    5504, -- Tangy Clam Meat
    3731, -- Lion Meat
    3730, -- Big Bear Meat
    1080, -- Tough Condor Meat
    5468, -- Soft Frenzy Flesh
    2677, -- Boar Ribs
    5503, -- Clam Meat
    723, -- Goretusk Liver
    2673, -- Coyote Meat
    5467} -- Kodo Meat
DatabaseIDs[CLASSIC_ID][TRADE_GOODS_ID][T_COOKING_ID][T_EGG_ID] = {
    12207, -- Giant Egg
    3685} -- Raptor Egg
DatabaseIDs[CLASSIC_ID][TRADE_GOODS_ID][T_COOKING_ID][T_FISH_ID] = {
    13888, -- Darkclaw Lobster
    13889, -- Raw Whitescale Salmon
    13754, -- Raw Glossy Mightfish
    13758, -- Raw Redgill
    13759, -- Raw Nightfin Snapper
    13760, -- Raw Sunscale Salmon
    4603, -- Raw Spotted Yellowtail
    13756, -- Raw Summer Bass
    21153, -- Raw Greater Sagefish
    8365, -- Raw Mithril Head Trout
    6362, -- Raw Rockscale Cod
    6308, -- Raw Bristle Whisker Catfish
    21071, -- Raw Sagefish
    6289, -- Raw Longjaw Mud Snapper
    6317, -- Raw Loch Frenzy
    6361, -- Raw Rainbow Fin Albacore
    6291, -- Raw Brilliant Smallfish
    6303} -- Raw Slitherskin Mackerel
DatabaseIDs[CLASSIC_ID][TRADE_GOODS_ID][T_ELEMENTAL_ID] = {
    7076, -- Essence of Earth
    7080, -- Essence of Water
    7082, -- Essence of Air
    12803, -- Living Essence
    12808, -- Essence of Undeath
    7078, -- Essence of Fire
    7075, -- Core of Earth
    7077, -- Heart of Fire
    7079, -- Globe of Water
    7081, -- Breath of Wind
    7972, -- Ichor of Undeath
    10286, -- Heart of the Wild
    7067, -- Elemental Earth
    7068, -- Elemental Fire
    7069, -- Elemental Air
    7070} -- Elemental Water
DatabaseIDs[CLASSIC_ID][TRADE_GOODS_ID][T_ENCHANTING_ID] = {
    20725, -- Nexus Crystal
    16207, -- Runed Arcanite Rod
    16203, -- Greater Eternal Essence
    16206, -- Arcanite Rod
    14344, -- Large Brilliant Shard
    16204, -- Illusion Dust
    14343, -- Small Brilliant Shard
    16202, -- Lesser Eternal Essence
    11178, -- Large Radiant Shard
    11176, -- Dream Dust
    11175, -- Greater Nether Essence
    11145, -- Runed Truesilver Rod
    11177, -- Small Radiant Shard
    11174, -- Lesser Nether Essence
    11144, -- Truesilver Rod
    11139, -- Large Glowing Shard
    11135, -- Greater Mystic Essence 
    11137, -- Vision Dust
    11130, -- Runed Golden Rod
    11134, -- Lesser Mystic Essence
    11128, -- Golden Rod
    11138, -- Small Glowing Shard
    11084, -- Large Glimmering Shard
    11082, -- Greater Astral Essence
    11083, -- Soul Dust
    6339, -- Runed Silver Rod
    10978, -- Small Glimmering Shard
    10998, -- Lesser Astral Essence
    6338, -- Silver Rod
    10939, -- Greater Magic Essence 
    10938, -- Lesser Magic Essence
    10940, -- Strange Dust 
    6217, -- Copper Rod
    6218} -- Runed Copper Rod
DatabaseIDs[CLASSIC_ID][TRADE_GOODS_ID][T_ENGINEERING_ID] = {
    16006, -- Delicate Arcanite Converter
    15994, -- Thorium Widget
    15992, -- Dense Blasting Powder
    10647, -- Engineer's Ink
    18631, -- Truesilver Transformer
    10561, -- Mithril Casing
    9060, -- Inlaid Mithril Cylinder
    9061, -- Goblin Rocket Fuel
    10560, -- Unstable Trigger
    16000, -- Thorium Tube
    10559, -- Mithril Tube
    10505, -- Solid Blasting Powder
    4389, -- Gyrochronatom
    4387, -- Iron Strut
    10558, -- Gold Power Core
    4382, -- Bronze Framework
    7191, -- Fused Wiring
    4375, -- Whirring Bronze Gizmo
    4377, -- Heavy Blasting Powder
    4400, -- Heavy Stock
    4371, -- Bronze Tube
    4404, -- Silver Contact
    4364, -- Coarse Blasting Powder
    4399, -- Wooden Stock
    4359, -- Handful of Copper Bolts
    4357, -- Rough Blasting Powder
    814, -- Flask of Oil
    4611} -- Blue Pearl
DatabaseIDs[CLASSIC_ID][TRADE_GOODS_ID][T_HERBS_ID] = {
    19727, --Blood Scythe
    13468, --Black Lotus
    13467, --Icecap
    108343, --Icecap Petal
    13466, --Sorrowmoss
    108342, --Sorrowmoss Leaf
    13465, --Mountain Silversage
    108341, --Mountain Silversage Stalk
    13463, --Dreamfoil
    108339, --Dreamfoil Blade
    13464, --Golden Sansam
    108340, --Golden Sansam Leaf
    8846, --Gromsblood
    108338, --Gromsblood Leaf
    8839, --Blindweed
    108336, --Blindweed Stem
    8845, --Ghost Mushroom
    108337, --Ghost Mushroom Cap
    8838, --Sungrass
    108335, --Sungrass Stalk
    8836, --Arthas' Tears
    108334, --Arthas' Tears Petal
    8831, --Purple Lotus
    108333, --Purple Lotus Petal
    4625, --Firebloom
    108332, --Firebloom Petal
    8153, --Wildvine
    3819, --Dragon's Teeth
    108329, --Dragon's Teeth Stem
    3358, --Khadgar's Whisker
    108326, --Khadgar's Whisker Stem
    3821, --Goldthorn
    108331, --Goldthorn Bramble
    3818, --Fadeleaf
    108328, --Fadeleaf Petal
    3357, --Liferoot
    3356, --Kingsblood
    3355, --Wild Steelbloom
    3369, --Grave Moss
    2453, --Bruiseweed
    3820, --Stranglekelp
    2450, --Briarthorn
    2452, --Swiftthistle
    785, --Mageroyal
    2449, --Earthroot
    765, --Silverleaf
    2447} --Peacebloom
DatabaseIDs[CLASSIC_ID][TRADE_GOODS_ID][T_JEWELCRAFTING_ID] = {
    12363, -- Arcane Crystal
    12800, -- Azerothian Diamond
    12364, -- Huge Emerald
    12361, -- Blue Sapphire
    12799, -- Large Opal
    7910, -- Star Ruby
    11382, -- Blood of the Mountain
    7909, -- Aquamarine
    3864, -- Citrine
    7971, -- Black Pearl
    13926, -- Golden Pearl
    1529, -- Jade
    1705, -- Lesser Moonstone
    1206, -- Moss Agate
    5500, -- Iridescent Pearl
    1210, -- Shadowgem
    818, -- Tigerseye
    5498, -- Small Lustrous Pearl
    774} -- Malachite
DatabaseIDs[CLASSIC_ID][TRADE_GOODS_ID][T_LEATER_ID] = {
    20381, -- Dreamscale
    15410, -- Scale of Onyxia
    17012, -- Core Leather
    19767, -- Primal Bat Leather
    19768, -- Primal Tiger Leather
    15414, -- Red Dragonscale
    15408, -- Heavy Scorpid Scale
    12810, -- Enchanted Leather
    15416, -- Black Dragonscale
    8171, -- Rugged Hide
    15407, -- Cured Rugged Hide
    15412, -- Green Dragonscale
    8170, -- Rugged Leather
    15417, -- Devilsaur Leather
    15419, -- Warbear Leather
    15415, -- Blue Dragonscale
    8154, -- Scorpid Scale
    8165, -- Worn Dragonscale
    8168, -- Jet Black Feather
    4304, -- Thick Leather
    8150, -- Deeprock Salt
    8169, -- Thick Hide
    8172, -- Cured Thick Hide
    5785, -- Thick Murloc Scale
    8167, -- Turtle Scale
    4234, -- Heavy Leather
    4235, -- Heavy Hide
    4236, -- Cured Heavy Hide 
    4461, -- Raptor Hide
    2319, -- Medium Leather
    4232, -- Medium Hide
    4233, -- Cured Medium Hide
    5784, -- Slimy Murloc Scale
    783, -- Light Hide
    2318, -- Light Leather
    4231, -- Cured Light Hide
    4289, -- Salt
    5082, -- Thin Kodo Leather
    2934, -- Ruined Leather Scraps
    6470, -- Deviate Scale
    6471, -- Perfect Deviate Scale
    7286, -- Black Whelp Scale
    7392, -- Green Whelp Scale
    5116, -- Long Tail Feather
    15409} -- Refined Deeprock Salt
DatabaseIDs[CLASSIC_ID][TRADE_GOODS_ID][T_METAL_STONE_ID] = {
    17203, -- Sulfuron Ingot
    18562, -- Elementium Ingot
    18567, -- Elemental Flux
    12809, -- Guardian Stone
    12655, -- Enchanted Thorium Bar
    12360, -- Arcanite Bar
    11370, -- Dark Iron Ore
    11371, -- Dark Iron Bar
    12359, -- Thorium Bar
    6037, -- Truesilver Bar
    12644, -- Dense Grinding Stone
    12365, -- Dense Stone
    3858, -- Mithril Ore
    108300, -- Mithril Ore Nugget
    3860, -- Mithril Bar
    10620, -- Thorium Ore
    108298, -- Thorium Ore Nugget
    7911, -- Truesilver Ore
    108299, -- Truesilver Ore Nugget
    3859, -- Steel Bar
    7912, -- Solid Stone
    7966, -- Solid Grinding Stone
    3577, -- Gold Bar
    2772, -- Iron Ore
    108297, -- Iron Ore Nugget
    3575, -- Iron Bar
    3857, -- Coal
    2776, -- Gold Ore
    108296, -- Gold Ore Nugget
    3486, -- Heavy Grinding Stone
    2838, -- Heavy Stone
    2771, -- Tin Ore
    108295, -- Tin Ore Nugget
    2841, -- Bronze Bar
    3478, -- Coarse Grinding Stone
    3576, -- Tin Bar
    2836, -- Coarse Stone
    2775, -- Silver Ore
    108294, -- Silver Ore Nugget
    2842, -- Silver Bar
    2770, -- Copper Ore
    2840, -- Copper Bar
    3470, -- Rough Grinding Stone
    2835, -- Rough Stone
    22202, -- Small Obsidian Shard
    22203} -- Large Obsidian Shard

-- Database: Expansion Idependent Categories
DatabaseIDs[PET_ID] = {116415} -- Pet Charm
DatabaseIDs[PET_ID][PET_BATTLE_STONE_ID] = {
        92742, -- Polished Battle-Stone
        98715, -- Marked Flawless Battle-Stone
        92679, -- Flawless Aquatic Battle-Stone
        92683, -- Flawless Dragonkin Battle-Stone
        92682, -- Flawless Humanoid Battle-Stone
        92681, -- Flawless Undead Battle-Stone
        92675, -- Flawless Beast Battle-Stone
        92665, -- Flawless Elemental Battle-Stone
        92678, -- Flawless Magic Battle-Stone
        92741, -- Flawless Battle-Stone
        92676, -- Flawless Critter Battle-Stone
        92677, -- Flawless Flying Battle-Stone
        92680} -- Flawless Mechanical Battle-Stone
DatabaseIDs[PET_ID][PET_CONSUMABLE_ID] = {
        86143, -- Battle Pet Bandage
        71153, -- Magical Pet Biscuit
        98114, -- Pet Treat
        89139, -- Chain Pet Leash
        43626, -- Happy Pet Snack
        37431, -- Fetch Ball
        89906, -- Magical Mini-Treat
        43352, -- Pet Grooming Kit
        37460, -- Rope Pet Leash
        44820} -- Red Ribbon Pet Leash
DatabaseIDs[PET_ID][PET_SUPPLIES_ID] = {
        122535, -- Traveler's Pet Supplies
        91086, -- Darkmoon Pet Supplies
        116062, -- Greater Darkmoon Pet Supplies
        98095, -- Brawler's Pet Supplies
        93146, -- Pandaren Spirit Pet Supplies
        93147, -- Pandaren Spirit Pet Supplies
        93148, -- Pandaren Spirit Pet Supplies
        93149, -- Pandaren Spirit Pet Supplies
        89125, -- Sack of Pet Supplies
        144345, -- Pile of Pet Goodies
        118697, -- Big Bag of Pet Supplies
        94207, -- Fabled Pandaren Pet Supplies
        127751} -- Fel-Touched Pet Supplies
DatabaseIDs[PET_ID][PET_TRAINING_STONE_ID] = {
        122457, -- Ultimate Battle-Training Stone
        127755, -- Fel-Touched Battle-Training Stone
        116374, -- Beast Battle-Training Stone
        116423, -- Undead Battle-Training Stone
        116418, -- Critter Battle-Training Stone
        116419, -- Dragonkin Battle-Training Stone
        116420, -- Elemental Battle-Training Stone
        116421, -- Flying Battle-Training Stone
        116416, -- Humanoid Battle-Training Stone
        116422, -- Magic Battle-Training Stone
        116417, -- Mechanical Battle-Training Stone
        116424} -- Aquatic Battle-Training Stone

local function ItemsIDs_Init(filter, flagsSplit, flagForces)
    print("-------------------- PROCESSANDO --------------------")
    local result = {}

    local function AddToSet(set, list, label)
        if list then
            for _, v in ipairs(list) do
                set[v] = label
            end
        end
    end

    local function AddToExpansion(list, expansion)
        if filter.db.profile.flagExpansionPrefix then
            if list then
                for _, v in ipairs(list) do
                    ItemsExpansionIDs[v] = expansion
                end
            end
        end
    end

    for numero, expansao in ipairs(EXPANSIONS_LIST) do

        local organizarPorExpansao = false
        local organizarPorExpansaoForcada = false
        local organizarPorAntigos = false
        local organizarPorAntigosForcado = false

        if filter.db.profile.flagOrganizeByExpansion[expansao] then
            organizarPorExpansao = true
            if filter.db.profile.flagForceOrganizeByExpansion then
                organizarPorExpansaoForcada = true
            end
        elseif filter.db.profile.flagOldExpansions[expansao] then
            organizarPorAntigos = true
            if filter.db.profile.flagForceOldExpansions then
                organizarPorAntigosForcado = true
            end
        end

        local categoriasDaExpansao = getAddedArray(CATEGORY_LIST, EXPANSION_SPECIFIC_SUBCATEGORY[expansao])
        for numbero_categoria, categoria in ipairs(categoriasDaExpansao) do

            local IDCategoria = nil
            local IDCategoriaComExpansao = false

            if flagForces[categoria] then
                IDCategoria = categoria
                IDCategoriaComExpansao = true
            elseif organizarPorExpansaoForcada then
                IDCategoria = expansao
            elseif organizarPorAntigosForcado then
                IDCategoria = OLD_EXPANSIONS_ID
            elseif organizarPorExpansao then
                IDCategoria = expansao
            elseif organizarPorAntigos then
                IDCategoria = OLD_EXPANSIONS_ID
            else
                IDCategoria = categoria
                IDCategoriaComExpansao = true
            end

            if IDCategoriaComExpansao then
                AddToExpansion(DatabaseIDs[expansao][categoria], expansao)
            end
            --print("Expansão: " .. Label_Text[expansao] .. ", categoria: " .. Label_Text[categoria] .. ", adicionada em: " .. Label_Text[IDCategoria])
            AddToSet(result, DatabaseIDs[expansao][categoria], IDCategoria)

            if CATEGORY_HAS_SUBCATEGORY[categoria] then
                for numero_subcategoria, subcategoria in ipairs(CATEGORY_HAS_SUBCATEGORY[categoria]) do

                    local IDSubCategoria = nil
                    local IDSubCategoriaComExpansao = false

                    if flagForces[subcategoria] then
                        IDSubCategoria = subcategoria
                        IDSubCategoriaComExpansao = true
                    elseif flagForces[categoria] then
                        if flagsSplit[categoria] and flagsSplit[categoria][subcategoria] then
                            IDSubCategoria = subcategoria
                        else
                            IDSubCategoria = categoria
                        end
                        IDSubCategoriaComExpansao = true
                    elseif organizarPorExpansaoForcada then
                        IDSubCategoria = expansao
                    elseif organizarPorAntigosForcado then
                        IDSubCategoria = OLD_EXPANSIONS_ID
                    elseif flagsSplit[categoria] and flagsSplit[categoria][subcategoria] then
                        IDSubCategoria = subcategoria
                        IDSubCategoriaComExpansao = true
                    elseif organizarPorExpansao then
                        IDSubCategoria = expansao
                    elseif organizarPorAntigos then
                        IDSubCategoria = OLD_EXPANSIONS_ID
                    else
                        IDSubCategoria = categoria
                        IDSubCategoriaComExpansao = true
                    end

                    if IDSubCategoriaComExpansao then
                        AddToExpansion(DatabaseIDs[expansao][categoria][subcategoria], expansao)
                    end
                    --print("Expansão: " .. Label_Text[expansao] .. ", categoria: " .. Label_Text[subcategoria] .. ", adicionada em: " .. Label_Text[IDSubCategoria])
                    AddToSet(result, DatabaseIDs[expansao][categoria][subcategoria], IDSubCategoria)

                    if CATEGORY_HAS_SUBCATEGORY[subcategoria] then
                        for numero_divisao_subcategoria, divisao_subcategoria in ipairs(CATEGORY_HAS_SUBCATEGORY[subcategoria]) do

                            local IDDivisaoSubCategoria = nil
                            local IDDivisaoSubCategoriaComExpansao = false

                            if flagForces[divisao_subcategoria] then
                                IDDivisaoSubCategoria = divisao_subcategoria
                                IDDivisaoSubCategoriaComExpansao = true
                            elseif flagForces[subcategoria] then
                                if flagsSplit[subcategoria] and flagsSplit[subcategoria][divisao_subcategoria] then
                                    IDDivisaoSubCategoria = divisao_subcategoria
                                else
                                    IDDivisaoSubCategoria = subcategoria
                                end
                                IDDivisaoSubCategoriaComExpansao = true
                            elseif flagForces[categoria] then
                                if flagsSplit[categoria] and flagsSplit[categoria][subcategoria] then
                                    IDDivisaoSubCategoria = subcategoria
                                else
                                    IDDivisaoSubCategoria = categoria
                                end
                                IDDivisaoSubCategoriaComExpansao = true
                            elseif organizarPorExpansaoForcada then
                                IDDivisaoSubCategoria = expansao
                            elseif organizarPorAntigosForcado then
                                IDDivisaoSubCategoria = OLD_EXPANSIONS_ID
                            elseif flagsSplit[subcategoria] and flagsSplit[subcategoria][divisao_subcategoria] then
                                IDDivisaoSubCategoria = divisao_subcategoria
                                IDDivisaoSubCategoriaComExpansao = true
                            elseif flagsSplit[categoria] and flagsSplit[categoria][subcategoria] then
                                IDDivisaoSubCategoria = subcategoria
                                IDDivisaoSubCategoriaComExpansao = true
                            elseif organizarPorExpansao then
                                IDDivisaoSubCategoria = expansao
                            elseif organizarPorAntigos then
                                IDDivisaoSubCategoria = OLD_EXPANSIONS_ID
                            else
                                IDDivisaoSubCategoria = categoria
                                IDDivisaoSubCategoriaComExpansao = true
                            end

                            if IDDivisaoSubCategoriaComExpansao then
                                AddToExpansion(DatabaseIDs[expansao][categoria][subcategoria], expansao)
                            end
                            --print("Expansão: " .. Label_Text[expansao] .. ", categoria: " .. Label_Text[divisao_subcategoria] .. ", adicionada em: " .. Label_Text[IDDivisaoSubCategoria])
                            AddToSet(result, DatabaseIDs[expansao][categoria][subcategoria][divisao_subcategoria], IDDivisaoSubCategoria)
                        end
                    end
                end
            end
        end
    end
    for number_expansion_idependent, expansion_idependent in ipairs(EXPANSION_IDEPENDENDT_CATEGORY_LIST) do
        AddToSet(result, DatabaseIDs[expansion_idependent], expansion_idependent)
        if CATEGORY_HAS_SUBCATEGORY[expansion_idependent] then
            for number_category, category in ipairs(CATEGORY_HAS_SUBCATEGORY[expansion_idependent]) do
                if flagsSplit[expansion_idependent] and flagsSplit[expansion_idependent][category] then
                    AddToSet(result, DatabaseIDs[expansion_idependent][category], category)
                else
                    AddToSet(result, DatabaseIDs[expansion_idependent][category], expansion_idependent)
                end
            end
        end
    end
    return result
end

local generalFilter = AdiBags:RegisterFilter(FILTER_NAME, 95)
generalFilter.uiName = FILTER_NAME
generalFilter.uiDesc = FILTER_DESCRIPTIONS

function generalFilter:OnInitialize()
    self.db = AdiBags.db:RegisterNamespace(FILTER_NAME, {
        profile = {
            flagExpansionPrefix = false,
            flagForceOrganizeByExpansion = true,
            flagOrganizeByExpansion = {true},
            flagForceOldExpansions = true,
            flagOldExpansions = {true},
            flagTradeGoodsSplit = {true},
            flagCookingSplit = {true},
            flagPetSplit = {true},
            flagForceSubcategories = {true},
            flagGarrisonSplit = {true},
            flagAshranSplit = {true},
        },
        char = {},
    })
end

function generalFilter:Update()
  ItemsIDs = nil
  ItemsExpansionIDs = {}
  self:SendMessage('AdiBags_FiltersChanged')
end

function generalFilter:OnEnable()
  AdiBags:UpdateFilters()
end

function generalFilter:OnDisable()
  AdiBags:UpdateFilters()
end

function generalFilter:Filter(slotData)
    ItemsIDs = ItemsIDs or ItemsIDs_Init(self, 
        {
            [TRADE_GOODS_ID] = self.db.profile.flagTradeGoodsSplit,
            [GARRISON_ID] = self.db.profile.flagGarrisonSplit,
            [T_COOKING_ID] = self.db.profile.flagCookingSplit,
            [PET_ID] = self.db.profile.flagPetSplit,
            [ASHRAN_ID] = self.db.profile.flagAshranSplit,
        }, self.db.profile.flagForceSubcategories
    )

    if ItemsIDs[slotData.itemId] then
        -- print(slotData.name)
        if self.db.profile.flagExpansionPrefix and Label_Expansions_Text[ItemsExpansionIDs[slotData.itemId]] then
            -- print("nome: " .. Label_Expansions_Text[ItemsExpansionIDs[slotData.itemId]]  .. ": " .. Label_Text[ItemsIDs[slotData.itemId]])
            return Label_Expansions_Text[ItemsExpansionIDs[slotData.itemId]]  .. ": " .. Label_Text[ItemsIDs[slotData.itemId]]
        else
            -- print("nome: " .. Label_Text[ItemsIDs[slotData.itemId]])
            return Label_Text[ItemsIDs[slotData.itemId]]
        end
    end
end

function generalFilter:GetOptions()

    local EXPANSION_PREFIX_TEXT = 'Expansion prefix'
    local EXPANSION_PREFIX_DESC = 'Displays prefix of expansion before category name'
    local ORGANIZE_BY_EXPANSION_TEXT = 'Organize by expansion'
    local ORGANIZE_BY_EXPANSION_DESC = 'Group items according to the expansion that have been released'
    local FORCE_ORGANIZE_BY_EXPANSION_TEXT = 'Force the organization by expansion'
    local FORCE_ORGANIZE_BY_EXPANSION_DESC = 'Force grouping items so that they are sorted according to the expansion'
    local OLD_EXPANSION_TEXT = 'Set as: Old expansion'
    local OLD_EXPANSION_DESC = 'Groups items from the following expansions as: Old expansion'
    local FORCE_OLD_EXPANSION_TEXT = 'Force Old expansion group'
    local FORCE_OLD_EXPANSION_DESC = 'Force grouping from the following expansions as: Old expansion'
    local FORCE_SUBCATEGORIES_TEXT = 'Force subgroup'
    local FORCE_SUBCATEGORIES_DESC = 'This category will stay in a separate group (takes precedence over all other forcing tags)'
    local SPLIT_TEXT = 'Split: '
    local SUBCATEGORIES_DESC = 'Includes the following subcategories in the main filter'
    local SPLIT_SUBCATEGORIES_DESC = 'Divides the following subcategories into specific filters'

    return {
        flagExpansionPrefix = {
            name  = EXPANSION_PREFIX_TEXT,
            desc  = EXPANSION_PREFIX_DESC,
            type  = 'toggle',
            width = 'double',
            order = 01},
        flagForceOrganizeByExpansion = {
            name  = FORCE_ORGANIZE_BY_EXPANSION_TEXT,
            desc  = FORCE_ORGANIZE_BY_EXPANSION_DESC,
            type  = 'toggle',
            width = 'double',
            order = 05},
        flagOrganizeByExpansion = {
            name = ORGANIZE_BY_EXPANSION_TEXT,
            desc = ORGANIZE_BY_EXPANSION_DESC,
            type = 'multiselect',
            order = 06,
            values = {
                [CLASSIC_ID] = Label_Text[CLASSIC_ID],
                [THE_BURNING_CRUSADE_ID] = Label_Text[THE_BURNING_CRUSADE_ID],
                [WRATH_OF_THE_LICH_KING_ID] = Label_Text[WRATH_OF_THE_LICH_KING_ID],
                [CATACLYSM_ID] = Label_Text[CATACLYSM_ID],
                [MISTS_OF_PANDARIA_ID] = Label_Text[MISTS_OF_PANDARIA_ID],
                [WARLORDS_OF_DRAENOR_ID] = Label_Text[WARLORDS_OF_DRAENOR_ID],
                [LEGION_ID] = Label_Text[LEGION_ID],
                [BATTLE_FOR_AZEROTH_ID] = Label_Text[BATTLE_FOR_AZEROTH_ID],
            }},
        flagForceOldExpansions = {
            name  = FORCE_OLD_EXPANSION_TEXT,
            desc  = FORCE_OLD_EXPANSION_DESC,
            type  = 'toggle',
            width = 'double',
            order = 07},
        flagOldExpansions = {
            name = OLD_EXPANSION_TEXT,
            desc = OLD_EXPANSION_DESC,
            type = 'multiselect',
            order = 08,
            values = {
                [CLASSIC_ID] = Label_Text[CLASSIC_ID],
                [THE_BURNING_CRUSADE_ID] = Label_Text[THE_BURNING_CRUSADE_ID],
                [WRATH_OF_THE_LICH_KING_ID] = Label_Text[WRATH_OF_THE_LICH_KING_ID],
                [CATACLYSM_ID] = Label_Text[CATACLYSM_ID],
                [MISTS_OF_PANDARIA_ID] = Label_Text[MISTS_OF_PANDARIA_ID],
                [WARLORDS_OF_DRAENOR_ID] = Label_Text[WARLORDS_OF_DRAENOR_ID],
                [LEGION_ID] = Label_Text[LEGION_ID],
                [BATTLE_FOR_AZEROTH_ID] = Label_Text[BATTLE_FOR_AZEROTH_ID],
            }},
        flagTradeGoodsSplit = {
            name = SPLIT_TEXT .. Label_Text[TRADE_GOODS_ID],
            desc = SPLIT_SUBCATEGORIES_DESC,
            type = 'multiselect',
            order = 10,
            values = {
                [T_CLOTH_ID] = Label_Text[T_CLOTH_ID],
                [T_ELEMENTAL_ID] = Label_Text[T_ELEMENTAL_ID],
                [T_ENCHANTING_ID] = Label_Text[T_ENCHANTING_ID],
                [T_HERBS_ID] = Label_Text[T_HERBS_ID],
                [T_JEWELCRAFTING_ID] = Label_Text[T_JEWELCRAFTING_ID],
                [T_LEATER_ID] = Label_Text[T_LEATER_ID],
                [T_METAL_STONE_ID] = Label_Text[T_METAL_STONE_ID],
                [T_COOKING_ID] = Label_Text[T_COOKING_ID],
                [T_FISHING_ID] = Label_Text[T_FISHING_ID],
            }},
        flagCookingSplit = {
            name = SPLIT_TEXT .. Label_Text[T_COOKING_ID],
            desc = SPLIT_SUBCATEGORIES_DESC,
            type = 'multiselect',
            order = 30,
            values = {
                [T_ANIMAL_ID] = Label_Text[T_ANIMAL_ID],
                [T_EGG_ID] = Label_Text[T_EGG_ID],
                [T_FISH_ID] = Label_Text[T_FISH_ID],
            }},
        flagPetSplit = {
            name = SPLIT_TEXT .. Label_Text[PET_ID],
            desc = SPLIT_SUBCATEGORIES_DESC,
            type = 'multiselect',
            order = 56,
            values = {
                [PET_BATTLE_STONE_ID] = Label_Text[PET_BATTLE_STONE_ID],
                [PET_CONSUMABLE_ID] = Label_Text[PET_CONSUMABLE_ID],
                [PET_SUPPLIES_ID] = Label_Text[PET_SUPPLIES_ID],
                [PET_TRAINING_STONE_ID] = Label_Text[PET_TRAINING_STONE_ID],
            }},
        flagForceSubcategories = {
            name = FORCE_SUBCATEGORIES_TEXT,
            desc = FORCE_SUBCATEGORIES_DESC,
            type = 'multiselect',
            order = 56,
            values = {
                [GARRISON_ID] = Label_Text[GARRISON_ID],
                [ASHRAN_ID] = Label_Text[ASHRAN_ID],
            }},
        flagGarrisonSplit = {
            name = SPLIT_TEXT .. Label_Text[GARRISON_ID],
            desc = SPLIT_SUBCATEGORIES_DESC,
            type = 'multiselect',
            order = 56,
            values = {
                [GARRISON_BLUEPRINTS_ID] = Label_Text[GARRISON_BLUEPRINTS_ID],
                [GARRISON_FOLLOWERS_ID] = Label_Text[GARRISON_FOLLOWERS_ID],
                [GARRISON_IRONHORDE_ID] = Label_Text[GARRISON_IRONHORDE_ID],
                [GARRISON_MINING_ID] = Label_Text[GARRISON_MINING_ID],
                [GARRISON_SHIPYARD_ID] = Label_Text[GARRISON_SHIPYARD_ID],
                [GARRISON_WORKORDERS_ID] = Label_Text[GARRISON_WORKORDERS_ID],
            }},
        flagAshranSplit = {
            name = SPLIT_TEXT .. Label_Text[ASHRAN_ID],
            desc = SPLIT_SUBCATEGORIES_DESC,
            type = 'multiselect',
            order = 56,
            values = {
                [ASHRAN_ID] = Label_Text[ASHRAN_ID],
                [ASHRAN_BOOKS_ID] = Label_Text[ASHRAN_BOOKS_ID],
            }},
    }, AdiBags:GetOptionHandler(self, false, function() return self:Update() end)
end