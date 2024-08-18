if Config.Phone ~= "default" then return end

fzd.phone = {}

function fzd.phone.notifaction(app, title, message)
  if Config.Framework == "qbcore" or Config.Framework == "qbx_core" then
    TriggerEvent("qb-phone:client:CustomNotification", title, message, "fas fa-users", "#12b886")
  end
end