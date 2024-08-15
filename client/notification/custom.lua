local notification = {}

function notification.send(payload)
  if not payload.title or not payload.description then
    return
  end

  -- add code here
end

return notification