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
    [WEAPONS_ID] = 'Weapons',
    [ARMOR_ID] = 'Armors',
    [CONTAINERS_ID] = 'Containers',
    [CONSUMABLES_ID] = 'Consumables',
    [GLYPHS_ID] = 'Glyphs',
    [TRADE_GOODS_ID] = 'Trade Goods',
    [RECIPES_ID] = 'Recipes',
    [GEMS_ID] = 'Gems',
    [MISCELLANEOUS_ID] = 'Miscellaneous',
    [CURRENCY_ID] = 'Currency',
    [QUEST_ID] = 'Quest',
    [KEYS_ID] = 'Keys',

    -- consumable category
    [C_BANDAGES_ID] = 'Bandages',
    [C_CONSUMABLES_ID] = 'Consumables',
    [C_ELIXIRS_ID] = 'Elixirs',
    [C_FLASKS_ID] = 'Flasks',
    [C_FOOD_DRINKS_ID] = 'Food & Drinks',
    [C_ITEM_ENHANCEMENTS_ID] = 'Item Enchantments',
    [C_POTIONS_ID] = 'Potions',
    [C_SCROLLS_ID] = 'Scrolls',
    [C_OTHER_ID] = 'Other',

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
    [R_BOOKS_ID] = 'Books',
    [R_ALCHEMY_ID] = 'Alchemy',
    [R_BLACKSMITHING_ID] = 'Blacksmithing',
    [R_COOKING_ID] = 'Cooking',
    [R_ENCHANTING_ID] = 'Enchanting',
    [R_ENGINEERING_ID] = 'Engineering',
    [R_FIRST_AID_ID] = 'First Aid',
    [R_FISHING_ID] = 'Fishing',
    [R_INSCRIPTIONS_ID] = 'Inscriptions',
    [R_JEWELCRAFTING_ID] = 'Jewelcrafting',
    [R_LEATHERWORKING_ID] = 'Leatherworking',
    [R_MINING_ID] = 'Mining',
    [R_TAILORING_ID] = 'Tailoring',

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
    [P_RIDING_ID] = 'Riding',

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
            end 34
        end
    end
end

-- Database: Legion
DatabaseIDs[LEGION_ID][CONSUMABLES_ID][C_BANDAGES_ID] = {
    133942, -- Silkweave Splint
    136653, -- Silvery Salve
    142332, -- Feathered Luffa
    143636, -- Arcane Splint
    133940, -- Silkweave Bandage
    129096, -- Battle-Mender's Dressing
    146971} -- Yseralline Poultice
DatabaseIDs[LEGION_ID][CONSUMABLES_ID][C_ELIXIRS_ID] = {
    147868, -- Elixir of Greatest Demonslaying
    151609, -- Tears of the Naaru
    128437, -- Potion of Bubbling Pustules
    128708, -- Molted Feather
    128805, -- Potion of Fel Protection
    128404, -- Helbrim's Special
    128912, -- Blight Sample
    132176, -- Thunder Special
    132178, -- Battleguard's Sharpening Stone
    151608, -- Lightblood Elixir
    128810} -- Jar of Spiders
DatabaseIDs[LEGION_ID][CONSUMABLES_ID][C_FLASKS_ID] = {
    127847, -- Flask of the Whispered Pact
    127848, -- Flask of the Seventh Demon
    127849, -- Flask of the Countless Armies
    127850, -- Flask of Ten Thousand Scars
    127858} -- Spirit Flask
DatabaseIDs[LEGION_ID][CONSUMABLES_ID][C_FOOD_DRINKS_ID] = {
    138983, -- Kurd's Soft Serve
    128764, -- Moist Azsunian Feta
    128835, -- Highmountain Fry Bread
    128838, -- Foxberries
    128840, -- Honey-Glazed Ham
    128841, -- Highmountain Tiswin
    128842, -- Tideskorn Mead Ale
    128844, -- Dried Mango
    128846, -- Tiramisu
    128847, -- Lovingly Crafted Carrot Cake
    128849, -- Scallion Kimchi
    128850, -- Chilled Conjured Water
    133565, -- Leybeque Ribs
    133566, -- Suramar Surf and Turf
    133567, -- Barracuda Mrglgagh
    133568, -- Koi-Scented Stormray
    133569, -- Drogbar-Style Salmon
    133570, -- The Hungry Magister
    133571, -- Azshari Salad
    133572, -- Nightborne Delicacy Platter
    133573, -- Seed-Battered Fish Plate
    133574, -- Fishbrul Special
    133575, -- Dried Mackerel Strips
    133576, -- Bear Tartare
    133577, -- Fighter Chow
    133578, -- Hearty Feast
    133579, -- Lavish Suramar Feast
    133681, -- Crispy Bacon
    136544, -- Gjetost Slice
    136545, -- Skolag Worm Dumpling
    136546, -- Fresh Crawler Salad
    136547, -- Deep Sea Queenfish Cakes
    136548, -- Dried Barracuda Chips
    136549, -- Airy Biscuits
    136550, -- Deepearth Root Straws
    136551, -- Elderhorn Jerky
    136552, -- Sablehorn Steak Tartare
    136553, -- Azsunian Raisins
    136554, -- Lingonberry Fruit Leather
    136555, -- Standard Issue Rations
    136557, -- Passionfruit Tart
    136558, -- Carefully Wrapped Cupcake
    136559, -- Imp Chip Cookie
    136560, -- Condensed Mana Sparks
    136806, -- Glass of Arcwine
    138290, -- Grilled Mini Rays
    138291, -- Tart Green Apple
    138292, -- Ley-Enriched Water
    138294, -- Sea Breeze
    138295, -- Farondis Royal Red
    138978, -- High Fiber Gouda
    138982, -- Pail of Warm Milk
    128834, -- Bradensbrook Gorse Wine
    138986, -- Kurdos Yogurt
    139345, -- Rat Hands
    139347, -- Underjelly
    140184, -- Good Batch of Fruit
    140187, -- First Year Blue
    140188, -- Second Year Blue
    140189, -- Third Year Blue
    140204, -- 'Bottled' Ley-Enriched Water
    140205, -- 'Fresh' Moist Azsunian Feta
    140206, -- Grilled 'Wild' Mini Rays
    140207, -- 'Free-Range' Honey-Glazed Ham
    140265, -- Legendermainy Light Roast
    140266, -- Kafa Kicker
    140269, -- Iced Highmountain Refresher
    140271, -- Valarjar Java
    140272, -- Suramar Spiced Tea
    140273, -- Honey Croissant
    140275, -- Val'sharah Berry Pie
    140286, -- Nightbites
    140296, -- Gummy Wyrm
    140297, -- Shal'dorice Cream
    140298, -- Mananelle's Sparkling Cider
    140299, -- Magistrix Mix
    140300, -- Fresh Arcfruit
    140301, -- Mana Biscuit
    140302, -- Arcway Bisque
    140627, -- Rockbites
    140629, -- Bottled Maelstrom
    140631, -- Nightpear
    140679, -- NeverMelt Ice Cream
    141206, -- Slice of Night Delight
    141207, -- J'llah Suspension
    141208, -- Midnight Morel
    141209, -- Distilled Nightwine
    141210, -- Warm Nightpear Cider
    141211, -- Arcfruit Sangree
    141212, -- Mana-Poached Egg
    141213, -- Candied Sandpiper Eggs
    141214, -- Mana-Eel Eggs
    141215, -- Arcberry Juice
    142334, -- Spiced Falcosaur Omelet
    143633, -- Masterful Mana Buns
    143634, -- Critical Catfish
    143635, -- Hasty Hummus
    143681, -- Slightly Burnt Food
    151775, -- Nutrient Condensate
    152717, -- Azuremyst Water Flask
    152718, -- Thrice-Baked Ammen Loaf
    152998, -- Carefully Hidden Muffin
    153192, -- Sunglow
    128833, -- Kaldorei Ginger Wine
    128761, -- Azsunian Olives
    128763, -- Pungent Vrykul Gamalost
    128836, -- Barley Bread
    128837, -- Dried Bilberries
    128839, -- Smoked Elderhorn
    128843, -- Azsunian Grapes
    128845, -- Sweet Rice Cake
    128848, -- Roasted Maize
    128853, -- Highmountain Spring Water
    133557, -- Salt & Pepper Shank
    133561, -- Deep-Fried Mossgill
    133562, -- Pickled Stormray
    133563, -- Faronaar Fizz
    133564, -- Spiced Rib Roast
    136556, -- Legion Spoiling Ration
    136561, -- Inferno Punch
    136562, -- Deep Sea Spirit
    136563, -- Pocket Warmed Arkhi
    136564, -- Runewood Akvavit
    136565, -- Fermented Melon Juice
    136566, -- Mariner's Grog
    136567, -- Azuregale Carricante
    136568, -- Black Rook Stout
    138285, -- Blue-Tail Bites
    138972, -- Bilberry Preserves
    138973, -- Pungent and Moldy Gamalost
    138974, -- Charcoaled Elderhorn
    138975, -- Highmountain Runoff
    138976, -- Stale Thundertotem Rice Cake
    138977, -- Thundertotem Rice Cake
    138979, -- Spicy Sharp Cheddar
    138980, -- Butterhoof Singles
    138981, -- Skinny Milk
    138987, -- Butterhoof Can't Believe It's Butter
    139344, -- Mana Banana
    139346, -- Thuni's Patented Drinking Fluid
    140201, -- 'Organic' Azsunian Grapes
    140202, -- Smoked 'Grass Fed' Elderhorn
    140203, -- 'Natural' Highmountain Spring Water
    140276, -- Dalaran Rice Pudding
    140626, -- Frosted Mini-Brans
    140628, -- Lavacolada
    140668, -- Meaty Racks of Musken Ribs
    141527, -- Slightly Rusted Canteen
    151774, -- Distilled Voidblend
    113099, -- Shadowcap Mushrooms
    124036, -- Juicy Apple
    130259, -- Ancient Bandana
    132752, -- Illidari Rations
    132753, -- Legion Rations
    133586, -- Illidari Waterskin
    133893, -- Darkpit Mushroom Burger
    133979, -- Grilled Snail
    133980, -- Murky Cavewater
    133981, -- Raw Cavescale
    135557, -- Inferno Curry Crab Legs
    138874, -- Crackling Shards
    140355, -- Laden Apple
    129179, -- Fighter Chow
    133989, -- Homebrew Drog
    133988, -- "Sessionable" Drog
    140343, -- Exotic Squirmy Delight
    140340, -- Bottled - Carbonated Water
    140341, -- Wild Poached Emperor Salmon
    152558, -- Cherry Pie Slice
    140344, -- Preserved Pickled Egg
    140342, -- Lean - Mok'Nathal Shortribs
    140339, -- Hormone Free - Alterac Swiss
    142323, -- Puncher's Punch
    142322, -- Knockout
    142324, -- Brawler's Lager
    140753, -- Half Eaten Candy Bar
    140754, -- Soggy Waffle Cone
    145272, -- Sparkling Snowplum Brandy
    147669, -- Half an Animal Biscuit
    140338, -- Mana-Wrapped Goretusk Liver Pie
    133983, -- Mammoth Milk
    137613, -- Hearty Steak
    152564, -- Feast of the Fishes
    138731, -- Bushel of Apples
    138966, -- Mountain Berries
    140337, -- Imported Tough Jerky
    144409, -- Entangling Rootbeer
    144410, -- Barrel-Aged Stormstout
    144411, -- Sargeras Sangria
    144412, -- Mechs on the Beach
    144413, -- Wiley's Wicked Ale
    144414, -- Liquid Qiraj
    144415, -- Coilfang Reserve
    144416, -- Rocket Fuel
    144417, -- Blackout Kick
    144418, -- Stormwind Stout
    144419, -- Grunt's Grog
    144420, -- Earl Greymane, Hot
    144421, -- Silvermoon Squeeze
    144422, -- Nomi's Fire Whiskey
    144423, -- Crash Landing
    144424, -- Blood and Thunder
    144425, -- Magni's Beard
    144426, -- Wild Murky
    144427, -- Blood Red Ale
    144428, -- Mulgore Mule
    144429, -- Kungaloosh
    147774, -- Hunk of Mystery Meat
    147776, -- "Killer" Brew
    147777, -- P.B.R.
    151121, -- Booty Bay Bilgewater
    151122, -- Stolen Coconut Rum
    151123, -- Smuggled Dalaran Red
    151124, -- South Seas Moonshine
    137618, -- Mountain Berries
    139398, -- Pant Loaf
    140352, -- Dreamberries
    128875, -- Rotten Flank
    146845, -- Arne's Green Winter Clothes BoA
    146846, -- Arne's Green Winter Clothes BoA -> BoE
    151133, -- Nomi Snacks
    140290, -- Seastrider Brew
    128851, -- Roasted Juicycrunch Carrots
    140256, -- Skysinger Brew
    140287, -- Stoutheart Brew
    140288, -- Bubblebelly Brew
    140289, -- Lungfiller Brew
    140253, -- Swiftpad Brew
    140291, -- Featherfoot Brew
    140292, -- Tumblerun Brew
    140295, -- Badgercharm Brew
    138478, -- Feast of Ribs
    138479} -- Potato Stew Feast
