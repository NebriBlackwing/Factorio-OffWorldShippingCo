local oilShippingPackageEntity = table.deepcopy(data.raw.container["steel-chest"])
oilShippingPackageEntity.name = "oil-shipping-package"
oilShippingPackageEntity.minable = {mining_time = 1, result = "oil-shipping-package"}
oilShippingPackageEntity.inventory_size = 0
oilShippingPackageEntity.icon = "__OffWorldShippingCo__/graphics/oil-shipping-package.png"
oilShippingPackageEntity.picture = 
    {
      filename = "__OffWorldShippingCo__/graphics/oil-shipping-package.png",
      priority = "extra-high",
      width = 48,
      height = 34,
      shift = {0.1875, 0}
    }

local oilShippingPackageItem = table.deepcopy(data.raw.item["steel-chest"])
oilShippingPackageItem.name = "oil-shipping-package"
oilShippingPackageItem.icon = "__OffWorldShippingCo__/graphics/oil-shipping-package.png"
oilShippingPackageItem.place_result = "oil-shipping-package"

local oilShippingPackageRecipe = table.deepcopy(data.raw.recipe["steel-chest"])
oilShippingPackageRecipe.name = "oil-shipping-package-recipe"
oilShippingPackageRecipe.enabled = true
oilShippingPackageRecipe.ingredients = {
    {"oil-refinery",10},    
    {"pipe",100},
    {"pumpjack",20},
    {"pump",50},
    {"chemical-plant",50},
    {"storage-tank",50},
}
oilShippingPackageRecipe.result = "oil-shipping-package"

data:extend{oilShippingPackageEntity,oilShippingPackageItem,oilShippingPackageRecipe}