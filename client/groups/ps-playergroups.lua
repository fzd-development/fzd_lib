if Config.Groups ~= "ps-playergroups" then return end

fzd.groups = {}

RegisterNetEvent("fzd_lib:notifyGroup", function(title, message)
  notifaction.send({
    title = title,
    description = message,
  })
end)

RegisterNetEvent("fzd_lib:pNotifyGroup", function(app, title, message)
  phone.notifaction(app, title, message)
end)

function fzd.groups.isInGroup()
  local inGroup = exports["ps-playergroups"]:GetGroupID()

  if inGroup == 0 then
    return false
  end

  return true
end

function fzd.groups.isGroupLeader()
  local isLeader = exports["ps-playergroups"]:IsGroupLeader()

  if not isLeader then
    return false
  end

  return true
end

function fzd.groups.getCurrentStage()
  return lib.callback.await("fzd_lib:getCurrentStage", false)
end