fzd = {}

exports("getLib", function()
  return fzd
end)

local paths = {
  bridge = ("server/bridge/%s.lua"):format(Config.Framework),
  groups = ("server/groups/%s.lua"):format(Config.Groups),
  inventory = ("server/inventory/%s.lua"):format(Config.Inventory),
  notification = ("server/notification/%s.lua"):format(Config.Notification),
  vehiclekeys = ("server/vehiclekeys/%s.lua"):format(Config.VehicleKeys)
}

for _, path in pairs(paths) do
  local file = LoadResourceFile(cache.resource, path)

  if not file then
    return error(("File %s does not exist."):format(path))
  end

  local func, err = load(file, ("@@%s/%s"):format(cache.resource, path))

  if not func or err then
    return error(err)
  end

  func()
end