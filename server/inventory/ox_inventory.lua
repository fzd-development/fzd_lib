if Config.Inventory ~= "ox_inventory" then return end

fzd.inventory = {}

function fzd.inventory.getItemCount(src, item)
  return exports.ox_inventory:GetItem(src, item, false, true)
end

function fzd.inventory.hasItem(src, item)
  return fzd.inventory.getItemCount(src, item) > 0
end

function fzd.inventory.hasInventorySpace(src, item, count)
  return exports.ox_inventory:CanCarryItem(src, item, count)
end

function fzd.inventory.addItem(src, item, count)
  return exports.ox_inventory:AddItem(src, item, count)
end

function fzd.inventory.removeItem(src, item, count)
  return exports.ox_inventory:RemoveItem(src, item, count)
end

function fzd.inventory.createCustomDrop(name, items, coords, slots, maxW, instance, model)
  exports.ox_inventory:CustomDrop(name, items, coords, slots, maxW, instance, model)
end