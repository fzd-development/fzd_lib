local config = require "config.shared"

local phone = {}

function phone.notifaction(app, title, message)
  if config.framework == "qbcore" or config.framework == "qbx_core" then
    TriggerEvent("qb-phone:client:CustomNotification", title, message, "fas fa-users", "#12b886")
  end
end

return phone