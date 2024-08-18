if Config.Notification ~= "default" then return end

fzd.notification = {}

function fzd.notification.send(src, title, message, type)
  if Config.Framework == "esx" then
    local xPlayer = bridge.getPlayer(src)
    xPlayer.showNotification(message)
  end

  if Config.Framework == "qb-core" then
    TriggerClientEvent('QBCore:Notify', src, {
      text = title,
      caption = message
    }, type or "primary")
  end
end