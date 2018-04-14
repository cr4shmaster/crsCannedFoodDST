-- More information here: https://sites.google.com/view/cr4shmaster/canned-food-ds-dst

name = "Canned Food v1.0.1"
description = "Store your food safely forever!"
author = "cr4shmaster"
version = "1.0.1"
forumthread = ""
api_version = 10
all_clients_require_mod = true
dst_compatible = true
client_only_mod = false
icon_atlas = "modicon.xml"
icon = "modicon.tex"

local crsToggle = {
    {description = "Enabled", data = true},
    {description = "Disabled", data = false},
}
local crsIngredient = {
    {description = "1", data = 1},
    {description = "2", data = 2},
    {description = "3", data = 3},
    {description = "4", data = 4},
    {description = "5", data = 5},
    {description = "6", data = 6},
    {description = "7", data = 7},
    {description = "8", data = 8},
    {description = "9", data = 9},
    {description = "10", data = 10},
}

configuration_options = {
    {
        name = "cfgRecipeTab",
        label = "Recipe Tab",
        hover = "Recipe crafting tab.",
        options = {
            {description = "Tools", data = 1},
            {description = "Survival", data = 2},
            {description = "Farm", data = 3},
            {description = "Science", data = 4},
            {description = "Structures", data = 5},
            {description = "Refine", data = 6},
            {description = "Magic", data = 7},
        },
        default = 6,
    },
    {
        name = "cfgRecipeTech",
        label = "Recipe Tech",
        hover = "Crafting building requiremnt.",
        options = {
            {description = "None", data = 1},
            {description = "Science Machine", data = 2},
            {description = "Alchemy Engine", data = 3},
            {description = "Prestihatitator", data = 4},
            {description = "Shadow Manip.", data = 5},
            {description = "Broken APS", data = 6},
            {description = "Repaired APS", data = 7},
            {description = "Obs. Workbench", data = 8},
        },
        default = 2,
    },
    {
        name = "cfgRawBananas",
        label = "Raw Bananas",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedBananas",
        label = "Cooked Bananas",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawBerries",
        label = "Raw Berries",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedBerries",
        label = "Cooked Berries",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawBerriesJuicy",
        label = "Raw Juicy Berries",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedBerriesJuicy",
        label = "Cooked Juicy Berries",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawBlueShrooms",
        label = "Raw Blue Mushrooms",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedBlueShrooms",
        label = "Cooked Blue Mushrooms",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawCactus",
        label = "Raw Cactus",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedCactus",
        label = "Cooked Cactus",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawCarrots",
        label = "Raw Carrots",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedCarrots",
        label = "Cooked Carrots",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawCorn",
        label = "Raw Corn",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedCorn",
        label = "Cooked Corn",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawDurians",
        label = "Raw Durians",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedDurians",
        label = "Cooked Durians",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawDragonfruits",
        label = "Raw Dragonfruits",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedDragonfruits",
        label = "Cooked Dragonfruits",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawEels",
        label = "Raw Eels",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedEels",
        label = "Cooked Eels",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawEggplants",
        label = "Raw Eggplants",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedEggplants",
        label = "Cooked Eggplants",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawFish",
        label = "Raw Fish",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedFish",
        label = "Cooked Fish",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawGreenShrooms",
        label = "Raw Green Mushrooms",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedGreenShrooms",
        label = "Cooked Green Mushrooms",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawHoney",
        label = "Raw Honey",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedHoney",
        label = "Cooked Honey",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawPomegranates",
        label = "Raw Pomegranates",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedPomegranates",
        label = "Cooked Pomegranates",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawPumpkins",
        label = "Raw Pumpkins",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedPumpkins",
        label = "Cooked Pumpkins",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawRedShrooms",
        label = "Raw Red Mushrooms",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedRedShrooms",
        label = "Cooked Red Mushrooms",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgRawWatermelons",
        label = "Raw Watermelons",
        options = crsIngredient,
        default = 10,
    },
    {
        name = "cfgCookedWatermelons",
        label = "Cooked Watermelons",
        options = crsIngredient,
        default = 7,
    },
    {
        name = "cfgTestCheck",
        label = "Installed",
        options = {
            {description = "Yes", data = true},
        },
        default = true,
    },
}
