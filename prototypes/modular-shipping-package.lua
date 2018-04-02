local modularShippingPackageItem = table.deepcopy(data.raw.item["iron-gear-wheel"])
modularShippingPackageItem.name = "modular-shipping-package"
modularShippingPackageItem.icon = "__OffWorldShippingCo__/graphics/modular-shipping-package.png"

local modularShippingPackageRecipe = table.deepcopy(data.raw.recipe["iron-gear-wheel"])
modularShippingPackageRecipe.name = "modular-shipping-package-recipe"
modularShippingPackageRecipe.enabled = false
modularShippingPackageRecipe.normal = nil
modularShippingPackageRecipe.expensive = nil
modularShippingPackageRecipe.ingredients = {
    {"beacon",10},
    {"speed-module-3",50},
    {"productivity-module-3",50},
    {"effectivity-module-3",50}
}
modularShippingPackageRecipe.result = "modular-shipping-package"

data:extend{modularShippingPackageItem,modularShippingPackageRecipe}