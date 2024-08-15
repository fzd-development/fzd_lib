local inventory = {}

function inventory.getItemCount(src, item)
  return exports['qs-inventory']:GetItemTotalAmount(src, item)
end

function inventory.hasItem(src, item)
  return inventory.getItemCount(src, item) > 0
end

function inventory.hasInventorySpace(src, item, count)
  return exports['qs-inventory']:CanCarryItem(src, item, count)
end

function inventory.addItem(src, item, count)
  return exports['qs-inventory']:AddItem(src, item, count)
end

function inventory.removeItem(src, item, count)
  return exports['qs-inventory']:RemoveItem(src, item, count)
end

function inventory.createCustomDrop(src, name, items, coords, slots, maxW, instance, model)
  local identifier = name.gsub(" ", "_"):lower()

  exports['qs-inventory']:RegisterStash(src, identifier, slots, maxW)

  for i = 1, #items do
    local item = items[i]
    exports['qs-inventory']:AddItemIntoStash(identifier, item[1], item[2], nil, nil, slots, maxW)
  end
end

return inventory