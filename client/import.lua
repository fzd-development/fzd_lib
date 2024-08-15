local config = require "config.shared"

local fzd = {
  bridge = require (("client.bridge.%s"):format(config.framework)),
  groups = require (("client.groups.%s"):format(config.groups)),
  notification = require (("client.notification.%s"):format(config.notification)),
  phone = require (("client.phone.%s"):format(config.phone)),
  target = require (("client.target.%s"):format(config.target)),
  vehiclekeys = require (("client.vehiclekeys.%s"):format(config.vehiclekeys)),
  peds = require "client.peds",
}

return fzd