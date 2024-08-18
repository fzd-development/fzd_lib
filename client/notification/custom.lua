if Config.Notification ~= "custom" then return end

fzd.notification = {}

function fzd.notification.send(payload)
  if not payload.title or not payload.description then
    return
  end

  -- add code here
end