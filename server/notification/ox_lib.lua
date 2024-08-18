if Config.Notification ~= "ox_lib" then return end

fzd.notification = {}

function fzd.notification.send(src, title, message, type)
  TriggerClientEvent('ox_lib:notify', src, {
    title = title,
    description = message,
    type = type or "inform",
  })
end