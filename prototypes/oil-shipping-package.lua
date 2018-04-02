local oilShippingPackageItem = table.deepcopy(data.raw.item["iron-gear-wheel"])
oilShippingPackageItem.name = "oil-shipping-package"
oilShippingPackageItem.icon = "__OffWorldShippingCo__/graphics/oil-shipping-package.png"

local oilShippingPackageRecipe = table.deepcopy(data.raw.recipe["iron-gear-wheel"])
oilShippingPackageRecipe.name = "oil-shipping-package-recipe"
oilShippingPackageRecipe.enabled = false
oilShippingPackageRecipe.normal = nil
oilShippingPackageRecipe.expensive = nil
oilShippingPackageRecipe.ingredients = {
    {"oil-refinery",10},
    {"pipe",100},
    {"pumpjack",20},
    {"pump",50},
    {"chemical-plant",50},
    {"storage-tank",50},
}
oilShippingPackageRecipe.result = "oil-shipping-package"

data:extend{oilShippingPackageItem,oilShippingPackageRecipe}