DatabaseIDs[LEGION_ID][CONSUMABLES_ID][C_ITEM_ENHANCEMENTS_ID] = {
    140219, -- Boon of the Bloodhunter
    128541, -- Enchant Ring - Binding of Critical Strike
    128543, -- Enchant Ring - Binding of Mastery
    128544, -- Enchant Ring - Binding of Versatility
    128548, -- Enchant Cloak - Binding of Strength
    128549, -- Enchant Cloak - Binding of Agility
    128550, -- Enchant Cloak - Binding of Intellect
    128551, -- Enchant Neck - Mark of the Claw
    128552, -- Enchant Neck - Mark of the Distant Army
    128553, -- Enchant Neck - Mark of the Hidden Satyr
    128554, -- Enchant Shoulder - Boon of the Scavenger
    128558, -- Enchant Gloves - Legion Herbalism
    128559, -- Enchant Gloves - Legion Mining
    128560, -- Enchant Gloves - Legion Skinning
    128561, -- Enchant Gloves - Legion Surveying
    140213, -- Boon of the Gemfinder
    140214, -- Boon of the Harvester
    140215, -- Boon of the Butcher
    140217, -- Boon of the Salvager
    140218, -- Boon of the Manaseeker
    128542, -- Enchant Ring - Binding of Haste
    141908, -- Enchant Neck - Mark of the Heavy Hide
    141909, -- Enchant Neck - Mark of the Trained Soldier
    141910, -- Enchant Neck - Mark of the Ancient Priestess
    144328, -- Boon of the Builder
    144346, -- Boon of the Zookeeper
    153197, -- Boon of the Steadfast
    153203, -- Ancient Fishing Line
    153247, -- Boon of the Lightbearer
    128546, -- Enchant Cloak - Word of Agility
    128537, -- Enchant Ring - Word of Critical Strike
    128539, -- Enchant Ring - Word of Mastery
    128540, -- Enchant Ring - Word of Versatility
    128545, -- Enchant Cloak - Word of Strength
    128538, -- Enchant Ring - Word of Haste
    128547, -- Enchant Cloak - Word of Intellect
    144304, -- Enchant Neck - Mark of the Master
    144305, -- Enchant Neck - Mark of the Versatile
    144306, -- Enchant Neck - Mark of the Quick
    144307} -- Enchant Neck - Mark of the Deadly
DatabaseIDs[LEGION_ID][CONSUMABLES_ID][C_POTIONS_ID] = {
    144398, -- Valorous Rage Potion
    147707, -- Repurposed Fel Focuser
    140351, -- Sunfruit
    127834, -- Ancient Healing Potion
    127835, -- Ancient Mana Potion
    127836, -- Ancient Rejuvenation Potion
    127843, -- Potion of Deadly Grace
    127844, -- Potion of the Old War
    127845, -- Unbending Potion
    127846, -- Leytorrent Potion
    136569, -- Aged Health Potion
    142117, -- Potion of Prolonged Power
    142325, -- Brawler's Ancient Healing Potion
    142326, -- Brawler's Potion of Prolonged Power
    144396, -- Valorous Healing Potion
    144397, -- Valorous Potion of Armor
    140347, -- Spirit Berries
    152615, -- Astral Healing Potion
    152619, -- Astral Mana Potion
    129196, -- Legion Healthstone
    130258, -- Pocket Friend
    129192, -- Inquisitor's Menacing Eye
    138486, -- "Third Wind" Potion
    138488, -- Saltwater Potion
    138727, -- Potion of Defiance
    138728, -- Potion of Trivial Invisibility
    144228, -- Dino Mojo
    143660, -- Mrgrglhjorn
    143542, -- Crown Co. "Kure-Everything" Tonic
    147445, -- Ancient Draught of Regeneration
    128814, -- Potion of Cowardly Flight
    131729, -- Zanzil's Slow Poison
    138729} -- Potion of Heightened Senses
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
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][CONSUMABLES_ID][C_BANDAGES_ID] = {
    111603, -- Antiseptic Bandage
    115497} -- Ashran Bandage
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][CONSUMABLES_ID][C_ELIXIRS_ID] = {
    116271, -- Draenic Water Breathing Elixir
    118711, -- Draenic Water Walking Elixir
    116274, -- Elixir of Detect Demon
    116273, -- Elixir of Dream Vision
    116272, -- Elixir of Detect Undead
    116270, -- Catseye Elixir
    116269} -- Elixir of Detect Lesser Invisibility
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][CONSUMABLES_ID][C_FLASKS_ID] = {
    109145, -- Draenic Agility Flask
    109147, -- Draenic Intellect Flask
    109148, -- Draenic Strength Flask
    109152, -- Draenic Stamina Flask
    109153, -- Greater Draenic Agility Flask
    109155, -- Greater Draenic Intellect Flask
    109156, -- Greater Draenic Strength Flask
    109160} -- Greater Draenic Stamina Flask
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][CONSUMABLES_ID][C_FOOD_DRINKS_ID] = {
    118270, -- O'ruk Orange
    111431, -- Hearty Elekk Steak
    111434, -- Pan-Seared Talbuk
    111436, -- Braised Riverbeast
    111437, -- Rylak Crepes
    111438, -- Clefthoof Sausages
    111439, -- Steamed Scorpion
    111441, -- Grilled Gulper
    111442, -- Sturgeon Stew
    111444, -- Fat Sleeper Cakes
    111445, -- Fiery Calamari
    111446, -- Skulker Chowder
    111447, -- Talador Surf and Turf
    111449, -- Blackrock Barbecue
    111450, -- Frosty Stew
    111452, -- Sleeper Surprise
    111453, -- Calamari Crepes
    111454, -- Gorgrond Chowder
    111455, -- Saberfish Broth
    111456, -- Grilled Saberfish
    111457, -- Feast of Blood
    111458, -- Feast of the Waters
    111544, -- Frostboar Jerky
    111842, -- Star Root Tuber
    113509, -- Conjured Mana Bun
    114238, -- Spiced Barbed Trout
    114982, -- Song Flower
    115351, -- "Rylak Claws"
    115352, -- Telmor-Aruuna Hard Cheese
    115353, -- Tanaan Sweetmelon
    115354, -- Sliced Zangar Buttons
    115355, -- Marbled Clefthoof Steak
    117439, -- "Da Bruisery" Hot & Wroth
    117440, -- Peglegger's Porter
    117442, -- Thunderbelly Mead
    117452, -- Gorgrond Mineral Water
    117454, -- Gorgrond Grapes
    117457, -- Blood Apples
    117469, -- Sugar Dusted Choux Twist
    117470, -- Thirteen Grain Loaf
    117471, -- Cocoa Flatcakes
    117472, -- Grilled Gorgrond Surprise
    117473, -- Pickled Elekk Hooves
    117474, -- Rylak Sausages
    117475, -- Clefthoof Milk
    118050, -- Enchanted Apple
    118051, -- Enchanted Orange
    118268, -- Fuzzy Pear
    118269, -- Greenskin Apple
    111433, -- Blackrock Ham
    118271, -- Ironpeel Plantain
    118272, -- Giant Nagrand Cherry
    118275, -- Perfect Nagrand Cherry
    118276, -- Perfect Greenskin Apple
    118277, -- Perfect Ironpeel Plantain
    118416, -- Fish Roe
    118424, -- Blind Palefish
    118428, -- Legion Chili
    118576, -- Savage Feast
    119022, -- Shadowmoon Sugar Pear Cider
    119157, -- Saberon Cat-Sip
    119324, -- Savage Remedy
    120168, -- Pre-Mixed Pot of Noodles
    120293, -- Lukewarm Yak Roast Broth
    120959, -- Pinchwhistle "Nitro Fuel"
    122343, -- Sleeper Sushi
    122344, -- Salty Squid Roll
    122345, -- Pickled Eel
    122346, -- Jumbo Sea Dog
    122347, -- Whiptail Fillet
    122348, -- Buttered Sturgeon
    128219, -- Fel-Smoked Ham
    128385, -- Elemental-Distilled Water
    128498, -- Fel Eggs and Ham
    130192, -- Potato Axebeak Stew
    116917, -- Sailor Zazzuk's 180-Proof Rum
    104196, -- Delectable Ogre Queasine
    113108, -- Ogre Moonshine
    113290, -- Spirevine Fruit
    115300, -- Marinated Elekk Steak
    112449, -- Iron Horde Rations
    117441, -- Elekk's Neck
    117453, -- "Da Bruisery" OPA
    117568, -- Jug of Ironwine
    117437, -- Skyreach Sunrise
    112095, -- Half-Eaten Banana
    126936, -- Sugar-Crusted Fish Feast
    114017, -- Steamwheedle Wagon Bomb
    116405, -- Congealed Cranberry Chutney
    116406, -- Twice-Baked Sweet Potato
    116407, -- Slow-Smoked Turkey
    116408, -- Herb-Infused Stuffing
    116409, -- Gourmet Pumpkin Pie
    118900, -- Hol'bruk's Brutal Brew
    120150, -- Blackrock Coffee
    126934, -- Lemon Herb Filet
    126935, -- Fancy Darkmoon Feast
    111522, -- Tikari & K.A.Y.T.
    118897, -- Miner's Coffee
    116120, -- Tasty Talador Lunch
    118273, -- Perfect O'ruk Orange
    118274, -- Perfect Fuzzy Pear
    101436} -- Icemother Milk
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][CONSUMABLES_ID][C_ITEM_ENHANCEMENTS_ID] = {
    118391, -- Worm Supreme

    128159, -- Elemental Distillate
    128158, -- Wildswater
    109120, -- Oglethorpe's Missile Splitter
    109122, -- Megawatt Filament
    110638, -- Enchant Ring - Gift of Critical Strike
    110639, -- Enchant Ring - Gift of Haste
    110640, -- Enchant Ring - Gift of Mastery
    110641, -- Enchant Ring - Gift of Mastery
    110642, -- Enchant Ring - Gift of Versatility
    110645, -- Enchant Neck - Gift of Critical Strike
    110646, -- Enchant Neck - Gift of Haste
    110647, -- Enchant Neck - Gift of Mastery
    110648, -- Enchant Neck - Gift of Haste
    110649, -- Enchant Neck - Gift of Versatility
    110652, -- Enchant Cloak - Gift of Critical Strike
    110653, -- Enchant Cloak - Gift of Haste
    110654, -- Enchant Cloak - Gift of Mastery
    110655, -- Enchant Cloak - Gift of Critical Strike
    110656, -- Enchant Cloak - Gift of Versatility
    110682, -- Enchant Weapon - Mark of the Thunderlord
    112093, -- Enchant Weapon - Mark of the Shattered Hand
    112115, -- Enchant Weapon - Mark of Shadowmoon
    112160, -- Enchant Weapon - Mark of Blackrock
    112164, -- Enchant Weapon - Mark of Warsong
    112165, -- Enchant Weapon - Mark of the Frostwolf
    115973, -- Enchant Weapon - Glory of the Thunderlord
    115975, -- Enchant Weapon - Glory of the Shadowmoon
    115976, -- Enchant Weapon - Glory of the Blackrock
    115977, -- Enchant Weapon - Glory of the Warsong
    115978, -- Enchant Weapon - Glory of the Frostwolf
    118008, -- Hemet's Heartseeker
    118015, -- Enchant Weapon - Mark of Bleeding Hollow
    110617, -- Enchant Ring - Breath of Critical Strike
    110618, -- Enchant Ring - Breath of Haste
    110619, -- Enchant Ring - Breath of Mastery
    110620, -- Enchant Ring - Breath of Mastery
    110621, -- Enchant Ring - Breath of Versatility
    110624, -- Enchant Neck - Breath of Critical Strike
    110625, -- Enchant Neck - Breath of Haste
    110626, -- Enchant Neck - Breath of Mastery
    110627, -- Enchant Neck - Breath of Haste
    110628, -- Enchant Neck - Breath of Versatility
    110631, -- Enchant Cloak - Breath of Critical Strike
    110632, -- Enchant Cloak - Breath of Haste
    110633, -- Enchant Cloak - Breath of Mastery
    110634, -- Enchant Cloak - Breath of Critical Strike
    110635, -- Enchant Cloak - Breath of Versatility
    118441, -- Vintage Enchanting Recipe
    116117} -- Rook's Lucky Fishin' Line
