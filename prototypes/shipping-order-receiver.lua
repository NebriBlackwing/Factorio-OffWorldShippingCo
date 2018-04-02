-- quacks like a constant combinator, looks like a radar
local shippingOrderReceiverEntity = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
shippingOrderReceiverEntity.name = "shipping-order-receiver"
shippingOrderReceiverEntity.icon = "__base__/graphics/icons/radar.png"
shippingOrderReceiverEntity.minable = table.deepcopy(data.raw["radar"]["radar"].minable)
shippingOrderReceiverEntity.minable.result = "shipping-order-receiver"
shippingOrderReceiverEntity.max_health = data.raw["radar"]["radar"].max_health
shippingOrderReceiverEntity.corpse = data.raw["radar"]["radar"].corpse
shippingOrderReceiverEntity.collision_box = table.deepcopy(data.raw["radar"]["radar"].collision_box)
shippingOrderReceiverEntity.selection_box = table.deepcopy(data.raw["radar"]["radar"].selection_box)
shippingOrderReceiverEntity.resistances = table.deepcopy(data.raw["radar"]["radar"].resistances)
shippingOrderReceiverEntity.item_slot_count = 5 -- max number of signals, package types plus one for level
shippingOrderReceiverEntity.sprites = {
  east = table.deepcopy(data.raw["radar"]["radar"].pictures),
  north = table.deepcopy(data.raw["radar"]["radar"].pictures),
  west = table.deepcopy(data.raw["radar"]["radar"].pictures),
  south = table.deepcopy(data.raw["radar"]["radar"].pictures),
}
shippingOrderReceiverEntity.vehicle_impact_sound = table.deepcopy(data.raw["radar"]["radar"].vehicle_impact_sound)
shippingOrderReceiverEntity.circuit_wire_connection_points =
  {
    {
      shadow =
      {
        red = util.by_pixel(7, -6),
        green = util.by_pixel(23, -6),
      },
      wire =
      {
        red = util.by_pixel(-8.5, -17.5),
        green = util.by_pixel(7, -17.5),
      },
    },
    {
      shadow =
      {
        red = util.by_pixel(32, -5),
        green = util.by_pixel(32, 8),
      },
      wire =
      {
        red = util.by_pixel(16, -16.5),
        green = util.by_pixel(16, -3.5),
      },
    },
    {
      shadow =
      {
        red = util.by_pixel(25, 20),
        green = util.by_pixel(9, 20),
      },
      wire =
      {
        red = util.by_pixel(9, 7.5),
        green = util.by_pixel(-6.5, 7.5),
      },
    },
    {
      shadow =
      {
        red = util.by_pixel(1, 11),
        green = util.by_pixel(1, -2),
      },
      wire =
      {
        red = util.by_pixel(-15, -0.5),
        green = util.by_pixel(-15, -13.5),
      },
    },
  }
shippingOrderReceiverEntity.activity_led_light_offsets =
  {
    {0.25, -1},
    {0.25, -0.5},
    {-0.25, -0.5},
    {-0.25, -1},
  }
-- shippingOrderReceiverEntity.activity_led_sprites

local shippingOrderReceiverItem = table.deepcopy(data.raw.item["constant-combinator"])
shippingOrderReceiverItem.name = "shipping-order-receiver"
shippingOrderReceiverItem.icon = "__base__/graphics/icons/radar.png"
shippingOrderReceiverItem.place_result = "shipping-order-receiver"
shippingOrderReceiverItem.stack_size = data.raw.item["radar"].stack_size

-- merge two recipe ingredient lists
-- adds quantities if the same ingredient is on both lists
-- optionally truncates the list to a given length
local function mergeIngredients(a, b, truncate)
  local resultTable = {}
  local ingredients = 0
  for _,ingredient in ipairs(a) do
    ingredients = ingredients + 1
    resultTable[ingredient[1]] = ingredient[2]
    if ingredients == truncate then
      break
    end
  end
  for _,ingredient in ipairs(b) do
    if resultTable[ingredient[1]] then
      resultTable[ingredient[1]] = resultTable[ingredient[1]] + ingredient[2]
    else
      if truncate == nil or ingredients < truncate then
        ingredients = ingredients + 1
        resultTable[ingredient[1]] = ingredient[2]
      end
    end
  end
  local i = 1
  local result = {}
  for k,v in ipairs(resultTable) do
    result[i] = {k,v}
    i = i + 1
  end
  return result
end

local shippingOrderReceiverRecipe = table.deepcopy(data.raw.recipe["constant-combinator"])
shippingOrderReceiverRecipe.name = "shipping-order-receiver-recipe"
shippingOrderReceiverRecipe.enabled = false
shippingOrderReceiverRecipe.ingredients = mergeIngredients(data.raw.recipe["constant-combinator"].ingredients,data.raw.recipe["radar"].ingredients)
shippingOrderReceiverRecipe.result = "shipping-order-receiver"

data:extend{shippingOrderReceiverEntity,shippingOrderReceiverItem,shippingOrderReceiverRecipe}