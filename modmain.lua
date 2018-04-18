PrefabFiles = {
    "canned_food",
}

local _G = GLOBAL
local STRINGS = _G.STRINGS
local RECIPETABS = _G.RECIPETABS
local Recipe = _G.Recipe
local Ingredient = _G.Ingredient
local TECH = _G.TECH
local getConfig = GetModConfigData
local KnownModIndex = _G.KnownModIndex
local Action = _G.Action
local ActionHandler = _G.ActionHandler
local ACTIONS = _G.ACTIONS

local bbt = KnownModIndex:IsModEnabled("workshop-522117250") -- Check if Birds and Berries and Trees and Flowers for Friends is enabled
local mfr = KnownModIndex:IsModEnabled("workshop-861013495") -- Check if More Fruits is enabled

local crsPrefabs = {
    -- food
    {name = "bananas",          cfg = "Bananas",        raw = "cave_banana"},
    {name = "berries",          cfg = "Berries",        raw = "berries"},
    {name = "berries_juicy",    cfg = "BerriesJuicy",   raw = "berries_juicy"},
    {name = "blue_shrooms",     cfg = "BlueShrooms",    raw = "blue_cap"},
    {name = "cactus",           cfg = "Cactus",         raw = "cactus_meat"},
    {name = "carrots",          cfg = "Carrots",        raw = "carrot"},
    {name = "corn",             cfg = "Corn",           raw = "corn"},
    {name = "durians",          cfg = "Durians",        raw = "durian"},
    {name = "dragonfruits",     cfg = "Dragonfruits",   raw = "dragonfruit"},
    {name = "eels",             cfg = "Eels",           raw = "eel"},
    {name = "eggplants",        cfg = "Eggplants",      raw = "eggplant"},
    {name = "fish",             cfg = "Fish",           raw = "fish"},
    {name = "green_shrooms",    cfg = "GreenShrooms",   raw = "green_cap"},
 -- {name = "honey",            cfg = "Honey",          raw = "honey"},
    {name = "pomegranates",     cfg = "Pomegranates",   raw = "pomegranate"},
    {name = "pumpkins",         cfg = "Pumpkins",       raw = "pumpkin"},
    {name = "red_shrooms",      cfg = "RedShrooms",     raw = "red_cap"},
    {name = "watermelons",      cfg = "Watermelons",    raw = "watermelon"},
    -- light
    {name = "glowberries",          cfg = "GlowBerries",        raw = "wormlight"},
    {name = "lesser_glowberries",   cfg = "LesserGlowBerries",  raw = "wormlight_lesser"},
    {name = "lightbulbs",           cfg = "LightBulbs",         raw = "lightbulb"},
}

-- Birds and Berries and Trees for Friends
local bbtPrefabs = {
    {name = "apples",           cfg = "Apples",         raw = "treeapple"},
    {name = "blueberries",      cfg = "Blueberries",    raw = "berrybl"},
    {name = "greenberries",     cfg = "Greenberries",   raw = "berrygr"},
    {name = "pineapples",       cfg = "Pineapples",     raw = "pappfruit"},
}
if bbt then for k = 1, #bbtPrefabs, 1 do crsPrefabs[#crsPrefabs+1] = bbtPrefabs[k] end end

-- More Fruits
local mfPrefabs = {
    {name = "grapes",           cfg = "Grapes",         raw = "grapebbit"},
    {name = "lemons",           cfg = "Lemons",         raw = "lemonitem"},
    {name = "limes",            cfg = "Limes",          raw = "limelitem"},
    {name = "oranges",          cfg = "Oranges",        raw = "orangeitm"},
    {name = "strawberries",     cfg = "Strawberries",   raw = "strawbbit"},
    {name = "tomatoes",         cfg = "Tomatoes",       raw = "tomatobit"},
}
if mfr then for k = 1, #mfPrefabs, 1 do crsPrefabs[#crsPrefabs+1] = mfPrefabs[k] end end

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

STRINGS.NAMES.CANNED_GLOWBERRIES = "Canned Glow Berries"
STRINGS.NAMES.CANNED_LESSER_GLOWBERRIES = "Canned Glow Berries"
STRINGS.NAMES.CANNED_LIGHTBULBS = "Canned Light Bulbs"

if bbt then
    STRINGS.NAMES.CANNED_BLUEBERRIES = "Canned Blueberries"
    STRINGS.NAMES.CANNED_GREENBERRIES = "Canned Greenberries"
    STRINGS.NAMES.CANNED_PINEAPPLES = "Canned Pineapples"
    STRINGS.NAMES.CANNED_APPLES = "Canned Apples"
end

if mfr then
    STRINGS.NAMES.CANNED_STRAWBERRIES = "Canned Strawberries"
    STRINGS.NAMES.CANNED_GRAPES = "Canned Grapes"
    STRINGS.NAMES.CANNED_TOMATOES = "Canned Tomatoes"
    STRINGS.NAMES.CANNED_ORANGES = "Canned Oranges"
    STRINGS.NAMES.CANNED_LEMONS = "Canned Lemons"
    STRINGS.NAMES.CANNED_LIMES = "Canned Limes"
end

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

local honey = getConfig("cfgAddHoney") -- check if honey requirement is enabled
local nitre = getConfig("cfgAddNitre") -- check if nitre requirement is enabled
local function crsAddRecipe(name, cfg, raw)
    local mats = {Ingredient(raw, getConfig("cfgRaw"..cfg)), honey and Ingredient("honey", getConfig("cfgHoney")) or nil, nitre and Ingredient("nitre", getConfig("cfgNitre")) or nil}
    return AddRecipe("canned_"..name, mats, recipeTab, recipeTech, nil, nil, true, nil, nil, "images/inventoryimages/"..name..".xml")
end
-- add recipes
for k = 1, #crsPrefabs, 1 do
    crsAddRecipe(crsPrefabs[k].name, crsPrefabs[k].cfg, crsPrefabs[k].raw)
end
-- add honey separately
AddRecipe("canned_honey", {Ingredient("honey", getConfig("cfgRawHoney")), nitre and Ingredient("nitre", getConfig("cfgNitre")) or nil}, recipeTab, recipeTech, nil, nil, true, nil, nil, "images/inventoryimages/honey.xml")

-- ACTION --

local OPEN_CAN = Action()
OPEN_CAN.str = "Open"
OPEN_CAN.id = "OPEN_CAN"
OPEN_CAN.fn = function(act)
    if act.invobject and act.invobject.components.cannedfood then
        local target = act.target or act.doer
        return act.invobject.components.cannedfood:Open(target)
    end
end
AddAction(OPEN_CAN)
AddStategraphActionHandler("wilson", ActionHandler(OPEN_CAN, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(OPEN_CAN, "dolongaction"))
AddComponentAction("INVENTORY", "cannedfood", function(inst, doer, actions, right)          
    table.insert(actions, ACTIONS.OPEN_CAN)
end)
