local railShippingPackageEntity = table.deepcopy(data.raw.container["steel-chest"])
railShippingPackageEntity.name = "rail-shipping-package"
railShippingPackageEntity.minable = {mining_time = 1, result = "rail-shipping-package"}
railShippingPackageEntity.inventory_size = 0
railShippingPackageEntity.icon = "__OffWorldShippingCo__/graphics/rail-shipping-package.png"
railShippingPackageEntity.picture = 
    {
      filename = "__OffWorldShippingCo__/graphics/rail-shipping-package.png",
      priority = "extra-high",
      width = 48,
      height = 34,
      shift = {0.1875, 0}
    }

local railShippingPackageItem = table.deepcopy(data.raw.item["steel-chest"])
railShippingPackageItem.name = "rail-shipping-package"
railShippingPackageItem.icon = "__OffWorldShippingCo__/graphics/rail-shipping-package.png"
railShippingPackageItem.place_result = "rail-shipping-package"

local railShippingPackageRecipe = table.deepcopy(data.raw.recipe["steel-chest"])
railShippingPackageRecipe.name = "rail-shipping-package-recipe"
railShippingPackageRecipe.enabled = false
railShippingPackageRecipe.ingredients = {
    {"locomotive",5},
    {"cargo-wagon",5},
    {"artillery-wagon",5},
    {"rail",100},
    {"rail-signal",50},
    {"train-stop",10},
}
railShippingPackageRecipe.result = "rail-shipping-package"

data:extend{railShippingPackageEntity,railShippingPackageItem,railShippingPackageRecipe}