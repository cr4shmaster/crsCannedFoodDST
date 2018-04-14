PrefabFiles = {
    "canned_food",
}

local STRINGS = GLOBAL.STRINGS
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient
local TECH = GLOBAL.TECH
local getConfig = GetModConfigData

STRINGS.NAMES.CANNED_BANANAS = "Canned Bananas"
STRINGS.NAMES.CANNED_BERRIES = "Canned Berries"
STRINGS.NAMES.CANNED_BERRIES_JUICY = "Canned Juicy Berries"
STRINGS.NAMES.CANNED_BLUE_SHROOMS = "Canned Blue Mushrooms"
STRINGS.NAMES.CANNED_CACTUS = "Canned Cactus"
STRINGS.NAMES.CANNED_CARROTS = "Canned Carrots"
STRINGS.NAMES.CANNED_CORN = "Canned Corn"
STRINGS.NAMES.CANNED_DURIANS = "Canned Durians"
STRINGS.NAMES.CANNED_DRAGONFRUITS = "Canned Dragonfruits"
STRINGS.NAMES.CANNED_EELS = "Canned Eels"
STRINGS.NAMES.CANNED_EGGPLANTS = "Canned Eggplants"
STRINGS.NAMES.CANNED_FISH = "Canned Fish"
STRINGS.NAMES.CANNED_GREEN_SHROOMS = "Canned Green Mushrooms"
STRINGS.NAMES.CANNED_HONEY = "Canned Honey"
STRINGS.NAMES.CANNED_POMEGRANATES = "Canned Pomegranates"
STRINGS.NAMES.CANNED_PUMPKINS = "Canned Pumpkins"
STRINGS.NAMES.CANNED_RED_SHROOMS = "Canned Red Mushrooms"
STRINGS.NAMES.CANNED_WATERMELONS = "Canned Watermelons"

-- RECIPES --

local crsRecipeTabs = {
    RECIPETABS.TOOLS,
    RECIPETABS.SURVIVAL,
    RECIPETABS.FARM,
    RECIPETABS.SCIENCE,
    RECIPETABS.TOWN,
    RECIPETABS.REFINE,
    RECIPETABS.MAGIC,
}
local recipeTab = crsRecipeTabs[getConfig("cfgRecipeTab")]

local crsRecipeTechs = {
    TECH.NONE,
    TECH.SCIENCE_ONE, -- Science Machine
    TECH.SCIENCE_TWO, -- Alchemy Engine
    TECH.MAGIC_TWO, -- Prestihatitator
    TECH.MAGIC_THREE, -- Shadow Manipulator
    TECH.ANCIENT_TWO, -- Broken APS
    TECH.ANCIENT_FOUR, -- Repaired APS
    TECH.OBSIDIAN_TWO, -- Obsidian Workbench
}
local recipeTech = crsRecipeTechs[getConfig("cfgRecipeTech")]

local canned_bananas = AddRecipe("canned_bananas", {Ingredient("cave_banana", getConfig("cfgRawBananas")),}, recipeTab, recipeTech, nil, nil, true)
canned_bananas.atlas = "images/inventoryimages/bananas.xml"

local canned_berries = AddRecipe("canned_berries", {Ingredient("berries", getConfig("cfgRawBerries")),}, recipeTab, recipeTech, nil, nil, true)
canned_berries.atlas = "images/inventoryimages/berries.xml"

local canned_berries_juicy = AddRecipe("canned_berries_juicy", {Ingredient("berries_juicy", getConfig("cfgRawBerriesJuicy")),}, recipeTab, recipeTech, nil, nil, true)
canned_berries_juicy.atlas = "images/inventoryimages/berries_juicy.xml"

local canned_blue_shrooms = AddRecipe("canned_blue_shrooms", {Ingredient("blue_cap", getConfig("cfgRawBlueShrooms")),}, recipeTab, recipeTech, nil, nil, true)
canned_blue_shrooms.atlas = "images/inventoryimages/blue_shrooms.xml"

local canned_cactus = AddRecipe("canned_cactus", {Ingredient("cactus_meat", getConfig("cfgRawCactus")),}, recipeTab, recipeTech, nil, nil, true)
canned_cactus.atlas = "images/inventoryimages/cactus.xml"

local canned_carrots = AddRecipe("canned_carrots", {Ingredient("carrot", getConfig("cfgRawCarrots")),}, recipeTab, recipeTech, nil, nil, true)
canned_carrots.atlas = "images/inventoryimages/carrots.xml"

local canned_corn = AddRecipe("canned_corn", {Ingredient("corn", getConfig("cfgRawCorn")),}, recipeTab, recipeTech, nil, nil, true)
canned_corn.atlas = "images/inventoryimages/corn.xml"

local canned_durians = AddRecipe("canned_durians", {Ingredient("durian", getConfig("cfgRawDurians")),}, recipeTab, recipeTech, nil, nil, true)
canned_durians.atlas = "images/inventoryimages/durians.xml"

local canned_dragonfruits = AddRecipe("canned_dragonfruits", {Ingredient("dragonfruit", getConfig("cfgRawDragonfruits")),}, recipeTab, recipeTech, nil, nil, true)
canned_dragonfruits.atlas = "images/inventoryimages/dragonfruits.xml"

local canned_eels = AddRecipe("canned_eels", {Ingredient("eel", getConfig("cfgRawEels")),}, recipeTab, recipeTech, nil, nil, true)
canned_eels.atlas = "images/inventoryimages/eels.xml"

local canned_eggplants = AddRecipe("canned_eggplants", {Ingredient("eggplant", getConfig("cfgRawEggplants")),}, recipeTab, recipeTech, nil, nil, true)
canned_eggplants.atlas = "images/inventoryimages/eggplants.xml"

local canned_fish = AddRecipe("canned_fish", {Ingredient("fish", getConfig("cfgRawFish")),}, recipeTab, recipeTech, nil, nil, true)
canned_fish.atlas = "images/inventoryimages/fish.xml"

local canned_green_shrooms = AddRecipe("canned_green_shrooms", {Ingredient("green_cap", getConfig("cfgRawGreenShrooms")),}, recipeTab, recipeTech, nil, nil, true)
canned_green_shrooms.atlas = "images/inventoryimages/green_shrooms.xml"

local canned_honey = AddRecipe("canned_honey", {Ingredient("honey", getConfig("cfgRawHoney")),}, recipeTab, recipeTech, nil, nil, true)
canned_honey.atlas = "images/inventoryimages/honey.xml"

local canned_pomegranates = AddRecipe("canned_pomegranates", {Ingredient("pomegranate", getConfig("cfgRawPomegranates")),}, recipeTab, recipeTech, nil, nil, true)
canned_pomegranates.atlas = "images/inventoryimages/pomegranates.xml"

local canned_pumpkins = AddRecipe("canned_pumpkins", {Ingredient("pumpkin", getConfig("cfgRawPumpkins")),}, recipeTab, recipeTech, nil, nil, true)
canned_pumpkins.atlas = "images/inventoryimages/pumpkins.xml"

local canned_red_shrooms = AddRecipe("canned_red_shrooms", {Ingredient("red_cap", getConfig("cfgRawRedShrooms")),}, recipeTab, recipeTech, nil, nil, true)
canned_red_shrooms.atlas = "images/inventoryimages/red_shrooms.xml"

local canned_watermelons = AddRecipe("canned_watermelons", {Ingredient("watermelon", getConfig("cfgRawWatermelons")),}, recipeTab, recipeTech, nil, nil, true)
canned_watermelons.atlas = "images/inventoryimages/watermelons.xml"
