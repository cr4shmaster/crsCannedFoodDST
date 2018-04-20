-- More information here: https://sites.google.com/view/cr4shmaster/canned-food-ds-dst

name = "Canned Food v1.0.5"
description = "Store your food safely forever!"
author = "cr4shmaster"
version = "1.0.5"
forumthread = ""
api_version = 10
all_clients_require_mod = true
dst_compatible = true
client_only_mod = false
icon_atlas = "modicon.xml"
icon = "modicon.tex"

local function crsSetCount(k)
    return {description = ""..k.."", data = k}
end

local function rawIngredients(name, desc)
    local ext = desc ~= nil and desc or name
    return {name = "cfgRaw"..name, label = "Raw "..ext, options = crsIngredient, default = 10,}
end

local function cookedIngredients(name, desc)
    local ext = desc ~= nil and desc or name
    return {name = "cfgCooked"..name, label = ""..ext.." from can", options = crsIngredient, default = 7,}
end

local function crsSetTab(k)
    local name = {"Tools", "Survival", "Farm", "Science", "Structures", "Refine", "Magic"}
    return {description = ""..name[k].."", data = k}
end

local function crsSetTech(k)
    local name = {"None", "Science Machine", "Alchemy Engine", "Prestihatitator", "Shadow Manip.", "Broken APS", "Repaired APS"}
    return {description = ""..name[k].."", data = k}
end

local crsTab = {} for k=1,7,1 do crsTab[k] = crsSetTab(k) end
local crsTech = {} for k=1,7,1 do crsTech[k] = crsSetTech(k) end
local crsIngredient = {} for k=1,20,1 do crsIngredient[k] = crsSetCount(k) end
local crsToggle = {{description = "Yes", data = true}, {description = "No", data = false},}

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
    return {name = "cfg"..name.."Title", label = title, options = {{description = "", data = false},}, default = false,}
end

configuration_options = {
    crsDivide("CNF", "Canned Food Settings"),
    {name = "cfgRecipeTab", label = "Recipe Tab", options = crsTab, default = 6,},
    {name = "cfgRecipeTech", label = "Recipe Tech", options = crsTech, default = 2,},
    {name = "cfgAddHoney", label = "Honey Required", options = crsToggle, default = true,},
    {name = "cfgHoney", label = "How Much Honey", options = crsIngredient, default = 10,}, 
    {name = "cfgAddNitre", label = "Nitre Required", options = crsToggle, default = true,},
    {name = "cfgNitre", label = "How Much Nitre", options = crsIngredient, default = 1,}, 
}

local function crsAddOptions(table)
    for k=1, #table, 1 do -- raw and cooked ingredients
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