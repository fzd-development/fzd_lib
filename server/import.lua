local config = require "config.shared"

local fzd = {
  bridge = require (("server.bridge.%s"):format(config.framework)),
  groups = require (("server.groups.%s"):format(config.groups)),
  inventory = require (("server.inventory.%s"):format(config.inventory)),
  notifaction = require (("server.notification.%s"):format(config.notification)),
  vehiclekeys = require (("server.vehiclekeys.%s"):format(config.vehiclekeys)),
}

return fzd