-- create our global container object
if not shippingCo then shippingCo = {} end
if not shippingCo.rocketStacks then shippingCo.rocketStacks = 10 end

-- specify the order objectives
if not shippingCo.objectiveItems then 
    shippingCo.objectiveItems = {
        ["ores"] = { "coal", "stone", "iron", "copper" }
    }
end

-- generate an order
local function generate_order(number_of_items)
    local order = {}
    local item = {}
    
    order.number_of_items = number_of_items

    for i = 1, order.number_of_items, do

        item.itemCategory = shippingCo.objectiveItems[ math.random( #shippingCo.objectiveItems ) ]
        item.name = shippingCo.objectiveItems[ itemCategory ] [ math.random( #shippingCo.objectiveItems[itemCategory] ) ]    
        item.quantityOfStacks = math.random(10)    

        if item.itemCategory == "ores" then
            item.quantity = item.quantityOfStacks * 50
        end

        item.quantityLaunched = 0

        table.insert(order, item)

    end    

    return order
end

local function gui_open_frame(player)

    local frame = player.gui.left["shipping-co-order-frame"]

    if frame then
        frame.destroy()            
    end
    
    frame = player.gui.left.add {
        type = "frame",
        caption = {"shipping-co-order-frame-title"},
        name = "shipping-co-order-frame",
        direction = "vertical"
    }

    frame.add {
        type = "label",
        caption = " -Item1 launched : 0 / 10 " 
    }

end

script.on_event( defines.events.on_tick, function(event)        

    if not global.shippingCoOrder then global.shippingCoOrder = generate_order(1) end

    for i, player in pairs(game.connected_players) do
        if player.gui.top.shippingCoGUI == nill then player.gui.top.add{type="button", name="shippingCoGUI"} end
        player.gui.top.shippingCoGUI.caption = string.format("Hello World!")
    end

end)

script.on_event(defines.events.on_rocket_launched, function(event)
    -- just to make sure we don't accidently finish the game!
    remote.call("silo_script","set_show_launched_without_satellite", false)
    remote.call("silo_script","set_finish_on_launch", false)

    local testString = "Hello Rocket Launch!"        
    
    for _, player in pairs(game.players) do      
      player.print(testString)
      player.print(shippingCo.get_number())
    end
  end)