-- More information here: https://sites.google.com/view/cr4shmaster/canned-food-ds-dst

name = "Canned Food v1.0.4"
description = "Store your food safely forever!"
author = "cr4shmaster"
version = "1.0.4"
forumthread = ""
api_version = 10
all_clients_require_mod = true
dst_compatible = true
client_only_mod = false
icon_atlas = "modicon.xml"
icon = "modicon.tex"


local crsToggle = {
    {description = "Yes", data = true},
    {description = "No", data = false},
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
    {description = "15", data = 15},
    {description = "20", data = 20},
}

local function rawIngredients(name, desc)
    local ext = desc ~= nil and desc or name
    return{
        name = "cfgRaw"..name,
        label = "Raw "..ext,
        options = crsIngredient,
        default = 10,
    }
end

local function cookedIngredients(name, desc)
    local ext = desc ~= nil and desc or name
    return{
        name = "cfgCooked"..name,
        label = ""..ext.." from can",
        options = crsIngredient,
        default = 7,
    }
end

local crsPrefabs = {
    {"Bananas"},
    {"Berries"},
    {"BerriesJuicy", "Juicy Berries"},
    {"BlueShrooms", "Blue Mushrooms"},
    {"Cactus", "Cactus Flesh"},
    {"Carrots"},
    {"Corn"},
    {"Durians"},
    {"Dragonfruits"},
    {"Eels"},
    {"Eggplants"},
    {"Fish"},
    {"GreenShrooms", "Green Mushrooms"},
    {"Honey"},
    {"Pomegranates"},
    {"Pumpkins"},
    {"RedShrooms", "Red Mushrooms"},
    {"Watermelons"},

    {"GlowBerries", "Glow Berries"},
    {"LesserGlowBerries", "Lesser Glow Berries"},
    {"LightBulbs", "Light Bulbs"},
}

local bbtPrefabs = { -- Birds and Berries and Trees and Flowers for Friends
    {"Apples"},
    {"Blueberries"},
    {"Greenberries"},
    {"Pineapples"},
}

local mfrPrefabs = { -- More Fruits
    {"Grapes"},
    {"Lemons"},
    {"Limes"},
    {"Oranges"},
    {"Tomatoes"},
    {"Strawberries"},
}

local function crsDivide(name, title)
    return {   
        name = "cfg"..name.."Title",
        label = title,
        options = {{description = "", data = false},},
        default = false,
    }
end

configuration_options = {
    crsDivide("CNF", "Canned Food Settings"),
    {
        name = "cfgRecipeTab",
        label = "Recipe Tab",
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
        name = "cfgAddHoney",
        label = "Honey Required",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgHoney",
        label = "How Much Honey",
        options = crsIngredient,
        default = 10,
    },
    
}

local function crsAddOptions(table)
    for k=1, #table, 1 do -- raw and cooked ingredients options
        desc = table[k][2] ~= nil
        configuration_options[#configuration_options+1] = rawIngredients(table[k][1], desc and table[k][2])
        configuration_options[#configuration_options+1] = cookedIngredients(table[k][1], desc and table[k][2])
    end
end

crsAddOptions(crsPrefabs)
configuration_options[#configuration_options+1] = crsDivide("BBT", "Birds and Berries and Trees")
crsAddOptions(bbtPrefabs)
configuration_options[#configuration_options+1] = crsDivide("MFR", "More Fruits")
crsAddOptions(mfrPrefabs)
configuration_options[#configuration_options+1] = crsDivide("ABC", "Other")
configuration_options[#configuration_options+1] = {name = "cfgTestCheck", label = "Installed", options = {{description = "Yes", data = true},},default = true,}