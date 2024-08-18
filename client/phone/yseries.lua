if Config.Phone ~= "yseries" then return end

fzd.phone = {}

function fzd.phone.notifaction(app, title, message)
  exports["yseries"]:SendNotification({
    app = app or nil,
    title = title,
    text = message,
  }, "source",  source)
end