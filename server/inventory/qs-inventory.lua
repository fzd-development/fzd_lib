if Config.Inventory ~= "qs-inventory" then return end

fzd.inventory = {}

function fzd.inventory.getItemCount(src, item)
  return exports['qs-inventory']:GetItemTotalAmount(src, item)
end

function fzd.inventory.hasItem(src, item)
  return fzd.inventory.getItemCount(src, item) > 0
end

function fzd.inventory.hasInventorySpace(src, item, count)
  return exports['qs-inventory']:CanCarryItem(src, item, count)
end

function fzd.inventory.addItem(src, item, count)
  return exports['qs-inventory']:AddItem(src, item, count)
end

function fzd.inventory.removeItem(src, item, count)
  return exports['qs-inventory']:RemoveItem(src, item, count)
end

function fzd.inventory.createCustomDrop(src, name, items, coords, slots, maxW, instance, model)
  local identifier = name.gsub(" ", "_"):lower()

  exports['qs-inventory']:RegisterStash(src, identifier, slots, maxW)

  for i = 1, #items do
    local item = items[i]
    exports['qs-inventory']:AddItemIntoStash(identifier, item[1], item[2], nil, nil, slots, maxW)
  end
end