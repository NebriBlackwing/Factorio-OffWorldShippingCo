-- create our global container object
local shippingCo = {
    configConstants = {
        MAX_ITEMS_PER_ORDER = 3,
        SCALE_FACTOR = 0.2,
        SHIPPING_CO_STARTING_LEVEL = 1
    },
    objectiveItems = {
        "factory-shipping-package",
        "oil-shipping-package",
        "rail-shipping-package",
        "modular-shipping-package"
    }
}

local function isItemAlreadyListedInOrder(order, itemName)

    for key, item in pairs(order) do
        if item.name == itemName then
            return true
        end
    end

    return false

end

-- set the circuit signals for one or all receiver entities
local function update_receivers(entity)
    if entity or ((not entity) and #global.receivers) then
        local signalParameters = { parameters = {{index=1,signal={type="virtual",name="signal-offworldshippingco-level"},count=global.shippingCoLevel}} }
        if global.shippingCoOrder then
            for index, item in ipairs(global.shippingCoOrder) do
                table.insert(signalParameters.parameters,
                    {index=index+1,signal={type="item",name=item.name},count=item.quantityRequired-item.quantityLaunched}
                )
            end
        end

        for index, receiver in ipairs(entity and {{entity = entity}} or global.receivers) do
            if receiver.entity.valid then
                receiver.entity.get_control_behavior().parameters = signalParameters
            else
                if not entity then
                    table.remove(global.receivers, index)
                end
            end
        end
    end
end

-- generate an order
local function generate_order(number_of_items)

    -- hardcoded for now, we will try and randomly generate these later.
    local order = {}

    for i=1, number_of_items do
        local randomName = ""

        repeat
            randomName = shippingCo.objectiveItems[math.random(#shippingCo.objectiveItems)]
        until (isItemAlreadyListedInOrder(order, randomName) == false)

        local item = {
            name = randomName,
            quantityRequired = math.ceil( math.random(5) * (shippingCo.configConstants.SCALE_FACTOR + global.shippingCoLevel) ),
            quantityLaunched = 0
        }

        table.insert(order, item)
    end

    global.shippingCoOrderIsComplete = false

    return order
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
        for index, item in ipairs(global.shippingCoOrder) do
            frame.add {
                type = "label",
                caption = string.format("%s launched : %d / %d", item.name, item.quantityLaunched, item.quantityRequired)
            }
        end
    end
end

local function check_order_complete()
    if global.shippingCoOrder then
        for index, item in ipairs(global.shippingCoOrder) do
            if (item.quantityLaunched < item.quantityRequired) then
                return false
            end
        end
    end

    return true
end

script.on_event( defines.events.on_tick, function(event)
    if not global.shippingCoLevel then
        global.shippingCoLevel = shippingCo.configConstants.SHIPPING_CO_STARTING_LEVEL
    end

    if not global.shippingCoOrder then
        global.shippingCoOrder = generate_order(math.random(shippingCo.configConstants.MAX_ITEMS_PER_ORDER))
        update_receivers()
    end

    for i, player in pairs(game.connected_players) do

        if game.forces.player.technologies["shipping-packages"].researched then

            if player.gui.top.shippingCoOrderButton == nil then
                player.gui.top.add{ type = "button", name="shippingCoOrderButton", caption = "Shipping Order" }
            end

            if global.shippingCoOrderIsComplete then
                player.print("Shipping Order complete! Recieving new order!")
            end

        end
    end

    if global.shippingCoOrderIsComplete then
        global.shippingCoLevel = global.shippingCoLevel + 1
        global.shippingCoOrder = generate_order(math.random(shippingCo.configConstants.MAX_ITEMS_PER_ORDER))
        update_receivers()

        for i, player in pairs(game.connected_players) do
            gui_open_frame(player)
        end
    end

end)

script.on_event(defines.events.on_rocket_launched, function(event)
    if global.shippingCoOrder then
        for index, item in ipairs(global.shippingCoOrder) do
            item.quantityLaunched = item.quantityLaunched + event.rocket.get_item_count(item.name)
        end
        update_receivers()

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

local function on_built_entity( event )
    local entity = event.created_entity
    if entity.name == "shipping-order-receiver" then
        table.insert( global.receivers, {entity = entity} )
        update_receivers(entity)
    end
end

script.on_event(defines.events.on_built_entity, on_built_entity )
script.on_event(defines.events.on_robot_built_entity, on_built_entity )

local function disable_satelite_dialog()
    -- just to make sure we don't accidently finish the game!
    if remote.interfaces["silo_script"] then
        remote.call("silo_script","set_show_launched_without_satellite", false)
    end
end


local function destroy_gui()

    for i, player in pairs(game.connected_players) do
        button = player.gui.top["shippingCoOrderButton"]
        frame = player.gui.left["shipping-co-order-frame"]

        if frame then
            frame.destroy()
        end

        if button then
            button.destroy()
        end
    end
end

script.on_init(function()
    disable_satelite_dialog()
    destroy_gui()
    global.receivers = global.receivers or {}
end)

script.on_configuration_changed(function()
    disable_satelite_dialog()
    destroy_gui()
    global.receivers = global.receivers or {}
end)