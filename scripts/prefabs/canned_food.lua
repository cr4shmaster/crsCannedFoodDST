local getConfig = GetModConfigData

local bbt = KnownModIndex:IsModEnabled("workshop-522117250") -- Check if Birds and Berries and Trees for Friends is enabled
local mf = KnownModIndex:IsModEnabled("workshop-861013495") -- Check if More Fruits is enabled

local crsCannedFoodDST = getConfig("cfgTestCheck", "workshop-1361546797") and "workshop-1361546797" or "crsCannedFoodDST"

local function crsCannedFood(prefab, cooked, cfg)
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
        inst:AddComponent("cookable")
        inst.components.cookable.oncooked = function ()
            local x, y, z = inst.Transform:GetWorldPosition()
            local player = FindClosestPlayerInRange(x, y, z, 2)
            for k = 1, mult , 1 do
                player.components.inventory:GiveItem(SpawnPrefab(cooked))
            end
        end
        inst:AddComponent("inspectable")

        return inst
    end

    return Prefab("canned_"..prefab, fn, assets)
end

return crsCannedFood("bananas", "cave_banana_cooked", "Bananas"),
        crsCannedFood("berries", "berries_cooked", "Berries"),
        crsCannedFood("berries_juicy", "berries_juicy_cooked", "BerriesJuicy"),
        crsCannedFood("blue_shrooms", "blue_cap_cooked", "BlueShrooms"),
        crsCannedFood("cactus", "cactus_meat_cooked", "Cactus"),
        crsCannedFood("carrots", "carrot_cooked", "Carrots"),
        crsCannedFood("corn", "corn_cooked", "Corn"),
        crsCannedFood("durians", "durian_cooked", "Durians"),
        crsCannedFood("dragonfruits", "dragonfruit_cooked", "Dragonfruits"),
        crsCannedFood("eels", "eel_cooked", "Eels"),
        crsCannedFood("eggplants", "eggplant_cooked", "Eggplants"),
        crsCannedFood("fish", "fish_cooked", "Fish"),
        crsCannedFood("green_shrooms", "green_cap_cooked", "GreenShrooms"),
        crsCannedFood("honey", "honey", "Honey"),
        crsCannedFood("pomegranates", "pomegranate_cooked", "Pomegranates"),
        crsCannedFood("pumpkins", "pumpkin_cooked", "Pumpkins"),
        crsCannedFood("red_shrooms", "red_cap_cooked", "RedShrooms"),
        crsCannedFood("watermelons", "watermelon_cooked", "Watermelons"),

        bbt and crsCannedFood("blueberries", "berrybl_cooked", "Blueberries") or nil,
        bbt and crsCannedFood("greenberries", "berrygr_cooked", "Greenberries") or nil,
        bbt and crsCannedFood("pineapples", "pappfruit_cooked", "Pineapples") or nil,
        bbt and crsCannedFood("apples", "treeapple", "Apples") or nil,

        mf and crsCannedFood("strawberries", "strawbbit_cooked", "Strawberries") or nil,
        mf and crsCannedFood("grapes", "grapebbit_cooked", "Grapes") or nil,
        mf and crsCannedFood("tomatoes", "tomatobit_cooked", "Tomatoes") or nil,
        mf and crsCannedFood("oranges", "orangeitm", "Oranges") or nil,
        mf and crsCannedFood("lemons", "lemonitem", "Lemons") or nil,
        mf and crsCannedFood("limes", "limelitem", "Limes") or nil