if Config.Inventory ~= "default" then return end

fzd.inventory = {}

if Config.Framework == "esx" then

  function fzd.inventory.getItemCount(src, item)
    local xPlayer = bridge.getPlayer(src)
    return xPlayer.getInventoryItem(item).count
  end

  function fzd.inventory.hasItem(src, item)
    local xPlayer = bridge.getPlayer(src)
    return xPlayer.hasItem(item)
  end

  function fzd.inventory.hasInventorySpace(src, item, count)
    local xPlayer = bridge.getPlayer(src)
    return xPlayer.canCarryItem(item, count)
  end

  function fzd.inventory.addItem(src, item, count)
    local xPlayer = bridge.getPlayer(src)
    xPlayer.addInventoryItem(item, count)
  end

  function fzd.inventory.removeItem(src, item, count)
    local xPlayer = bridge.getPlayer(src)
    xPlayer.removeInventoryItem(item, count)
  end

  function fzd.inventory.createCustomDrop(src, name, items, coords, slots, maxW, instance, model)
    print("createCustomDrop - doesn't exist for esx, please use ox_inventory or qs-inventory")
  end

elseif Config.Framework == "qbcore" then

  function fzd.inventory.getItemCount(src, item)
    return exports['qb-inventory']:GetItemCount(src, item)
  end

  function fzd.inventory.hasItem(src, item)
    return exports['qb-inventory']:HasItem(src, item, 1)
  end

  function fzd.inventory.hasInventorySpace(src, item, count)
    local canAdd, _ = exports['qb-inventory']:CanAddItem(src, item, count)
    return canAdd
  end

  function fzd.inventory.addItem(src, item, count)
    return exports['qb-inventory']:AddItem(src, item, count, false, false)
  end

  function fzd.inventory.removeItem(src, item, count)
    return exports['qb-inventory']:RemoveItem(src, item, count, false)
  end

  function fzd.inventory.createCustomDrop(src, name, items, coords, slots, maxW, instance, model)
    print("createCustomDrop - doesn't exist for qbcore, please use ox_inventory or qs-inventory")
  end

end