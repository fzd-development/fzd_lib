local config = require "config.shared"
local bridge = require (("server.bridge.%s"):format(config.framework))

local notification = {}

function notification.send(src, title, message, type)
  if config.framework == "esx" then
    local xPlayer = bridge.getPlayer(src)
    xPlayer.showNotification(message)
  end

  if config.framework == "qbcore" then
    TriggerClientEvent('QBCore:Notify', src, {
      text = title,
      caption = message
    }, type or "primary")
  end
end

return notification