DatabaseIDs[WARLORDS_OF_DRAENOR_ID][CONSUMABLES_ID][C_POTIONS_ID] = {
    118912, -- Brawler's Draenic Strength Potion
    118278, -- Pale Vision Potion
    118914, -- Brawler's Bottomless Draenic Intellect Potion
    118915, -- Brawler's Bottomless Draenic Strength Potion
    118917, -- Brawler's Bottomless Healing Tonic
    109217, -- Draenic Agility Potion
    109218, -- Draenic Intellect Potion
    109219, -- Draenic Strength Potion
    109220, -- Draenic Versatility Potion
    109221, -- Draenic Channeled Mana Potion
    109222, -- Draenic Mana Potion
    109223, -- Healing Tonic
    109226, -- Draenic Rejuvenation Potion
    114124, -- Phantom Potion
    115498, -- Ashran Healing Tonic
    115531, -- Swirling Ashran Potion
    116925, -- Vintage Free Action Potion
    117415, -- Smuggled Tonic
    118006, -- Shieldtronic Shield
    118262, -- Brilliant Dreampetal
    118910, -- Brawler's Draenic Agility Potion
    118911, -- Brawler's Draenic Intellect Potion
    118913, -- Brawler's Bottomless Draenic Agility Potion
    118916, -- Brawler's Healing Tonic
    122453, -- Commander's Draenic Agility Potion
    122454, -- Commander's Draenic Intellect Potion
    122455, -- Commander's Draenic Strength Potion
    122456, -- Commander's Draenic Versatility Potion
    113585, -- Iron Horde Rejuvenation Potion
    116268, -- Draenic Invisibility Potion
    116276, -- Draenic Living Action Potion
    118704, -- Pure Rage Potion
    122451, -- Commander's Draenic Invisibility Potion
    122452, -- Commander's Draenic Swiftness Potion
    116266, -- Draenic Swiftness Potion
    116277, -- Potion of Petrification
    116275, -- Mighty Rage Potion
    116267, -- Free Action Potion
    107640, -- Potion of Slow Fall
    118922, -- Oralius' Whispering Crystal
    124660, -- Darkmoon Healing Tonic
    124661, -- Gladiator's Healing Potion
    124671, -- Darkmoon Firewater
    128647} -- Fizzy Apple Cider
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
DatabaseIDs[MISTS_OF_PANDARIA_ID][CONSUMABLES_ID][C_BANDAGES_ID] = {
    72986, -- Heavy Windwool Bandage
    72985} -- Windwool Bandage
DatabaseIDs[MISTS_OF_PANDARIA_ID][CONSUMABLES_ID][C_ELIXIRS_ID] = {
    76075, -- Mantid Elixir
    76076, -- Mad Hozen Elixir
    76077, -- Elixir of Weaponry
    76078, -- Elixir of the Rapids
    76079, -- Elixir of Peace
    76080, -- Elixir of Perfection
    76081, -- Elixir of Mirrors
    76083, -- Monk's Elixir
    104111} -- Elixir of Wandering Spirits
DatabaseIDs[MISTS_OF_PANDARIA_ID][CONSUMABLES_ID][C_FLASKS_ID] = {
    103557, -- Enduring Elixir of Wisdom
    76084, -- Flask of Spring Blossoms
    76085, -- Flask of the Warm Sun
    76086, -- Flask of Falling Leaves
    76087, -- Flask of the Earth
    76088, -- Flask of Winter's Bite
    75525} -- Alchemist's Flask
DatabaseIDs[MISTS_OF_PANDARIA_ID][CONSUMABLES_ID][C_FOOD_DRINKS_ID] = {
    87244, -- Great Banquet of the Oven
    74646, -- Black Pepper Ribs and Shrimp
    74653, -- Steamed Crab Surprise
    74656, -- Chun Tian Spring Rolls
    74919, -- Pandaren Banquet
    75016, -- Great Pandaren Banquet
    75038, -- Mad Brewer's Breakfast
    79320, -- Half a Lovely Apple
    80610, -- Conjured Mana Pudding
    80618, -- Conjured Mana Fritter
    81408, -- Red Bean Bun
    81409, -- Tangy Yogurt
    81410, -- Green Curry Fish
    81411, -- Peach Pie
    81412, -- Blanched Needle Mushrooms
    81413, -- Skewered Peanut Chicken
    81414, -- Pearl Milk Tea
    81415, -- Pandaren Plum Wine
    81916, -- Humongous Fungus
    81918, -- Pickled Pig's Snout
    81920, -- Plump Fig
    81921, -- Chilton Stilton
    81923, -- Cobo Cola
    82344, -- Hearthglen Ambrosia
    82449, -- Barnacle Bouillabaisse
    82451, -- Frybread
    83094, -- Foote Tripel
    86073, -- Spicy Salmon
    86074, -- Spicy Vegetable Chips
    86508, -- Fresh Bread
    87226, -- Banquet of the Grill
    87228, -- Great Banquet of the Grill
    87230, -- Banquet of the Wok
    87232, -- Great Banquet of the Wok
    87234, -- Banquet of the Pot
    87236, -- Great Banquet of the Pot
    87238, -- Banquet of the Steamer
    87240, -- Great Banquet of the Steamer
    87242, -- Banquet of the Oven
    74650, -- Mogu Fish Stew
    87246, -- Banquet of the Brew
    87248, -- Great Banquet of the Brew
    87253, -- Perpetual Leftovers
    90135, -- Thick-Cut Bacon
    94535, -- Grilled Dinosaur Haunch
    98111, -- K.R.E.
    98116, -- Freeze-Dried Hyena Jerky
    98118, -- Scorpion Crunchies
    98121, -- Amberseed Bun
    98122, -- Camembert du Clefthoof
    98123, -- Whale Shark Caviar
    98124, -- Bloodberry Tart
    98125, -- Shaved Zangar Truffles
    98126, -- Mechanopeep Foie Gras
    98127, -- Dented Can of Kaja'Cola
    101630, -- Noodle Cart Kit
    101661, -- Deluxe Noodle Cart Kit
    101662, -- Pandaren Treasure Noodle Cart Kit
    101745, -- Mango Ice
    101746, -- Seasoned Pomfruit Slices
    101747, -- Farmer's Delight
    101748, -- Spiced Blossom Soup
    101749, -- Stuffed Lushrooms
    101750, -- Fluffy Silkfeather Omelet
    104339, -- Harmonious River Noodles
    104340, -- Crazy Snake Noodles
    104341, -- Steaming Goat Noodles
    104342, -- Spicy Mushan Noodles
    104343, -- Golden Dragon Noodles
    104344, -- Lucky Mushroom Noodles
    105717, -- Rice-Wine Mushrooms
    105719, -- Brew-Curried Whitefish
    105720, -- Candied Apple
    105721, -- Hot Papaya Milk
    105722, -- Nutty Brew-Bun
    105723, -- Peanut Pork Chops
    105724, -- Fried Cheese Dumplings
    108920, -- Lemon Flower Pudding
    74648, -- Sea Mist Rice Noodles
    74645, -- Eternal Blossom Fish
    74647, -- Valley Stir Fry
    74649, -- Braised Turtle
    74652, -- Fire Spirit Salmon
    74655, -- Twin Fish Platter
    75037, -- Jade Witch Brew
    86069, -- Rice Pudding
    86070, -- Wildfowl Ginseng Soup
    86432, -- Banana Infused Rum
    87264, -- Four Senses Brew
    85504, -- Krasarang Fritters
    74636, -- Golden Carp Consomme
    74643, -- Sauteed Carrots
    74644, -- Swirling Mist Soup
    74651, -- Shrimp Dumplings
    74654, -- Wildfowl Roast
    75026, -- Ginseng Tea
    81400, -- Pounded Rice Cake
    81401, -- Yak Cheese Curds
    81402, -- Toasted Fish Jerky
    81403, -- Dried Peaches
    81404, -- Dried Needle Mushrooms
    81405, -- Boiled Silkworm Pupa
    81406, -- Roasted Barley Tea
    85501, -- Viseclaw Soup
    74642, -- Charbroiled Tiger Steak
    86026, -- Perfectly Cooked Instant Noodles
    86057, -- Sliced Peaches
    104348, -- Timeless Tea
    105700, -- Kun-Lai Kicker
    105701, -- Greenstone Brew
    105702, -- Boomer Brew
    105703, -- Stormstout Brew
    105704, -- Yan-Zhu's Blazing Brew
    105705, -- Chani's Bitter Brew
    105706, -- Shado-Pan Brew
    105707, -- Unga Brew
    105708, -- Shimmering Amber-Brew
    105711, -- Funky Monkey Brew
    74641, -- Fish Cake
    81175, -- Crispy Dojani Eel
    81407, -- Four Wind Soju
    81889, -- Peppered Puffball
    81917, -- Mutton Stew
    81919, -- Red Raspberry
    81922, -- Redridge Roquefort
    81924, -- Carbonated Water
    82343, -- Lordaeron Lambic
    82448, -- Smoked Squid Belly
    82450, -- Cornmeal Biscuit
    83095, -- Lagrave Stout
    83097, -- Tortoise Jerky
    88379, -- Grummlecake
    88382, -- Keenbean Kafa
    88388, -- Squirmy Delight
    88398, -- Root Veggie Stew
    88490, -- Triple-Distilled Brew
    88492, -- Wicked Wikket
    88529, -- Sparkling Water
    88530, -- Bubbling Beverage
    88532, -- Lotus Water
    88578, -- Cup of Kafa
    88586, -- Chao Cookies
    89594, -- Serpent Brew of Serenity
    89601, -- Tiger Brew of Serenity
    89683, -- Hozen Cuervo
    90457, -- Mah's Warm Yak-Tail Stew
    101616, -- Noodle Soup
    101617, -- Deluxe Noodle Soup
    101618, -- Pandaren Treasure Noodle Soup
    103641, -- Singing Crystal
    103642, -- Book of the Ages
    103643, -- Dew of Eternal Morning
    89593, -- Serpent Brew of Fallen Blossoms
    89600, -- Tiger Brew of Fallen Blossoms
    89592, -- Serpent Brew of Meditation
    89599, -- Tiger Brew of Meditation
    89591, -- Serpent Brew of Pilgrimage
    89598, -- Tiger Brew of Pilgrimage
    89590, -- Serpent Brew of Adversity
    89597, -- Tiger Brew of Adversity
    89589, -- Initiate's Serpent Brew
    89596, -- Initiate's Tiger Brew
    89588, -- Novice's Serpent Brew
    89595, -- Novice's Tiger Brew
    90660, -- Black Tea
    90659, -- Jasmine Tea
    77264, -- Small Bamboo Shoot
    77272, -- Small Sugarcane Stalk
    77273, -- Small Rice Cake
    93208, -- Darkmoon P.I.E.
    98157, -- Big Blossom Brew
    104314, -- Dragon P.I.E.
    104316, -- Spectral Grog
    80313, -- Ling-Ting's Favorite Tea
    88531} -- Lao Chin's Last Mug
DatabaseIDs[MISTS_OF_PANDARIA_ID][CONSUMABLES_ID][C_ITEM_ENHANCEMENTS_ID] = {
    87577, -- Ox Horn Inscription
    83006, -- Greater Tiger Fang Inscription
    87560, -- Greater Ox Horn Inscription
    87581, -- Secret Ox Horn Inscription
    87582, -- Secret Crane Wing Inscription
    87584, -- Secret Tiger Claw Inscription
    87585, -- Secret Tiger Fang Inscription
    77529, -- Lord Blastington's Scope of Doom
    77531, -- Mirror Scope
    82444, -- Greater Pearlescent Spellthread
    82445, -- Greater Cerulean Spellthread
    83763, -- Ironscale Leg Armor
    83764, -- Shadowleather Leg Armor
    83765, -- Angerhide Leg Armor
    87559, -- Greater Crane Wing Inscription
    87578, -- Crane Wing Inscription
    87579, -- Tiger Claw Inscription
    87580, -- Tiger Fang Inscription
    95349, -- Enchant Weapon - Glorious Tyranny
    98163, -- Enchant Weapon - Bloody Dancing Steel
    82442, -- Pearlescent Spellthread
    82443, -- Cerulean Spellthread
    86597, -- Living Steel Weapon Chain
    86599, -- Ghost Iron Shield Spike
    83007, -- Greater Tiger Claw Inscription
    85568, -- Brutal Leg Armor
    85569, -- Sha-Touched Leg Armor
    85570, -- Toughened Leg Armor
    85559, -- Sha Armor Kit
    89737, -- Enchant Shield - Greater Parry
    74724, -- Enchant Weapon - Jade Spirit
    74725, -- Enchant Weapon - Elemental Force
    74726, -- Enchant Weapon - Dancing Steel
    74727, -- Enchant Weapon - Colossus
    74728, -- Enchant Weapon - River's Song
    98164, -- Enchant Weapon - Spirit of Conquest
    74700, -- Enchant Bracer - Mastery
    74701, -- Enchant Bracer - Major Dodge
    74703, -- Enchant Bracer - Super Intellect
    74704, -- Enchant Bracer - Exceptional Strength
    74705, -- Enchant Bracer - Greater Agility
    74706, -- Enchant Chest - Super Resilience
    74707, -- Enchant Chest - Mighty Versatility
    74708, -- Enchant Chest - Glorious Stats
    74709, -- Enchant Chest - Superior Stamina
    74710, -- Enchant Cloak - Accuracy
    74711, -- Enchant Cloak - Greater Protection
    74712, -- Enchant Cloak - Superior Intellect
    74713, -- Enchant Cloak - Superior Critical Strike
    74715, -- Enchant Boots - Greater Haste
    74716, -- Enchant Boots - Greater Precision
    74717, -- Enchant Boots - Blurred Speed
    74718, -- Enchant Boots - Pandaren's Step
    74719, -- Enchant Gloves - Greater Haste
    74720, -- Enchant Gloves - Superior Haste
    74721, -- Enchant Gloves - Super Strength
    74722, -- Enchant Gloves - Superior Mastery
    74729, -- Enchant Off-Hand - Major Intellect
    74723} -- Enchant Weapon - Windsong
