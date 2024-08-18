fzd = {}

exports("getLib", function()
  return fzd
end)

local paths = {
  bridge = ("client/bridge/%s.lua"):format(Config.Framework),
  groups = ("client/groups/%s.lua"):format(Config.Groups),
  notification = ("client/notification/%s.lua"):format(Config.Notification),
  phone = ("client/phone/%s.lua"):format(Config.Phone),
  target = ("client/target/%s.lua"):format(Config.Target),
  vehiclekeys = ("client/vehiclekeys/%s.lua"):format(Config.VehicleKeys),
  peds = "client/peds.lua"
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