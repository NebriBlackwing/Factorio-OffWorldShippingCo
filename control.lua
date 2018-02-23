local itemCategoryConstants = {
    TRANSPORT_BELT = 1,
    TOOL = 2,
}

-- create our global container object
local shippingCo = {
    rocketStacks = 10,    
    configConstants = {
        MAX_ITEMS_PER_ORDER = 5,
        SCALE_FACTOR = 0.2
    },
    objectiveItems = {
        [itemCategoryConstants.TRANSPORT_BELT] = { "transport-belt", "fast-transport-belt", "express-transport-belt"},
        [itemCategoryConstants.TOOL] = { "high-tech-science-pack", "military-science-pack", "production-science-pack", "science-pack-1", "science-pack-2", "science-pack-3", "space-science-pack"}
    }    
}

-- generate an order
local function generate_order(number_of_items)        

    -- hardcoded for now, we will try and randomly generate these later.        
    local order = {}

    for i=1, number_of_items do
        local item = {             
            name = shippingCo.objectiveItems[math.random(2)][math.random(4)],
            quantityOfStacks = math.random(5, 10) * (shippingCo.configConstants.SCALE_FACTOR * global.shippingCoLevel),
            maxStack = 50,
            quantityLaunched = 0
        }

        table.insert(order, item)
    end    

    global.shippingCoOrderIsComplete = false

    return order
end

local function gui_init(player)

    if player.gui.top["shippingCoOrderButton"] then
        player.gui.top["shippingCoOrderButton"].destroy()
    end

    player.gui.top.add{        
        type = "button",
        name = "shippingCoOrderButton",
        caption = {"Order"}
    }

end

local function gui_open_frame(player)
    local frame = player.gui.left["shipping-co-order-frame"]

    if frame then
        frame.destroy()            
    end
    
    frame = player.gui.left.add {
        type = "frame",
        caption = string.format("Shipping Order Details (Level: %s)", global.shippingCoLevel),
        name = "shipping-co-order-frame",
        direction = "vertical"
    }

    if global.shippingCoOrder then
        for key, item in pairs(global.shippingCoOrder) do
            local quantity = item.maxStack * item.quantityOfStacks
            frame.add {
                type = "label",
                caption = string.format("%s launched : %d / %d", item.name, item.quantityLaunched, quantity)
            }
        end        
    end
end

local function check_order_complete() 
    if global.shippingCoOrder then
        for key, item in pairs(global.shippingCoOrder) do
            totalQuantityRequired = item.maxStack * item.quantityOfStacks
            if (item.quantityLaunched < totalQuantityRequired) then
                return false
            end
        end
    end

    return true
end

script.on_event( defines.events.on_tick, function(event)
    if not global.shippingCoLevel then
        global.shippingCoLevel = 1
    end

    if not global.shippingCoOrder then 
        global.shippingCoOrder = generate_order(math.random(shippingCo.configConstants.MAX_ITEMS_PER_ORDER)) 
    end    

    for i, player in pairs(game.connected_players) do
        if player.gui.top.shippingCoOrderButton == nil then 
            player.gui.top.add{ type = "button", name="shippingCoOrderButton", caption = "Shipping Order" }
        end

        if global.shippingCoOrderIsComplete then
            player.print("Shipping Order complete! Recieving new order!")            
        end
    end    

    if global.shippingCoOrderIsComplete then
        global.shippingCoLevel = global.shippingCoLevel + 1
        global.shippingCoOrder = generate_order(math.random(shippingCo.configConstants.MAX_ITEMS_PER_ORDER))

        for i, player in pairs(game.connected_players) do
            gui_open_frame(player)
        end
    end

end)

script.on_event(defines.events.on_rocket_launched, function(event)
    -- just to make sure we don't accidently finish the game!
    remote.call("silo_script","set_show_launched_without_satellite", false)
    remote.call("silo_script","set_finish_on_launch", false)        
    
    if global.shippingCoOrder then
        for key, item in pairs(global.shippingCoOrder) do
            item.quantityLaunched = item.quantityLaunched + event.rocket.get_item_count(item.name)
        end

        global.shippingCoOrderIsComplete = check_order_complete()
    end        

    for _, player in pairs(game.players) do
      gui_open_frame(player)
    end
  end)

script.on_event( defines.events.on_gui_click, function(event) 

    local element = event.element
    local player = game.players[event.player_index]

    if element.name == "shippingCoOrderButton" then

        local frame = player.gui.left["shipping-co-order-frame"]

        if frame then
            frame.destroy()
        else
            gui_open_frame(player)
        end
        
    end

end )