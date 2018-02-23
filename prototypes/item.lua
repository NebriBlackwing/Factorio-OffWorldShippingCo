local shippingRocket = table.deepcopy(data.raw["rocket-silo-rocket"]["rocket-silo-rocket"])

shippingRocket.name = "rocket-silo-rocket"
shippingRocket.inventory_size = 10

data:extend{shippingRocket}