DatabaseIDs[MISTS_OF_PANDARIA_ID][CONSUMABLES_ID][C_POTIONS_ID] = {
    92954, -- Brawler's Healing Potion
    76089, -- Virmen's Bite
    76092, -- Potion of Focus
    76093, -- Potion of the Jade Serpent
    76094, -- Alchemist's Rejuvenation
    76095, -- Potion of Mogu Power
    76096, -- Darkwater Potion
    76097, -- Master Healing Potion
    76098, -- Master Mana Potion
    92941, -- Potion of Brawler's Might
    92942, -- Potion of Brawler's Cunning
    92943, -- Potion of Brawler's Deftness
    76090, -- Potion of the Mountains
    93742, -- Healing Potion
    95054, -- Potion of Light Steps
    95055, -- Frost Rune Trap
    97156, -- Frost Rune Trap
    97157, -- Potion of Light Steps
    98061, -- Bottomless Potion of Brawler's Deftness
    98062, -- Bottomless Potion of Brawler's Cunning
    98063, -- Bottomless Potion of Brawler's Might
    76091, -- Greater Potion of Luck
    93351, -- Potion of Luck
    86569} -- Crystal of Insanity
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
DatabaseIDs[CATACLYSM_ID][CONSUMABLES_ID][C_BANDAGES_ID] = {
    53051, -- Dense Embersilk Bandage
    63391, -- Baradin's Wardens Bandage
    64995, -- Hellscream's Reach Bandage
    53050, -- Heavy Embersilk Bandage
    53049} -- Embersilk Bandage
DatabaseIDs[CATACLYSM_ID][CONSUMABLES_ID][C_ELIXIRS_ID] = {
    58084, -- Ghost Elixir
    58089, -- Elixir of the Naga
    58092, -- Elixir of the Cobra
    58093, -- Elixir of Deep Earth
    58094, -- Elixir of Impossible Accuracy
    58143, -- Prismatic Elixir
    58144, -- Elixir of Mighty Speed
    58148, -- Elixir of the Master
    64640} -- Infectis Puffer Sashimi
DatabaseIDs[CATACLYSM_ID][CONSUMABLES_ID][C_FLASKS_ID] = {
    58085, -- Flask of Steelskin
    58086, -- Flask of the Draconic Mind
    58087, -- Flask of the Winds
    58088, -- Flask of Titanic Strength
    65455, -- Flask of Battle
    67438} -- Flask of Flowing Water
DatabaseIDs[CATACLYSM_ID][CONSUMABLES_ID][C_FOOD_DRINKS_ID] = {
    58257, -- Highland Spring Water
    58259, -- Highland Sheep Cheese
    58263, -- Grilled Shark
    58265, -- Highland Pomegranate
    58267, -- Scarlet Polypore
    58269, -- Massive Turkey Leg
    63251, -- Mei's Masterful Brew
    65499, -- Conjured Mana Cake
    68140, -- Invigorating Pineapple Punch
    70924, -- Eternal Eye of Elune
    70925, -- Eternal Lunar Pear
    70926, -- Eternal Moonberry
    70927, -- Eternal Sunfruit
    73260, -- Salty Sea Dog
    74822, -- Sasparilla Sinker
    74921, -- Darkmoon Doughnut
    58261, -- Buttery Wheat Roll
    62289, -- Broiled Dragon Feast
    62666, -- Delicious Sagefish Tail
    62649, -- Fortune Cookie
    62651, -- Lightly Fried Lurker
    62652, -- Seasoned Crab
    62653, -- Salted Eye
    62654, -- Lavascale Fillet
    62655, -- Broiled Mountain Trout
    62656, -- Whitecrest Gumbo
    62657, -- Lurker Lunch
    62658, -- Tender Baked Turtle
    62659, -- Hearty Seafood Soup
    62660, -- Pickled Guppy
    62661, -- Baked Rockfish
    62662, -- Grilled Dragon
    62663, -- Lavascale Minestrone
    62664, -- Crocolisk Au Gratin
    62665, -- Basilisk Liverdog
    60858, -- Goblin Barbecue
    62667, -- Mushroom Sauce Mudfish
    62668, -- Blackbelly Sushi
    62669, -- Skewered Eel
    62670, -- Beer-Basted Crocolisk
    62671, -- Severed Sagefish Head
    62675, -- Starfire Espresso
    62676, -- Blackened Surprise
    62290, -- Seafood Magnifique Feast
    68687, -- Scalding Murglesnout
    58256, -- Sparkling Oasis Water
    58262, -- Sliced Raw Billfish
    58264, -- Sour Green Apple
    58266, -- Violet Morel
    58268, -- Roasted Beef
    59029, -- Greasy Whale Milk
    59228, -- Vile Purple Fungus
    59230, -- Fungus Squeezings
    59232, -- Unidentifiable Meat Dish
    62672, -- South Island Iced Tea
    62677, -- Fish Fry
    62680, -- Chocolate Cookie
    58260, -- Pine Nut Bread
    58258, -- Smoked String Cheese
    58274, -- Fresh Water
    58276, -- Gilnean White
    58277, -- Simmered Squid
    58278, -- Tropical Sunfruit
    58279, -- Tasty Puffball
    58275, -- Hardtack
    59227, -- Rock-Hard Biscuit
    59229, -- Murky Water
    59231, -- Oily Giblets
    58280, -- Stewed Rabbit
    69243, -- Ice Cream Cake Slice
    65517, -- Conjured Mana Lollipop
    75027, -- Teldrassil Tenderloin
    75028, -- Stormwind Surprise
    75029, -- Beer-Basted Short Ribs
    75030, -- Gnomeregan Gnuggets
    75031, -- Draenic Dumplings
    75032, -- Mulgore Meat Pie
    75035, -- Troll Tartare
    75036, -- Silvermoon Steak
    65516, -- Conjured Mana Cupcake
    67270, -- Ursius Flank
    67272, -- Shy-Rotam Steak
    67273, -- Chillwind Omelet
    67271, -- Hell-Hoot Barbecue
    65515, -- Conjured Mana Brownie
    63691, -- Brivelthwerp's Crunchy Ice Cream Bar
    69244, -- Ice Cream Bar
    61986, -- Tol Barad Coconut Rum
    63023, -- Sweet Tea
    64639, -- Silversnap Ice
    61382, -- Garr's Limeade
    65500, -- Conjured Mana Cookie
    61381, -- Yance's Special Burger Patty
    63692, -- Frozen "Cream" Custard
    57519, -- Cookie's Special Ramlette
    61383, -- Garr's Key Lime Pie
    61985, -- Banana Cocktail
    64641, -- Delicious" Worm Steak
    63693, -- Ooey Gooey Gelato
    63694, -- Silithid-Free Sorbet
    46392, -- Venison Steak
    57518, -- Mr. Bubble's Shockingly Delicious Ice Cream
    60375, -- Cheery Cherry Pie
    60377, -- Lots 'o Meat Pie
    60378, -- Plumpkin Pie
    60379, -- Mud Pie
    61983, -- Imported E.K. Ale
    61984, -- Potent Pineapple Punch
    62908, -- Hair of the Dog
    65730, -- Stagwich
    65731, -- Yetichoke Hearts
    58933, -- Westfall Mud Pie
    60267, -- Country Pumpkin
    60269, -- Well Water
    60268, -- Hobo Surprise
    69233, -- Cone of Cold
    69027, -- Cone of Cold
    49397, -- Half-Eaten Rat
    49600, -- Goblin Shortbread
    49601, -- Volcanic Spring Water
    49365, -- Briaroot Brew
    62909, -- "Bear" Steaks
    63530, -- Refreshing Pineapple Punch
    67230, -- Venison Jerky
    69920, -- Thrice-Spiced Crunchy Stew
    49602, -- Earl Black Tea
    75034, -- Forsaken Foie Gras
    49254, -- Tarp Collected Dew
    57543, -- Stormhammer Stout
    57544, -- Leftover Boar Meat
    61384, -- Doublerum
    61982, -- Fizzy Fruit Wine
    62674, -- Highland Spirits
    62790, -- Darkbrew Lager
    63275, -- Gilnean Fortified Brandy
    63291, -- Blood Red Ale
    63292, -- Disgusting Rotgut
    63293, -- Blackheart Grog
    63296, -- Embalming Fluid
    63299, -- Sunkissed Wine
    75033, -- Green Ham & Eggs
    49253} -- Slightly Worm-Eaten Hardtack
DatabaseIDs[CATACLYSM_ID][CONSUMABLES_ID][C_ITEM_ENHANCEMENTS_ID] = {
    68049, -- Heat-Treated Spinning Lure
    62673, -- Feathered Lure
    67404, -- Glass Fishing Bobber
    69907, -- Corpse Worm

    59596, -- Safety Catch Removal Kit
    54450, -- Powerful Ghostly Spellthread
    62333, -- Greater Inscription of Unbreakable Quartz
    62343, -- Greater Inscription of Charged Lodestone
    62345, -- Greater Inscription of Jagged Stone
    62346, -- Greater Inscription of Shattered Crystal
    68772, -- Greater Inscription of Vicious Intellect
    68773, -- Greater Inscription of Vicious Strength
    68774, -- Greater Inscription of Vicious Agility
    71720, -- Drakehide Leg Armor
    55056, -- Pyrium Shield Spike
    59594, -- Gnomish X-Ray Scope
    59595, -- R19 Threatfinder
    56551, -- Charscale Leg Armor
    62321, -- Lesser Inscription of Unbreakable Quartz
    62342, -- Lesser Inscription of Charged Lodestone
    62344, -- Lesser Inscription of Jagged Stone
    62347, -- Lesser Inscription of Shattered Crystal
    70139, -- Flintlocke's Woodchucker
    55057, -- Pyrium Weapon Chain
    56550, -- Dragonscale Leg Armor
    56517, -- Heavy Savage Armor Kit
    54449, -- Ghostly Spellthread
    56502, -- Scorched Leg Armor
    56503, -- Twilight Leg Armor
    56477, -- Savage Armor Kit
    52747, -- Enchant Weapon - Mending
    68784, -- Enchant Bracer - Agility
    68785, -- Enchant Bracer - Major Strength
    68786, -- Enchant Bracer - Mighty Intellect
    55055, -- Elementium Shield Spike
    52687, -- Enchant Gloves - Mastery
    52743, -- Enchant Boots - Earthen Vitality
    52744, -- Enchant Chest - Mighty Stats
    52745, -- Enchant Cloak - Lesser Power
    52746, -- Enchant Bracer - Speed
    52748, -- Enchant Weapon - Avalanche
    52749, -- Enchant Gloves - Haste
    52750, -- Enchant Boots - Haste
    52751, -- Enchant Chest - Stamina
    52752, -- Enchant Bracer - Critical Strike
    52753, -- Enchant Cloak - Intellect
    52754, -- Enchant Shield - Protection
    52755, -- Enchant Weapon - Elemental Slayer
    52756, -- Enchant Gloves - Exceptional Strength
    52757, -- Enchant Boots - Major Agility
    52758, -- Enchant Chest - Mighty Resilience
    52759, -- Enchant Gloves - Greater Haste
    52760, -- Enchant Weapon - Hurricane
    52761, -- Enchant Weapon - Heartsong
    52762, -- Enchant Shield - Mastery
    52763, -- Enchant Bracer - Superior Dodge
    52764, -- Enchant Cloak - Critical Strike
    52765, -- Enchant Chest - Exceptional Versatility
    52766, -- Enchant Bracer - Precision
    52767, -- Enchant Cloak - Protection
    52768, -- Enchant Off-Hand - Superior Intellect
    52769, -- Enchant Boots - Precision
    52770, -- Enchant Bracer - Exceptional Versatility
    52771, -- Enchant Boots - Mastery
    52772, -- Enchant Bracer - Greater Haste
    52773, -- Enchant Cloak - Greater Intellect
    52774, -- Enchant Weapon - Power Torrent
    52775, -- Enchant Weapon - Windwalk
    52776, -- Enchant Weapon - Landslide
    52777, -- Enchant Cloak - Greater Critical Strike
    52778, -- Enchant Bracer - Greater Critical Strike
    52779, -- Enchant Chest - Peerless Stats
    52780, -- Enchant Chest - Greater Stamina
    52781, -- Enchant Boots - Assassin's Step
    52782, -- Enchant Boots - Lavawalker
    52783, -- Enchant Gloves - Mighty Strength
    52784, -- Enchant Gloves - Greater Mastery
    52785, -- Enchant Bracer - Greater Speed
    68134, -- Enchant 2H Weapon - Mighty Agility
    72070, -- Enchant Gloves - Assault
    54448, -- Powerful Enchanted Spellthread
    54447, -- Enchanted Spellthread
    68796} -- Reinforced Fishing Line
