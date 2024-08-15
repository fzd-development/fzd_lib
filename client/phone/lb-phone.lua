local phone = {}

function phone.notifaction(app, title, message)
  exports['lb-phone']:SendNotification({
    app = app or nil,
    title = title or nil,
    content = message,
  })
end

return phone