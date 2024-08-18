if Config.Groups ~= "ps-playergroups" then return end

fzd.groups = {}

lib.callback.register("fzd_lib:getCurrentStage", function()
  local group = exports["ps-playergroups"]:FindGroupByMember(source)
  local stages = exports["ps-playergroups"]:getJobStatus(group)
  local currentStage = 1

  for i = 1, #stages do
    if not stages[i].isDone then
      currentStage = i
      break
    end
  end

  return currentStage
end)

function fzd.groups.getGroupByMember(member)
  return exports["ps-playergroups"]:FindGroupByMember(member)
end

function fzd.groups.getGroupMembers(group)
  return exports["ps-playergroups"]:getGroupMembers(group)
end

function fzd.groups.setJobStatus(group, _, status)
  exports["ps-playergroups"]:setJobStatus(group, status)
end

function fzd.groups.getGroupStages(group)
  return exports["ps-playergroups"]:getJobStatus(group)
end

function fzd.groups.createBlipForGroup(group, name, blip)
  exports["ps-playergroups"]:CreateBlipForGroup(group, name, blip)
end

function fzd.groups.removeBlipForGroup(group, name)
  exports["ps-playergroups"]:RemoveBlipForGroup(group, name)
end

function fzd.groups.notifyGroup(group, message, type)
  local members = groups.getGroupMembers(group)

  for i = 1, #members do
    local member = members[i]

    TriggerClientEvent("fzd_lib:notifyGroup", member, title, message)
  end
end

function fzd.groups.pNotifyGroup(group, title, message)
  local members = groups.getGroupMembers(group)

  for i = 1, #members do
    local member = members[i]

    TriggerClientEvent("fzd_lib:pNotifyGroup", member, title, message)
  end
end