DatabaseIDs[CATACLYSM_ID][CONSUMABLES_ID][C_POTIONS_ID] = {
    63145, -- Baradin's Wardens Mana Potion
    57099, -- Mysterious Potion
    58090, -- Earthen Potion
    58091, -- Volcanic Potion
    58145, -- Potion of the Tol'vir
    58146, -- Golemblood Potion
    58488, -- Potion of Treasure Finding
    58489, -- Potion of Illusion
    63144, -- Baradin's Wardens Healing Potion
    57194, -- Potion of Concentration
    64993, -- Hellscream's Reach Mana Potion
    64994, -- Hellscream's Reach Healing Potion
    57193, -- Mighty Rejuvenation Potion
    58487, -- Potion of Deepholm
    57191, -- Mythical Healing Potion
    57192, -- Mythical Mana Potion
    63300, -- Rogue's Draught
    67415, -- Draught of War
    54213} -- Molotov Cocktail
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
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][CONSUMABLES_ID][C_BANDAGES_ID] = {
    34722, -- Heavy Frostweave Bandage
    34721} -- Frostweave Bandage
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][CONSUMABLES_ID][C_ELIXIRS_ID] = {
    44325, -- Elixir of Accuracy
    39666, -- Elixir of Mighty Agility
    40070, -- Spellpower Elixir
    40072, -- Elixir of Versatility
    40073, -- Elixir of Mighty Strength
    40076, -- Guru's Elixir
    40078, -- Elixir of Mighty Fortitude
    40097, -- Elixir of Protection
    40109, -- Elixir of Mighty Mageblood
    40068, -- Wrath Elixir
    44327, -- Elixir of Deadly Strikes
    44328, -- Elixir of Mighty Defense
    44329, -- Elixir of Expertise
    44330, -- Elixir of Armor Piercing
    44331, -- Elixir of Lightning Speed
    44332, -- Elixir of Mighty Thoughts
    44012, -- Underbelly Elixir
    37449, -- Breath of Murloc
    45621} -- Elixir of Minor Accuracy
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][CONSUMABLES_ID][C_FLASKS_ID] = {
    40079, -- Lesser Flask of Toughness
    40082, -- Mixture of the Frost Wyrm
    40083, -- Mixture of Stoneblood
    40084, -- Mixture of Endless Rage
    40404, -- Mixture of Pure Mojo
    44939, -- Lesser Flask of Resistance
    46376, -- Flask of the Frost Wyrm
    46377, -- Flask of Endless Rage
    46378, -- Flask of Pure Mojo
    46379} -- Flask of Stoneblood
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][CONSUMABLES_ID][C_FOOD_DRINKS_ID] = {
    43488, -- Last Week's Mammoth
    43490, -- Tasty Cupcake
    43492, -- Haunted Herring
    43523, -- Conjured Mana Strudel
    43491, -- Bad Clams
    42777, -- Crusader's Waterskin
    35947, -- Sparkling Frostcap
    35950, -- Sweet Potato Bread
    35951, -- Poached Emperor Salmon
    35952, -- Briny Hardcheese
    35953, -- Mead Basted Caribou
    38706, -- Bowels 'n' Brains
    39520, -- Kungaloosh
    40202, -- Sizzling Grizzly Flank
    41729, -- Stewed Drakeflesh
    41731, -- Yeti Milk
    33445, -- Honeymint Tea
    42431, -- Dalaran Brownie
    42434, -- Lovely Cake Slice
    35948, -- Savory Snowplum
    42778, -- Crusader's Rations
    42779, -- Steaming Chicken Soup
    43087, -- Crisp Dalaran Apple
    43236, -- Star's Sorrow
    44049, -- Freshly-Speared Emperor Salmon
    44071, -- Slow-Roasted Eel
    44072, -- Roasted Mystery Beast
    44607, -- Aged Dalaran Sharp
    44722, -- Aged Yolk
    44940, -- Corn-Breaded Sausage
    45932, -- Black Jelly
    42429, -- Red Velvet Cupcake
    43518, -- Conjured Mana Pie
    33444, -- Pungent Seal Whey
    34125, -- Shoveltusk Soup
    34747, -- Northern Stew
    34748, -- Mammoth Meal
    34749, -- Shoveltusk Steak
    34750, -- Worm Delight
    34751, -- Roasted Worg
    34752, -- Rhino Dogs
    34753, -- Great Feast
    34754, -- Mega Mammoth Meal
    34755, -- Tender Shoveltusk Steak
    34756, -- Spiced Worm Burger
    34757, -- Very Burnt Worg
    34758, -- Mighty Rhino Dogs
    34759, -- Smoked Rockfin
    34760, -- Grilled Bonescale
    34761, -- Sauteed Goby
    34762, -- Grilled Sculpin
    34763, -- Smoked Salmon
    34764, -- Poached Nettlefish
    34765, -- Pickled Fangtooth
    34766, -- Poached Northern Sculpin
    34767, -- Firecracker Salmon
    34768, -- Spicy Blue Nettlefish
    34769, -- Imperial Manta Steak
    38698, -- Bitter Plasma
    39691, -- Succulent Orca Stew
    42428, -- Carrot Cupcake
    42430, -- Dalaran Doughnut
    42432, -- Berry Pie Slice
    42433, -- Chocolate Cake Slice
    42942, -- Baked Manta Ray
    42993, -- Spicy Fried Herring
    42994, -- Rhinolicious Wormsteak
    42995, -- Hearty Rhino
    42996, -- Snapper Extreme
    42997, -- Blackened Worg Steak
    42998, -- Cuttlesteak
    42999, -- Blackened Dragonfin
    43000, -- Dragonfin Filet
    43001, -- Tracker Snacks
    43004, -- Critter Bites
    43005, -- Spiced Mammoth Treats
    43015, -- Fish Feast
    43086, -- Fresh Apple Juice
    43268, -- Dalaran Clam Chowder
    43478, -- Gigantic Feast
    43480, -- Small Feast
    44616, -- Glass of Dalaran White
    44941, -- Fresh-Squeezed Limeade
    44953, -- Worg Tartare
    40359, -- Fresh Eagle Meat
    33443, -- Sour Goat Cheese
    33452, -- Honey-Spiced Lichen
    33454, -- Salted Venison
    35949, -- Tundra Berries
    35954, -- Sweetened Goat's Milk
    37252, -- Frostberries
    37253, -- Frostberry Juice
    37452, -- Fatty Bluefin
    40356, -- Grizzleberries
    40357, -- Grizzleberry Juice
    40358, -- Raw Tallhorn Chunk
    33451, -- Fillet of Icefin
    44608, -- Dalaran Swiss
    44609, -- Fresh Dalaran Bread Slice
    44749, -- Salted Yeti Cheese
    44750, -- Mountain Water
    33449, -- Crusty Flatbread
    46887, -- Bountiful Feast
    41751, -- Black Mushroom
    44791, -- Noblegarden Chocolate
    46691, -- Bread of the Dead
    33004, -- Clamlette Magnifique
    44574, -- Skin of Mulgore Firewater
    40042, -- Caraway Burnwine
    44573, -- Cup of Frog Venom Brew
    40036, -- Snowplum Brandy
    44575, -- Flask of Bitter Cactus Cider
    44571, -- Bottle of Silvermoon Port
    38350, -- Winterfin "Depth Charge"
    40035, -- Northrend Honey Mead
    43695, -- Half Full Bottle of Prison Moonshine
    43696, -- Half Empty Bottle of Prison Moonshine
    44114, -- Old Spices
    44228, -- Baby Spice
    44570, -- Glass of Eversong Wine
    44617, -- Glass of Dalaran Red
    44716, -- Mysterious Fermented Liquid
    46797, -- Mulgore Sweet Potato
    44837, -- Spice Bread Stuffing
    44838, -- Slow-Roasted Turkey
    44839, -- Candied Sweet Potato
    44840, -- Cranberry Chutney
    44854, -- Tangy Wetland Cranberries
    44855, -- Teldrassil Sweet Potato
    46690, -- Candy Skull
    46784, -- Ripe Elwynn Pumpkin
    46793, -- Tangy Southfury Cranberries
    46796, -- Ripe Tirisfal Pumpkin
    44836, -- Pumpkin Pie
    44618, -- Glass of Aged Dalaran Red
    44619} -- Glass of Peaked Dalaran Red
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][CONSUMABLES_ID][C_ITEM_ENHANCEMENTS_ID] = {
    36899, -- Exceptional Mana Oil
    46006, -- Glow Worm

    44133, -- Greater Inscription of the Axe
    44134, -- Greater Inscription of the Crag
    44136, -- Greater Inscription of the Pinnacle
    50335, -- Greater Inscription of the Axe
    50336, -- Greater Inscription of the Crag
    50337, -- Greater Inscription of the Pinnacle
    50338, -- Greater Inscription of the Storm
    38373, -- Frosthide Leg Armor
    38374, -- Icescale Leg Armor
    41602, -- Brilliant Spellthread
    41604, -- Sapphire Spellthread
    44957, -- Greater Inscription of the Gladiator
    44963, -- Earthen Leg Armor
    41167, -- Heartseeker Scope
    41601, -- Shining Spellthread
    41603, -- Azure Spellthread
    44067, -- Inscription of Triumph
    44068, -- Inscription of Dominance
    44129, -- Lesser Inscription of the Storm 
    44130, -- Lesser Inscription of the Crag
    44131, -- Lesser Inscription of the Axe
    44132, -- Lesser Inscription of the Pinnacle
    44936, -- Titanium Plating
    38376, -- Heavy Borean Armor Kit
    41976, -- Titanium Weapon Chain
    42500, -- Titanium Shield Spike
    38375, -- Borean Armor Kit
    44135, -- Greater Inscription of the Storm
    38372, -- Nerubian Leg Armor
    38371, -- Jormungar Leg Armor
    44739, -- Diamond-Cut Refractor Scope
    41146, -- Sun Scope
    38963, -- Enchant Weapon - Exceptional Versatility
    38965, -- Enchant Weapon - Icebreaker
    38972, -- Enchant Weapon - Lifeward
    38981, -- Enchant 2H Weapon - Scourgebane
    38988, -- Enchant Weapon - Giant Slayer
    38991, -- Enchant Weapon - Exceptional Spellpower
    38992, -- Enchant 2H Weapon - Greater Savagery
    38995, -- Enchant Weapon - Exceptional Agility
    38998, -- Enchant Weapon - Deathfrost
    43987, -- Enchant Weapon - Black Magic
    44453, -- Enchant Weapon - Greater Potency
    44463, -- Enchant 2H Weapon - Massacre
    44466, -- Enchant Weapon - Superior Potency
    44467, -- Enchant Weapon - Mighty Spellpower
    44493, -- Enchant Weapon - Berserking
    44497, -- Enchant Weapon - Accuracy
    45056, -- Enchant Staff - Greater Spellpower
    45060, -- Enchant Staff - Spellpower
    38912, -- Enchant Chest - Exceptional Mana
    38951, -- Enchant Gloves - Haste
    38953, -- Enchant Gloves - Precision
    38954, -- Enchant Shield - Dodge
    38955, -- Enchant Chest - Mighty Health
    38959, -- Enchant Cloak - Superior Agility
    38961, -- Enchant Boots - Greater Versatility
    38962, -- Enchant Chest - Greater Versatility
    38964, -- Enchant Gloves - Greater Assault
    38966, -- Enchant Boots - Greater Fortitude
    38967, -- Enchant Gloves - Major Agility
    38948, -- Enchant Weapon - Executioner
    38971, -- Enchant Bracer - Assault
    38973, -- Enchant Cloak - Minor Power
    38974, -- Enchant Boots - Greater Vitality
    38975, -- Enchant Chest - Exceptional Resilience
    38976, -- Enchant Boots - Superior Agility
    38978, -- Enchant Cloak - Superior Dodge
    38979, -- Enchant Gloves - Exceptional Spellpower
    38980, -- Enchant Bracer - Major Versatility
    38984, -- Enchant Bracer - Haste
    38986, -- Enchant Boots - Icewalker
    38987, -- Enchant Bracer - Greater Stats
    38989, -- Enchant Chest - Super Stats
    38990, -- Enchant Gloves - Armsman
    38993, -- Enchant Cloak - Shadow Armor
    38997, -- Enchant Bracer - Greater Spellpower
    39001, -- Enchant Cloak - Mighty Stamina
    39002, -- Enchant Chest - Greater Dodge
    39003, -- Enchant Cloak - Greater Speed
    39004, -- Enchant Cloak - Wisdom
    39005, -- Enchant Chest - Super Health
    39006, -- Enchant Boots - Tuskarr's Vitality
    44449, -- Enchant Boots - Assault
    44455, -- Shield Enchant - Greater Intellect
    44456, -- Enchant Cloak - Speed
    44457, -- Enchant Cloak - Major Agility
    44458, -- Enchant Gloves - Crusher
    44465, -- Enchant Chest - Powerful Stats
    44469, -- Enchant Boots - Greater Assault
    44470, -- Enchant Bracer - Superior Spellpower
    44815, -- Enchant Bracer - Greater Assault
    44947, -- Enchant Bracer - Major Stamina
    38968, -- Enchant Bracer - Exceptional Intellect
    38917, -- Enchant Weapon - Major Striking
    38918, -- Enchant Weapon - Major Intellect
    38919, -- Enchant 2H Weapon - Savagery
    38920, -- Enchant Weapon - Potency
    38921, -- Enchant Weapon - Major Spellpower
    38922, -- Enchant 2H Weapon - Major Agility
    38923, -- Enchant Weapon - Sunfire
    38924, -- Enchant Weapon - Soulfrost
    38925, -- Enchant Weapon - Mongoose
    38926, -- Enchant Weapon - Spellsurge
    38927, -- Enchant Weapon - Battlemaster
    38946, -- Enchant Weapon - Major Healing
    38947, -- Enchant Weapon - Greater Agility
    37603, -- Enchant Boots - Dexterity
    38895, -- Enchant Cloak - Dodge
    38897, -- Enchant Bracer - Brawn
    38898, -- Enchant Bracer - Stats
    38899, -- Enchant Bracer - Greater Dodge
    38900, -- Enchant Bracer - Superior Healing
    38901, -- Enchant Bracer - Versatility Prime
    38902, -- Enchant Bracer - Fortitude
    38903, -- Enchant Bracer - Spellpower
    38904, -- Enchant Shield - Lesser Dodge
    38905, -- Enchant Shield - Intellect
    38906, -- Enchant Shield - Parry
    38908, -- Enchant Boots - Vitality
    38909, -- Enchant Boots - Fortitude
    38910, -- Enchant Boots - Surefooted
    38911, -- Enchant Chest - Exceptional Health
    38913, -- Enchant Chest - Exceptional Stats
    38914, -- Enchant Cloak - Major Armor
    38928, -- Enchant Chest - Major Versatility
    38929, -- Enchant Chest - Versatility Prime
    38930, -- Enchant Chest - Major Resilience
    38931, -- Enchant Gloves - Blasting
    38932, -- Enchant Gloves - Precise Strikes
    38933, -- Enchant Gloves - Major Strength
    38934, -- Enchant Gloves - Assault
    38935, -- Enchant Gloves - Major Spellpower
    38936, -- Enchant Gloves - Major Healing
    38937, -- Enchant Bracer - Major Intellect
    38938, -- Enchant Bracer - Lesser Assault
    38939, -- Enchant Cloak - PvP Power
    38940, -- Enchant Cloak - Greater Agility
    38943, -- Enchant Boots - Cat's Swiftness
    38944, -- Enchant Boots - Boar's Speed
    38945, -- Enchant Shield - Major Stamina
    38949, -- Enchant Shield - Resilience
    38999, -- Enchant Chest - Dodge
    39000, -- Enchant Cloak - Greater Dodge
    38805, -- Enchant Shield - Lesser Stamina
    38772, -- Enchant 2H Weapon - Minor Impact
    38780, -- Enchant Weapon - Minor Striking
    38781, -- Enchant 2H Weapon - Lesser Intellect
    38788, -- Enchant 2H Weapon - Lesser Versatility
    38794, -- Enchant Weapon - Lesser Striking
    38796, -- Enchant 2H Weapon - Lesser Impact
    38813, -- Enchant Weapon - Lesser Beastslayer
    38814, -- Enchant Weapon - Lesser Elemental Slayer
    38821, -- Enchant Weapon - Striking
    38822, -- Enchant 2H Weapon - Impact
    38838, -- Enchant Weapon - Fiery Weapon
    38840, -- Enchant Weapon - Demonslaying
    38845, -- Enchant 2H Weapon - Greater Impact
    38848, -- Enchant Weapon - Greater Striking
    38868, -- Enchant Weapon - Icy Chill
    38869, -- Enchant 2H Weapon - Superior Impact
    38870, -- Enchant Weapon - Superior Striking
    38871, -- Enchant Weapon - Lifestealing
    38872, -- Enchant Weapon - Unholy Weapon
    38873, -- Enchant Weapon - Crusader
    38874, -- Enchant 2H Weapon - Major Versatility
    38875, -- Enchant 2H Weapon - Major Intellect
    38876, -- Enchant Weapon - Winter's Might
    38877, -- Enchant Weapon - Spellpower
    38878, -- Enchant Weapon - Healing Power
    38879, -- Enchant Weapon - Strength
    38880, -- Enchant Weapon - Agility
    38883, -- Enchant Weapon - Mighty Versatility
    38884, -- Enchant Weapon - Mighty Intellect
    38896, -- Enchant 2H Weapon - Agility
    46026, -- Enchant Weapon - Blade Ward
    46098, -- Enchant Weapon - Blood Draining
    38679, -- Enchant Bracer - Minor Health
    38766, -- Enchant Chest - Minor Health
    38767, -- Enchant Chest - Minor Absorption
    38768, -- Enchant Bracer - Minor Dodge
    38769, -- Enchant Chest - Minor Mana
    38771, -- Enchant Bracer - Minor Stamina
    38773, -- Enchant Chest - Lesser Health
    38774, -- Enchant Bracer - Minor Versatility
    38775, -- Enchant Cloak - Minor Protection
    38776, -- Enchant Chest - Lesser Mana
    38777, -- Enchant Bracer - Minor Agility
    38778, -- Enchant Bracer - Minor Strength
    38782, -- Enchant Chest - Health
    38783, -- Enchant Bracer - Lesser Versatility
    38785, -- Enchant Boots - Minor Stamina
    38786, -- Enchant Boots - Minor Agility
    38787, -- Enchant Shield - Minor Stamina
    38789, -- Enchant Cloak - Minor Agility
    38790, -- Enchant Cloak - Lesser Protection
    38791, -- Enchant Shield - Lesser Protection
    38792, -- Enchant Shield - Lesser Versatility
    38793, -- Enchant Bracer - Lesser Stamina
    38797, -- Enchant Bracer - Lesser Strength
    38798, -- Enchant Chest - Lesser Absorption
    38799, -- Enchant Chest - Mana
    38800, -- Enchant Gloves - Mining
    38801, -- Enchant Gloves - Herbalism
    38802, -- Enchant Gloves - Fishing
    38803, -- Enchant Bracer - Lesser Intellect
    38804, -- Enchant Chest - Minor Stats
    38779, -- Enchant Weapon - Minor Beastslayer
    38806, -- Enchant Cloak - Defense
    38807, -- Enchant Boots - Lesser Agility
    38808, -- Enchant Chest - Greater Health
    38809, -- Enchant Bracer - Versatility
    38810, -- Enchant Boots - Lesser Stamina
    38811, -- Enchant Bracer - Lesser Dodge
    38812, -- Enchant Bracer - Stamina
    38816, -- Enchant Shield - Versatility
    38817, -- Enchant Bracer - Strength
    38818, -- Enchant Chest - Greater Mana
    38819, -- Enchant Boots - Lesser Versatility
    38820, -- Enchant Shield - Lesser Parry
    38823, -- Enchant Gloves - Skinning
    38824, -- Enchant Chest - Lesser Stats
    38825, -- Enchant Cloak - Greater Defense
    38827, -- Enchant Gloves - Agility
    38828, -- Enchant Shield - Stamina
    38829, -- Enchant Bracer - Intellect
    38830, -- Enchant Boots - Stamina
    38831, -- Enchant Gloves - Advanced Mining
    38832, -- Enchant Bracer - Greater Versatility
    38833, -- Enchant Chest - Superior Health
    38834, -- Enchant Gloves - Advanced Herbalism
    38835, -- Enchant Cloak - Lesser Agility
    38836, -- Enchant Gloves - Strength
    38837, -- Enchant Boots - Minor Speed
    38839, -- Enchant Shield - Greater Versatility
    38841, -- Enchant Chest - Superior Mana
    38842, -- Enchant Bracer - Dodge
    38844, -- Enchant Boots - Agility
    38846, -- Enchant Bracer - Greater Strength
    38847, -- Enchant Chest - Stats
    38849, -- Enchant Bracer - Greater Stamina
    38850, -- Enchant Gloves - Riding Skill
    38851, -- Enchant Gloves - Minor Haste
    38852, -- Enchant Bracer - Greater Intellect
    38853, -- Enchant Bracer - Superior Versatility
    38854, -- Enchant Bracer - Superior Strength
    38855, -- Enchant Bracer - Superior Stamina
    38856, -- Enchant Gloves - Greater Agility
    38857, -- Enchant Gloves - Greater Strength
    38859, -- Enchant Cloak - Superior Defense
    38860, -- Enchant Shield - Vitality
    38861, -- Enchant Shield - Greater Stamina
    38862, -- Enchant Boots - Greater Stamina
    38863, -- Enchant Boots - Greater Agility
    38864, -- Enchant Boots - Versatility
    38865, -- Enchant Chest - Greater Stats
    38866, -- Enchant Chest - Major Health
    38867, -- Enchant Chest - Major Mana
    38881, -- Enchant Bracer - Argent Versatility
    38882, -- Enchant Bracer - Healing Power
    38885, -- Enchant Gloves - Threat
    38886, -- Enchant Gloves - Shadow Power
    38887, -- Enchant Gloves - Frost Power
    38888, -- Enchant Gloves - Fire Power
    38889, -- Enchant Gloves - Healing Power
    38890, -- Enchant Gloves - Superior Agility
    38893, -- Enchant Cloak - Stealth
    38894, -- Enchant Cloak - Subtlety
    38960, -- Enchant Gloves - Gatherer
    45628, -- Enchant Boots - Lesser Accuracy
    50816} -- Enchant Gloves - Angler
