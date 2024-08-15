local config = require("config.shared")
local notifaction = require (("client.notification.%s"):format(config.notification))
local phone = require("client.phone.%s"):format(config.phone)

local groups = {}

RegisterNetEvent("fzd_lib:notifyGroup", function(title, message)
  notifaction.send({
    title = title,
    description = message,
  })
end)

RegisterNetEvent("fzd_lib:pNotifyGroup", function(app, title, message)
  phone.notifaction(app, title, message)
end)

function groups.isInGroup()
  local inGroup = exports["ps-playergroups"]:GetGroupID()

  if inGroup == 0 then
    return false
  end

  return true
end

function groups.isGroupLeader()
  local isLeader = exports["ps-playergroups"]:IsGroupLeader()

  if not isLeader then
    return false
  end

  return true
end

function groups.getCurrentStage()
  return lib.callback.await("fzd_lib:getCurrentStage", false)
end

return groups