local railShippingPackageItem = table.deepcopy(data.raw.item["iron-gear-wheel"])
railShippingPackageItem.name = "rail-shipping-package"
railShippingPackageItem.icon = "__OffWorldShippingCo__/graphics/rail-shipping-package.png"

local railShippingPackageRecipe = table.deepcopy(data.raw.recipe["iron-gear-wheel"])
railShippingPackageRecipe.name = "rail-shipping-package-recipe"
railShippingPackageRecipe.enabled = false
railShippingPackageRecipe.normal = nil
railShippingPackageRecipe.expensive = nil
railShippingPackageRecipe.ingredients = {
    {"locomotive",5},
    {"cargo-wagon",5},
    {"artillery-wagon",5},
    {"rail",100},
    {"rail-signal",50},
    {"train-stop",10},
}
railShippingPackageRecipe.result = "rail-shipping-package"

data:extend{railShippingPackageItem,railShippingPackageRecipe}