DatabaseIDs[WRATH_OF_THE_LICH_KING_ID][CONSUMABLES_ID][C_POTIONS_ID] = {
    40215, -- Mighty Frost Protection Potion
    43569, -- Endless Healing Potion
    33447, -- Runic Healing Potion
    33448, -- Runic Mana Potion
    40077, -- Crazy Alchemist's Potion
    40081, -- Potion of Nightmares
    40087, -- Powerful Rejuvenation Potion
    40093, -- Indestructible Potion
    40211, -- Potion of Speed
    40212, -- Potion of Wild Magic
    40213, -- Mighty Arcane Protection Potion
    40214, -- Mighty Fire Protection Potion
    43570, -- Endless Mana Potion
    40216, -- Mighty Nature Protection Potion
    40217, -- Mighty Shadow Protection Potion
    41166, -- Runic Healing Injector
    42545, -- Runic Mana Injector
    39671, -- Resurgent Healing Potion
    40067, -- Icy Mana Potion
    38351, -- Murliver Oil
    43530, -- Argent Mana Potion
    39327, -- Noth's Special Brew
    43531, -- Argent Healing Potion
    36770} -- Zort's Protective Elixir
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
DatabaseIDs[THE_BURNING_CRUSADE_ID][CONSUMABLES_ID][C_BANDAGES_ID] = {
    21991, -- Heavy Netherweave Bandage
    21990} -- Netherweave Bandage
DatabaseIDs[THE_BURNING_CRUSADE_ID][CONSUMABLES_ID][C_ELIXIRS_ID] = {
    22835, -- Elixir of Major Shadow Power
    22848, -- Elixir of Empowerment
    34537, -- Bloodberry Elixir
    22840, -- Elixir of Major Mageblood
    22834, -- Elixir of Major Defense
    31679, -- Fel Strength Elixir
    22831, -- Elixir of Major Agility
    32068, -- Elixir of Ironskin
    22830, -- Elixir of the Searching Eye
    22827, -- Elixir of Major Frost Power
    22833, -- Elixir of Major Firepower
    32067, -- Elixir of Draenic Wisdom
    28104, -- Elixir of Mastery
    32063, -- Earthen Elixir
    22823, -- Elixir of Camouflage
    22824, -- Elixir of Major Strength
    22825, -- Elixir of Healing Power
    32062, -- Elixir of Major Fortitude
    25539, -- Potion of Water Breathing
    28102, -- Onslaught Elixir
    28103, -- Adept's Elixir
    34130, -- Recovery Diver's Potion
    23444} -- Goldenmist Special Brew
DatabaseIDs[THE_BURNING_CRUSADE_ID][CONSUMABLES_ID][C_FLASKS_ID] = {
    32599, -- Unstable Flask of the Bandit
    22851, -- Flask of Fortification
    22854, -- Flask of Relentless Assault
    22861, -- Flask of Blinding Light
    22866, -- Flask of Pure Death
    32596, -- Unstable Flask of the Elder
    32597, -- Unstable Flask of the Soldier
    32598, -- Unstable Flask of the Beast
    22853, -- Flask of Mighty Versatility
    32600, -- Unstable Flask of the Physician
    32601, -- Unstable Flask of the Sorcerer
    32898, -- Shattrath Flask of Fortification
    32899, -- Shattrath Flask of Mighty Restoration
    32900, -- Shattrath Flask of Supreme Power
    32900, -- Shattrath Flask of Supreme Power
    32901, -- Shattrath Flask of Relentless Assault
    35716, -- Shattrath Flask of Pure Death
    35717} -- Shattrath Flask of Blinding Light
