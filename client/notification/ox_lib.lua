if Config.Notification ~= "ox_lib" then return end

fzd.notification = {}

function fzd.notification.send(payload)
  if not payload.title or not payload.description then
    return
  end

  lib.notify({
    title = payload.title,
    description = payload.description,
    type = payload.type or 'info',
    duration = payload.duration or 5000
  })
end