local modularShippingPackageEntity = table.deepcopy(data.raw.container["steel-chest"])
modularShippingPackageEntity.name = "modular-shipping-package"
modularShippingPackageEntity.minable = {mining_time = 1, result = "modular-shipping-package"}
modularShippingPackageEntity.inventory_size = 0
modularShippingPackageEntity.icon = "__OffWorldShippingCo__/graphics/modular-shipping-package.png"
modularShippingPackageEntity.picture = 
    {
      filename = "__OffWorldShippingCo__/graphics/modular-shipping-package.png",
      priority = "extra-high",
      width = 48,
      height = 34,
      shift = {0.1875, 0}
    }

local modularShippingPackageItem = table.deepcopy(data.raw.item["steel-chest"])
modularShippingPackageItem.name = "modular-shipping-package"
modularShippingPackageItem.icon = "__OffWorldShippingCo__/graphics/modular-shipping-package.png"
modularShippingPackageItem.place_result = "modular-shipping-package"

local modularShippingPackageRecipe = table.deepcopy(data.raw.recipe["steel-chest"])
modularShippingPackageRecipe.name = "modular-shipping-package-recipe"
modularShippingPackageRecipe.enabled = false
modularShippingPackageRecipe.ingredients = {
    {"beacon",10},
    {"speed-module-3",50},
    {"productivity-module-3",50},
    {"effectivity-module-3",50}    
}
modularShippingPackageRecipe.result = "modular-shipping-package"

data:extend{modularShippingPackageEntity,modularShippingPackageItem,modularShippingPackageRecipe}