DatabaseIDs[THE_BURNING_CRUSADE_ID][CONSUMABLES_ID][C_FOOD_DRINKS_ID] = {
    28112, -- Underspore Pod
    22018, -- Conjured Glacier Water
    27860, -- Purified Draenic Water
    29394, -- Lyribread
    29395, -- Ethermead
    29401, -- Sparkling Southshore Cider
    29448, -- Mag'har Mild Cheese
    29449, -- Bladespire Bagel
    29450, -- Telaari Grapes
    29451, -- Clefthoof Ribs
    29452, -- Zangar Trout
    29453, -- Sporeggar Mushroom
    30355, -- Grilled Shadowmoon Tuber
    30357, -- Oronok's Tuber of Healing
    30358, -- Oronok's Tuber of Agility
    30359, -- Oronok's Tuber of Strength
    30361, -- Oronok's Tuber of Spell Power
    30457, -- Gilneas Sparkling Water
    32453, -- Star's Tears
    32667, -- Bash Ale
    22019, -- Conjured Croissant
    32685, -- Ogri'la Chicken Fingers
    32686, -- Mingo's Fortune Giblets
    32722, -- Enriched Terocone Juice
    33042, -- Black Coffee
    33048, -- Stewed Trout
    33052, -- Fisherman's Feast
    33053, -- Hot Buttered Trout
    33825, -- Skullfish Soup
    33872, -- Spicy Hot Talbuk
    34062, -- Conjured Mana Biscuit
    34411, -- Hot Apple Cider
    34780, -- Naaru Ration
    38428, -- Rock-Salted Pretzel
    38431, -- Blackrock Fortified Water
    32668, -- Dos Ogris
    28399, -- Filtered Draenic Water
    29454, -- Silverwine
    30703, -- Conjured Mountain Spring Water
    38430, -- Blackrock Mineral Water
    24008, -- Dried Mushroom Rations
    24009, -- Dried Fruit Rations
    24338, -- Hellfire Spineleaf
    24539, -- Marsh Lichen
    27651, -- Buzzard Bites
    27655, -- Ravager Dog
    27657, -- Blackened Basilisk
    27658, -- Roasted Clefthoof
    27659, -- Warp Burger
    27660, -- Talbuk Steak
    27661, -- Blackened Trout
    27662, -- Feltail Delight
    27663, -- Blackened Sporefish
    27664, -- Grilled Mudfish
    27665, -- Poached Bluefish
    27666, -- Golden Fish Sticks
    27667, -- Spicy Crawdad
    27854, -- Smoked Talbuk Venison
    27855, -- Mag'har Grainbread
    27856, -- Skethyl Berries
    27857, -- Garadar Sharp
    27858, -- Sunspring Carp
    27859, -- Zangar Caps
    28486, -- Moser's Magnificent Muffin
    28501, -- Ravager Egg Omelet
    29292, -- Helboar Bacon
    29393, -- Diamond Berries
    29412, -- Jessen's Special Slop
    30155, -- Clam Bar
    30458, -- Stromgarde Muenster
    30610, -- Smoked Black Bear Meat
    31672, -- Mok'Nathal Shortribs
    31673, -- Crunchy Serpent
    32455, -- Star's Lament
    32721, -- Skyguard Rations
    33866, -- Stormchops
    33867, -- Broiled Bloodfin
    38427, -- Pickled Egg
    35563, -- Charred Bear Kabobs
    38429, -- Blackrock Spring Water
    35565, -- Juicy Bear Burger
    35720, -- Lord of Frost's Private Label
    23848, -- Nethergarde Bitter
    38466, -- Sulfuron Slammer
    38432, -- Plugger's Blackrock Ale
    24105, -- Roasted Moongraze Tenderloin
    27635, -- Lynx Steak
    22645, -- Crunchy Spider Surprise
    24072, -- Sand Pear Pie
    27636, -- Bat Bites
    20857, -- Honey Bread
    23495, -- Springpaw Appetizer
    23756, -- Cookie's Jumbo Gumbo
    28284, -- Don Carlos Tequila
    29112, -- Cenarion Spirits
    30816, -- Spice Bread
    33874, -- Kibler's Bits
    33924, -- Delicious Chocolate Cake
    34832} -- Captain Rumsey's Lager
DatabaseIDs[THE_BURNING_CRUSADE_ID][CONSUMABLES_ID][C_ITEM_ENHANCEMENTS_ID] = {
    31535, -- Bloodboil Poison
    28421, -- Adamantite Weightstone
    23576, -- Greater Ward of Shielding
    25521, -- Greater Rune of Warding
    34538, -- Blessed Weapon Coating
    34539, -- Righteous Weapon Coating
    23529, -- Adamantite Sharpening Stone
    22522, -- Superior Wizard Oil
    23559, -- Lesser Rune of Warding
    23575, -- Lesser Ward of Shielding
    22521, -- Superior Mana Oil
    23528, -- Fel Sharpening Stone
    25679, -- Comfortable Insoles
    28420, -- Fel Weightstone
    34861, -- Sharpened Fish Hook

    24274, -- Runic Spellthread
    23766, -- Stabilized Eternium Scope
    24276, -- Golden Spellthread
    29535, -- Nethercobra Leg Armor
    29536, -- Nethercleft Leg Armor
    23765, -- Khorium Scope
    28886, -- Greater Inscription of Discipline
    28887, -- Greater Inscription of Faith
    28888, -- Greater Inscription of Vengeance
    28889, -- Greater Inscription of Warding
    28909, -- Greater Inscription of the Orb
    28910, -- Greater Inscription of the Blade
    28911, -- Greater Inscription of the Knight
    28912, -- Greater Inscription of the Oracle
    23530, -- Felsteel Shield Spike
    29187, -- Inscription of Endurance
    34207, -- Glove Reinforcements
    34836, -- Spun Truesilver Fishing Line
    34330, -- Heavy Knothide Armor Kit
    24273, -- Mystic Spellthread
    29533, -- Cobrahide Leg Armor
    29534, -- Clefthide Leg Armor
    23764, -- Adamantite Scope
    24275, -- Silver Spellthread
    25651, -- Vindicator's Armor Kit
    25652, -- Magister's Armor Kit
    28878, -- Inscription of Faith
    28881, -- Inscription of Discipline
    28882, -- Inscription of Warding
    28885, -- Inscription of Vengeance
    28903, -- Inscription of the Orb
    28904, -- Inscription of the Oracle
    28907, -- Inscription of the Blade
    28908, -- Inscription of the Knight
    33185, -- Adamantite Weapon Chain
    25650} -- Knothide Armor Kit
DatabaseIDs[THE_BURNING_CRUSADE_ID][CONSUMABLES_ID][C_POTIONS_ID] = {
    22850, -- Super Rejuvenation Potion
    34440, -- Mad Alchemist's Potion
    22849, -- Ironshield Potion
    31677, -- Fel Mana Potion
    22836, -- Major Dreamless Sleep Potion
    22837, -- Heroic Potion
    22838, -- Haste Potion
    22839, -- Destruction Potion
    22841, -- Major Fire Protection Potion
    22842, -- Major Frost Protection Potion
    22844, -- Major Nature Protection Potion
    22845, -- Major Arcane Protection Potion
    22846, -- Major Shadow Protection Potion
    22847, -- Major Holy Protection Potion
    31838, -- Major Combat Healing Potion
    31839, -- Major Combat Healing Potion
    31840, -- Major Combat Mana Potion
    31841, -- Major Combat Mana Potion
    31852, -- Major Combat Healing Potion
    31853, -- Major Combat Healing Potion
    31854, -- Major Combat Mana Potion
    31855, -- Major Combat Mana Potion
    32783, -- Blue Ogre Brew
    32784, -- Red Ogre Brew
    32840, -- Major Arcane Protection Potion
    32844, -- Major Nature Protection Potion
    32845, -- Major Shadow Protection Potion
    32846, -- Major Fire Protection Potion
    32847, -- Major Frost Protection Potion
    32909, -- Blue Ogre Brew Special
    32910, -- Red Ogre Brew Special
    35287, -- Luminous Bluetail
    23823, -- Mana Potion Injector
    33093, -- Mana Potion Injector
    31676, -- Fel Regeneration Potion
    22832, -- Super Mana Potion
    32902, -- Bottled Nethergon Energy
    32903, -- Cenarion Mana Salve
    32948, -- Auchenai Mana Potion
    22871, -- Shrouding Potion
    23822, -- Healing Potion Injector
    33092, -- Healing Potion Injector
    22829, -- Super Healing Potion
    32904, -- Cenarion Healing Salve
    32905, -- Bottled Nethergon Vapor
    32947, -- Auchenai Healing Potion
    22828, -- Insane Strength Potion
    22826, -- Sneaking Potion
    28101, -- Unstable Mana Potion
    33935, -- Crystal Mana Potion
    28100, -- Volatile Healing Potion
    33934} -- Crystal Healing Potion
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
DatabaseIDs[CLASSIC_ID][CONSUMABLES_ID][C_BANDAGES_ID] = {
    14530, -- Heavy Runecloth Bandage
    19307, -- Alterac Heavy Runecloth Bandage
    20066, -- Arathi Basin Runecloth Bandage
    20234, -- Defiler's Runecloth Bandage
    20243, -- Highlander's Runecloth Bandage
    19066, -- Warsong Gulch Runecloth Bandage
    14529, -- Runecloth Bandage
    19067, -- Warsong Gulch Mageweave Bandage
    20065, -- Arathi Basin Mageweave Bandage
    20232, -- Defiler's Mageweave Bandage
    20237, -- Highlander's Mageweave Bandage
    19068, -- Warsong Gulch Silk Bandage
    20067, -- Arathi Basin Silk Bandage
    20235, -- Defiler's Silk Bandage
    20244, -- Highlander's Silk Bandage
    1251, -- Linen Bandage
    2581, -- Heavy Linen Bandage
    3530, -- Wool Bandage
    3531, -- Heavy Wool Bandage
    6450, -- Silk Bandage
    6451, -- Heavy Silk Bandage
    8544, -- Mageweave Bandage
    8545} -- Heavy Mageweave Bandage
DatabaseIDs[CLASSIC_ID][CONSUMABLES_ID][C_ELIXIRS_ID] = {
    20079, -- Spirit of Zanza
    20080, -- Sheen of Zanza
    20081, -- Swiftness of Zanza
    20004, -- Mighty Troll's Blood Elixir
    13454, -- Greater Arcane Elixir
    13452, -- Elixir of the Mongoose
    13453, -- Elixir of Brute Force
    13447, -- Elixir of the Sages
    13445, -- Elixir of Superior Defense
    9224, -- Elixir of Demonslaying
    9233, -- Elixir of Detect Demon
    9264, -- Elixir of Shadow Power
    12820, -- Winterfall Firewater
    20007, -- Mageblood Elixir
    8827, -- Elixir of Water Walking
    21546, -- Elixir of Greater Firepower
    9088, -- Gift of Arthas
    9187, -- Elixir of Greater Agility
    9197, -- Elixir of Dream Vision
    9206, -- Elixir of Giants
    9155, -- Arcane Elixir
    9179, -- Elixir of Greater Intellect
    9154, -- Elixir of Detect Undead
    8529, -- Noggenfogger Elixir
    18294, -- Elixir of Greater Water Breathing
    10592, -- Catseye Elixir
    3828, -- Elixir of Detect Lesser Invisibility
    8951, -- Elixir of Greater Defense
    17708, -- Elixir of Frost Power
    8949, -- Elixir of Agility
    3826, -- Major Troll's Blood Elixir
    3825, -- Elixir of Fortitude
    3391, -- Elixir of Ogre's Strength
    6373, -- Elixir of Firepower
    3390, -- Elixir of Lesser Agility
    3389, -- Elixir of Defense
    3388, -- Strong Troll's Blood Elixir
    3383, -- Elixir of Wisdom
    5996, -- Elixir of Water Breathing
    6662, -- Elixir of Giant Growth
    2457, -- Elixir of Minor Agility
    2458, -- Elixir of Minor Fortitude
    3382, -- Weak Troll's Blood Elixir
    2454, -- Elixir of Lion's Strength
    5997, -- Elixir of Minor Defense
    8410, -- R.O.I.D.S.
    8411, -- Lung Juice Cocktail
    8412, -- Ground Scorpok Assay
    8423, -- Cerebral Cortex Compound
    8424} -- Gizzard Gum
DatabaseIDs[CLASSIC_ID][CONSUMABLES_ID][C_FLASKS_ID] = {
    13510, -- Flask of the Titans
    13511, -- Flask of Distilled Wisdom
    13512} -- Flask of Supreme Powe
