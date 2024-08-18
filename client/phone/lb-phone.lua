if Config.Phone ~= "lp-phone" then return end

fzd.phone = {}

function fzd.phone.notifaction(app, title, message)
  exports['lb-phone']:SendNotification({
    app = app or nil,
    title = title or nil,
    content = message,
  })
end