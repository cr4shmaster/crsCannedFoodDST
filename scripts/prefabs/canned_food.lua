local getConfig = GetModConfigData

local bbt = KnownModIndex:IsModEnabled("workshop-522117250") -- Check if Birds and Berries and Trees and Flowers for Friends is enabled
local mfr = KnownModIndex:IsModEnabled("workshop-861013495") -- Check if More Fruits is enabled

local crsCannedFoodDST = getConfig("cfgTestCheck", "workshop-1361546797") and "workshop-1361546797" or "crsCannedFoodDST"

local function crsCannedFood(prefab, raw, cfg, cooked)
    local mult = getConfig("cfgCooked"..cfg, crsCannedFoodDST)
    
    local assets = {
        Asset("ATLAS", "images/inventoryimages/"..prefab..".xml"),
        Asset("IMAGE", "images/inventoryimages/"..prefab..".tex"),
        Asset("ANIM", "anim/canned_food.zip"),
    }

    local function fn(Sim)
        local inst = CreateEntity()
        inst.entity:AddTransform()
        inst.entity:AddNetwork()
        MakeInventoryPhysics(inst)
        inst.entity:AddAnimState()
        inst.AnimState:SetBank("canned_food")
        inst.AnimState:SetBuild("canned_food")
        inst.AnimState:PlayAnimation(prefab)
    
        inst.entity:SetPristine()
        if not TheWorld.ismastersim then
            return inst
        end
    
        inst:AddComponent("inventoryitem")
        inst.components.inventoryitem.atlasname = "images/inventoryimages/"..prefab..".xml"
        inst.components.inventoryitem.cangoincontainer = true
        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
        if cooked ~= nil then
            inst:AddComponent("cookable")
            inst.components.cookable.oncooked = function ()
                local x, y, z = inst.Transform:GetWorldPosition()
                local player = FindClosestPlayerInRange(x, y, z, 2)
                for k = 1, mult , 1 do
                    player.components.inventory:GiveItem(SpawnPrefab(cooked))
                end
            end
        end

        inst:AddComponent("inspectable")

        inst:AddComponent("cannedfood")
        inst.components.cannedfood.output = raw
        inst.components.cannedfood.outputAmount = mult

        return inst
    end

    return Prefab("canned_"..prefab, fn, assets)
end

return crsCannedFood("bananas", "cave_banana", "Bananas", "cave_banana_cooked"),
        crsCannedFood("berries", "berries", "Berries", "berries_cooked"),
        crsCannedFood("berries_juicy", "berries_juicy", "BerriesJuicy", "berries_juicy_cooked"),
        crsCannedFood("blue_shrooms", "blue_cap", "BlueShrooms", "blue_cap_cooked"),
        crsCannedFood("cactus", "cactus_meat", "Cactus", "cactus_meat_cooked"),
        crsCannedFood("carrots", "carrot", "Carrots", "carrot_cooked"),
        crsCannedFood("corn", "corn", "Corn", "corn_cooked"),
        crsCannedFood("durians", "durian", "Durians", "durian_cooked"),
        crsCannedFood("dragonfruits", "dragonfruit", "Dragonfruits", "dragonfruit_cooked"),
        crsCannedFood("eels", "eel", "Eels", "eel_cooked"),
        crsCannedFood("eggplants", "eggplant", "Eggplants", "eggplant_cooked"),
        crsCannedFood("fish", "fish", "Fish", "fish_cooked"),
        crsCannedFood("green_shrooms", "green_cap", "GreenShrooms", "green_cap_cooked"),
        crsCannedFood("honey", "honey", "Honey"),
        crsCannedFood("pomegranates", "pomegranate", "Pomegranates", "pomegranate_cooked"),
        crsCannedFood("pumpkins", "pumpkin", "Pumpkins", "pumpkin_cooked"),
        crsCannedFood("red_shrooms", "red_cap", "RedShrooms", "red_cap_cooked"),
        crsCannedFood("watermelons", "watermelon", "Watermelons", "watermelon_cooked"),

        bbt and crsCannedFood("blueberries", "berrybl", "Blueberries", "berrybl_cooked") or nil,
        bbt and crsCannedFood("greenberries", "berrygr", "Greenberries", "berrygr_cooked") or nil,
        bbt and crsCannedFood("pineapples", "pappfruit", "Pineapples", "pappfruit_cooked") or nil,
        bbt and crsCannedFood("apples", "treeapple", "Apples") or nil,

        mfr and crsCannedFood("strawberries", "strawbbit", "Strawberries", "strawbbit_cooked") or nil,
        mfr and crsCannedFood("grapes", "grapebbit", "Grapes", "grapebbit_cooked") or nil,
        mfr and crsCannedFood("tomatoes", "tomatobit", "Tomatoes", "tomatobit_cooked") or nil,
        mfr and crsCannedFood("oranges", "orangeitm", "Oranges") or nil,
        mfr and crsCannedFood("lemons", "lemonitem", "Lemons") or nil,
        mfr and crsCannedFood("limes", "limelitem", "Limes") or nil