DatabaseIDs[CLASSIC_ID][CONSUMABLES_ID][C_FOOD_DRINKS_ID] = {
    8079, -- Conjured Crystal Water
    12003, -- Dark Dwarven Lager
    19696, -- Harvest Bread
    19994, -- Harvest Fruit
    19995, -- Harvest Boar
    19996, -- Harvest Fish
    20031, -- Essence Mango
    20516, -- Bobbing Apple
    21023, -- Dirge's Kickin' Chimaerok Chops
    21235, -- Winter Veil Roast
    21254, -- Winter Veil Cookie
    22895, -- Conjured Cinnamon Roll
    18300, -- Hyjal Nectar
    19301, -- Alterac Manna Biscuit
    13935, -- Baked Salmon
    8932, -- Alterac Swiss
    8948, -- Dried King Bolete
    8950, -- Homemade Cherry Pie
    8952, -- Roasted Quail
    8953, -- Deep Fried Plantains
    8957, -- Spinefin Halibut
    11415, -- Mixed Berries
    11444, -- Grim Guzzler Boar
    11951, -- Whipper Root Tuber
    13724, -- Enriched Manna Biscuit
    13810, -- Blessed Sunfruit
    13893, -- Large Raw Mightfish
    13933, -- Lobster Stew
    13934, -- Mightfish Steak
    8766, -- Morning Glory Dew
    18254, -- Runn Tum Tuber Surprise
    18255, -- Runn Tum Tuber
    19225, -- Deep Fried Candybar
    20452, -- Smoked Desert Dumplings
    21031, -- Cabbage Kimchi
    21033, -- Radish Kimchi
    22324, -- Winter Kimchi
    23160, -- Friendship Bread
    8076, -- Conjured Sweet Roll
    8078, -- Conjured Sparkling Water
    12218, -- Monster Omelet
    16971, -- Clamlette Surprise
    18045, -- Tender Wolf Steak
    21215, -- Graccu's Mince Meat Fruitcake
    12216, -- Spiced Chili Crab
    2595, -- Jug of Badlands Bourbon
    3927, -- Fine Aged Cheddar
    4599, -- Cured Ham Steak
    4601, -- Soft Banana Bread
    4602, -- Moon Harvest Pumpkin
    4608, -- Raw Black Truffle
    6887, -- Spotted Yellowtail
    8075, -- Conjured Sourdough
    8077, -- Conjured Mineral Water
    9681, -- Grilled King Crawler Legs
    12215, -- Heavy Kodo Stew
    12217, -- Dragonbreath Chili
    13546, -- Bloodbelly Fish
    13755, -- Winter Squid
    13927, -- Cooked Glossy Mightfish
    1645, -- Moonberry Juice
    13929, -- Hot Smoked Bass
    13930, -- Filet of Redgill
    13931, -- Nightfin Soup
    13932, -- Poached Sunscale Salmon
    16168, -- Heaven Peach
    16766, -- Undermine Clam Chowder
    17222, -- Spider Sausage
    17402, -- Greatfather's Winter Ale
    17408, -- Spicy Beefstick
    18635, -- Bellara's Nutterbar
    19300, -- Bottled Winterspring Water
    19306, -- Crunchy Frog
    21030, -- Darnassus Kimchi Pie
    21552, -- Striped Yellowtail
    13928, -- Grilled Squid
    21217, -- Sagefish Delight
    6807, -- Frog Leg Stew
    1707, -- Stormwind Brie
    2594, -- Flagon of Dwarven Mead
    3728, -- Tasty Lion Steak
    3729, -- Soothing Turtle Bisque
    3771, -- Wild Hog Shank
    3772, -- Conjured Spring Water
    4457, -- Barbecued Buzzard Wing
    4539, -- Goldenbark Apple
    4544, -- Mulgore Spice Bread
    4594, -- Rockscale Cod
    4600, -- Cherry Grog
    4607, -- Delicious Cave Mold
    4791, -- Enchanted Water
    1487, -- Conjured Pumpernickel
    1708, -- Sweet Nectar
    8364, -- Mithril Head Trout
    10841, -- Goldthorn Tea
    12210, -- Roast Raptor
    12212, -- Jungle Stew
    12213, -- Carrion Surprise
    12214, -- Mystery Stew
    13851, -- Hot Wolf Ribs
    16169, -- Wild Ricecake
    17407, -- Graccu's Homemade Meat Pie
    18632, -- Moonbrook Riot Taffy
    19224, -- Red Hot Wings
    20074, -- Heavy Crocolisk Stew
    6038, -- Giant Clam Scorcho
    5342, -- Raptor Punch
    6657, -- Savory Deviate Delight
    422, -- Dwarven Mild
    733, -- Westfall Stew
    1017, -- Seasoned Wolf Kabob
    1082, -- Redridge Goulash
    1114, -- Conjured Rye
    1205, -- Melon Juice
    2136, -- Conjured Purified Water
    2593, -- Flask of Stormwind Tawny
    2596, -- Skin of Dwarven Stout
    2685, -- Succulent Pork Ribs
    3663, -- Murloc Fin Soup
    3664, -- Crocolisk Gumbo
    3665, -- Curiously Tasty Omelet
    3666, -- Gooey Spider Cake
    3726, -- Big Bear Steak
    3727, -- Hot Lion Chops
    3770, -- Mutton Chop
    4538, -- Snapvine Watermelon
    4542, -- Moist Cornbread
    4593, -- Bristle Whisker Catfish
    4606, -- Spongy Morel
    5478, -- Dig Rat Stew
    5479, -- Crispy Lizard Tail
    5480, -- Lean Venison
    5526, -- Clam Chowder
    5527, -- Goblin Deviled Clams
    6522, -- Deviate Fish
    7228, -- Tigule and Foror's Strawberry Ice Cream
    9451, -- Bubbling Water
    11846, -- Wizbang's Special Brew
    12209, -- Lean Wolf Steak
    16170, -- Steamed Mandu
    17403, -- Steamwheedle Fizzy Spirits
    19299, -- Fizzy Faire Drink
    19305, -- Pickled Kodo Foot
    21072, -- Smoked Sagefish
    414, -- Dalaran Sharp
    961, -- Healing Herb
    1113, -- Conjured Bread
    1179, -- Ice Cold Milk
    1326, -- Sauteed Sunfish
    2287, -- Haunch of Meat
    2288, -- Conjured Fresh Water
    2682, -- Cooked Crab Claw
    2683, -- Crab Cake
    2684, -- Coyote Steak
    2687, -- Dry Pork Ribs
    3220, -- Blood Sausage
    3448, -- Senggin Root
    3662, -- Crocolisk Steak
    4537, -- Tel'Abim Banana
    4541, -- Freshly Baked Bread
    4592, -- Longjaw Mud Snapper
    724, -- Goretusk Liver Pie
    5066, -- Fissure Plant
    5095, -- Rainbow Fin Albacore
    5476, -- Fillet of Frenzy
    5477, -- Strider Stew
    5525, -- Boiled Clams
    6316, -- Loch Frenzy Delight
    6890, -- Smoked Bear Meat
    7676, -- Thistle Tea
    11584, -- Cactus Apple Surprise
    12238, -- Darkshore Grouper
    16167, -- Versicolor Treat
    17119, -- Deeprun Rat Kabob
    17404, -- Blended Bean Brew
    17406, -- Holiday Cheesewheel
    18633, -- Styleen's Sour Suckerpop
    19304, -- Spiced Beef Jerky
    4605, -- Red-Speckled Mushroom
    1401, -- Riverpaw Tea Leaf
    117, -- Tough Jerky
    159, -- Refreshing Spring Water
    787, -- Slitherskin Mackerel
    2070, -- Darnassian Bleu
    2679, -- Charred Wolf Meat
    2680, -- Spiced Wolf Meat
    21721, -- Moonglow
    2686, -- Thunder Ale
    2723, -- Bottle of Dalaran Noir
    2888, -- Beer Basted Boar Ribs
    2894, -- Rhapsody Malt
    3703, -- Southshore Stout
    4536, -- Shiny Red Apple
    4540, -- Tough Hunk of Bread
    4595, -- Junglevine Wine
    4604, -- Forest Mushroom Cap
    4656, -- Small Pumpkin
    5057, -- Ripe Watermelon
    5349, -- Conjured Muffin
    5350, -- Conjured Water
    5472, -- Kaldorei Spider Kabob
    5473, -- Scorpid Surprise
    5474, -- Roasted Kodo Meat
    6290, -- Brilliant Smallfish
    6299, -- Sickly Looking Fish
    6888, -- Herb Baked Egg
    7097, -- Leg Meat
    7806, -- Lollipop
    7807, -- Candy Bar
    7808, -- Chocolate Square
    9260, -- Volatile Rum
    9360, -- Cuergo's Gold
    9361, -- Cuergo's Gold with Worm
    11109, -- Special Chicken Feed
    12224, -- Crispy Bat Wing
    16166, -- Bean Soup
    17196, -- Holiday Spirits
    17197, -- Gingerbread Cookie
    17198, -- Winter Veil Egg Nog
    17344, -- Candy Cane
    18287, -- Evermurky
    18288, -- Molasses Firewater
    19221, -- Darkmoon Special Reserve
    19222, -- Cheap Beer
    19223, -- Darkmoon Dog
    20709, -- Rumsey Rum Light
    21114, -- Rumsey Rum Dark
    21151, -- Rumsey Rum Black Label
    2681} -- Roasted Boar Meat
DatabaseIDs[CLASSIC_ID][CONSUMABLES_ID][C_ITEM_ENHANCEMENTS_ID] = {
    18262, -- Elemental Sharpening Stone
    23122, -- Consecrated Sharpening Stone
    20748, -- Brilliant Mana Oil
    20749, -- Brilliant Wizard Oil
    23123, -- Blessed Wizard Oil
    20750, -- Wizard Oil
    20747, -- Lesser Mana Oil
    12404, -- Dense Sharpening Stone
    12643, -- Dense Weightstone
    3829, -- Frost Oil
    20746, -- Lesser Wizard Oil
    7964, -- Solid Sharpening Stone
    7965, -- Solid Weightstone
    3824, -- Shadow Oil
    6532, -- Bright Baubles
    6533, -- Aquadynamic Fish Attractor
    7307, -- Flesh Eating Worm
    20745, -- Minor Mana Oil
    2871, -- Heavy Sharpening Stone
    3241, -- Heavy Weightstone
    6530, -- Nightcrawlers
    6811, -- Aquadynamic Fish Lens
    2863, -- Coarse Sharpening Stone
    3240, -- Coarse Weightstone
    20744, -- Minor Wizard Oil
    6529, -- Shiny Bauble
    2862, -- Rough Sharpening Stone
    3239, -- Rough Weightstone

    11648, -- Lesser Arcanum of Voracity
    23545, -- Power of the Scourge
    23548, -- Might of the Scourge
    23549, -- Fortitude of the Scourge
    18251, -- Core Armor Kit
    18283, -- Biznicks 247x128 Accurascope
    19782, -- Presence of Might
    19783, -- Syncretist's Sigil
    19784, -- Death's Embrace
    19785, -- Falcon's Call
    19786, -- Vodouisant's Vigilant Embrace
    19787, -- Presence of Sight
    19788, -- Hoodoo Hex
    19789, -- Prophetic Aura
    19790, -- Animist's Caress
    20076, -- Zandalar Signet of Mojo
    20077, -- Zandalar Signet of Might
    20078, -- Zandalar Signet of Serenity
    22635, -- Savage Guard
    22636, -- Ice Guard
    22638, -- Shadow Guard
    11622, -- Lesser Arcanum of Rumination
    11642, -- Lesser Arcanum of Constitution
    11643, -- Lesser Arcanum of Tenacity
    11645, -- Lesser Arcanum of Voracity
    11646, -- Lesser Arcanum of Voracity
    11647, -- Lesser Arcanum of Voracity
    23547, -- Resilience of the Scourge
    11649, -- Lesser Arcanum of Voracity
    18169, -- Flame Mantle of the Dawn
    18170, -- Frost Mantle of the Dawn
    18171, -- Arcane Mantle of the Dawn
    18172, -- Nature Mantle of the Dawn
    18173, -- Shadow Mantle of the Dawn
    18182, -- Chromatic Mantle of the Dawn
    18329, -- Arcanum of Rapidity
    18330, -- Arcanum of Focus
    18331, -- Arcanum of Protection
    12645, -- Thorium Shield Spike
    15564, -- Rugged Armor Kit
    10548, -- Sniper Scope
    19971, -- High Test Eternium Fishing Line
    7967, -- Mithril Shield Spike
    7969, -- Mithril Spurs
    10546, -- Deadly Scope
    8173, -- Thick Armor Kit
    6041, -- Steel Weapon Chain
    4407, -- Accurate Scope
    6043, -- Iron Counterweight
    4265, -- Heavy Armor Kit
    6042, -- Iron Shield Spike
    4406, -- Standard Scope
    2313, -- Medium Armor Kit
    4405, -- Crude Scope
    2304} -- Light Armor Kit
DatabaseIDs[CLASSIC_ID][CONSUMABLES_ID][C_POTIONS_ID] = {
    13506, -- Potion of Petrification
    18253, -- Major Rejuvenation Potion
    20002, -- Greater Dreamless Sleep Potion
    13444, -- Major Mana Potion
    13456, -- Greater Frost Protection Potion
    13458, -- Greater Nature Protection Potion
    13459, -- Greater Shadow Protection Potion
    13460, -- Greater Holy Protection Potion
    13461, -- Greater Arcane Protection Potion
    13457, -- Greater Fire Protection Potion
    13462, -- Purification Potion
    20008, -- Living Action Potion
    13455, -- Greater Stoneshield Potion
    13446, -- Major Healing Potion
    17348, -- Major Healing Draught
    17351, -- Major Mana Draught
    3386, -- Potion of Curing
    13442, -- Mighty Rage Potion
    13443, -- Superior Mana Potion
    18841, -- Combat Mana Potion
    3387, -- Limited Invulnerability Potion
    9172, -- Invisibility Potion
    3928, -- Superior Healing Potion
    9144, -- Wildvine Potion
    12190, -- Dreamless Sleep Potion
    17349, -- Superior Healing Draught
    17352, -- Superior Mana Draught
    18839, -- Combat Healing Potion
    4623, -- Lesser Stoneshield Potion
    9030, -- Restorative Potion
    6149, -- Greater Mana Potion
    6050, -- Frost Protection Potion
    6052, -- Nature Protection Potion
    5633, -- Great Rage Potion
    3823, -- Lesser Invisibility Potion
    6049, -- Fire Protection Potion
    3827, -- Mana Potion
    1710, -- Greater Healing Potion
    5634, -- Free Action Potion
    6048, -- Shadow Protection Potion
    5816, -- Light of Elune
    3385, -- Lesser Mana Potion
    929, -- Healing Potion
    6051, -- Holy Protection Potion
    6372, -- Swim Speed Potion
    2455, -- Minor Mana Potion
    2456, -- Minor Rejuvenation Potion
    2459, -- Swiftness Potion
    3087, -- Mug of Shimmer Stout
    4596, -- Discolored Healing Potion
    5631, -- Rage Potion
    858, -- Lesser Healing Potion
    118} -- Minor Healing Potion
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