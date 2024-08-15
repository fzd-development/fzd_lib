local phone = {}

function phone.notifaction(app, title, message)
  exports["npwd"]:createSystemNotification({
    uniqId = "fzd_lib:groups",
    content = message,
    secondaryTitle = title,
    keepOpen = false,
    duration = 5000
  })
end

return phone