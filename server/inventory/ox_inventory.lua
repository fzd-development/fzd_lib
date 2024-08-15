local inventory = {}

function inventory.getItemCount(src, item)
  return exports.ox_inventory:GetItem(src, item, false, true)
end

function inventory.hasItem(src, item)
  return inventory.getItemCount(src, item) > 0
end

function inventory.hasInventorySpace(src, item, count)
  return exports.ox_inventory:CanCarryItem(src, item, count)
end

function inventory.addItem(src, item, count)
  return exports.ox_inventory:AddItem(src, item, count)
end

function inventory.removeItem(src, item, count)
  return exports.ox_inventory:RemoveItem(src, item, count)
end

function inventory.createCustomDrop(name, items, coords, slots, maxW, instance, model)
  exports.ox_inventory:CustomDrop(name, items, coords, slots, maxW, instance, model)
end

return inventory