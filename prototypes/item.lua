local factoryShippingPackageEntity = table.deepcopy(data.raw.container["steel-chest"])
factoryShippingPackageEntity.name = "factory-shipping-package"
factoryShippingPackageEntity.minable = {mining_time = 1, result = "factory-shipping-package"}
factoryShippingPackageEntity.inventory_size = 0
factoryShippingPackageEntity.icon = "__OffWorldShippingCo__/graphics/factory-shipping-package.png"
factoryShippingPackageEntity.picture = 
    {
      filename = "__OffWorldShippingCo__/graphics/factory-shipping-package.png",
      priority = "extra-high",
      width = 48,
      height = 34,
      shift = {0.1875, 0}
    }

local factoryShippingPackageItem = table.deepcopy(data.raw.item["steel-chest"])
factoryShippingPackageItem.name = "factory-shipping-package"
factoryShippingPackageItem.icon = "__OffWorldShippingCo__/graphics/factory-shipping-package.png"
factoryShippingPackageItem.place_result = "factory-shipping-package"

local factoryShippingPackageRecipe = table.deepcopy(data.raw.recipe["steel-chest"])
factoryShippingPackageRecipe.name = "factory-shipping-package-recipe"
factoryShippingPackageRecipe.enabled = true
energy_required = 30
factoryShippingPackageRecipe.ingredients = {
    {"express-transport-belt",100},
    {"express-underground-belt",50},
    {"express-splitter",50},
    {"assembling-machine-3",50},
    {"stack-inserter",50},
    {"stack-filter-inserter",50},
}
factoryShippingPackageRecipe.result = "factory-shipping-package"

data:extend{factoryShippingPackageEntity,factoryShippingPackageItem,factoryShippingPackageRecipe}