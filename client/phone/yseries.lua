local phone = {}

function phone.notifaction(app, title, message)
  exports["yseries"]:SendNotification({
    app = app or nil,
    title = title,
    text = message,
  }, "source",  source)
end

return phone