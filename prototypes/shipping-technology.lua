local shippingTechnology = {
    type = "technology",
    name = "shipping-packages",
    icon_size = 128,
    icon = "__OffWorldShippingCo__/graphics/technology_icon.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "factory-shipping-package-recipe"
      },
      {
        type = "unlock-recipe",
        recipe = "oil-shipping-package-recipe"
      },
      {
        type = "unlock-recipe",
        recipe = "rail-shipping-package-recipe"
      },
      {
        type = "unlock-recipe",
        recipe = "modular-shipping-package-recipe"
      }
    },
    prerequisites = {"rocket-silo"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 60
    },
    order = "k-b"
  }

data:extend{shippingTechnology}