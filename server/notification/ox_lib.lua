local notification = {}

function notification.send(src, title, message, type)
  TriggerClientEvent('ox_lib:notify', src, {
    title = title,
    description = message,
    type = type or "inform",
  })
end

return notification