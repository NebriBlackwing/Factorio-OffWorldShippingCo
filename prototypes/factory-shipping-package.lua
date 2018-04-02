local factoryShippingPackageItem = table.deepcopy(data.raw.item["iron-gear-wheel"])
factoryShippingPackageItem.name = "factory-shipping-package"
factoryShippingPackageItem.icon = "__OffWorldShippingCo__/graphics/factory-shipping-package.png"

local factoryShippingPackageRecipe = table.deepcopy(data.raw.recipe["iron-gear-wheel"])
factoryShippingPackageRecipe.name = "factory-shipping-package-recipe"
factoryShippingPackageRecipe.enabled = false
factoryShippingPackageRecipe.normal = nil
factoryShippingPackageRecipe.expensive = nil
factoryShippingPackageRecipe.ingredients = {
    {"express-transport-belt",100},
    {"express-underground-belt",50},
    {"express-splitter",50},
    {"assembling-machine-3",50},
    {"stack-inserter",50},
    {"stack-filter-inserter",50},
}
factoryShippingPackageRecipe.result = "factory-shipping-package"

data:extend{factoryShippingPackageItem,factoryShippingPackageRecipe}