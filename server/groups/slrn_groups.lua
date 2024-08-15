local groups = {}

lib.callback.register("fzd_lib:isInGroup", function()
  local group = exports.slrn_groups:GetGroupByMembers(source)

  if not group then
    return false
  end

  return true
end)

lib.callback.register("fzd_lib:isGroupLeader", function()
  local group = exports.slrn_groups:GetGroupByMembers(source)
  local leader = exports.slrn_groups:GetGroupLeader(group)

  if leader == source then
    return true
  end

  return false
end)

lib.callback.register("fzd_lib:getCurrentStage", function()
  local group = exports.slrn_groups:GetGroupByMembers(source)
  local stages = exports.slrn_groups:GetGroupStages(group)
  local currentStage = 1

  for i = 1, #stages do
    if not stages[i].isDone then
      currentStage = i
      break
    end
  end

  return currentStage
end)

function groups.getGroupByMember(member)
  return exports.slrn_groups:GetGroupByMembers(member)
end

function groups.getGroupMembers(group)
  return exports.slrn_groups:getGroupMembers(group)
end

function groups.setJobStatus(group, job, status)
  exports.slrn_groups:setJobStatus(group, job, status)
end

function groups.getGroupStages(group)
  return exports.slrn_groups:GetGroupStages(group)
end

function groups.createBlipForGroup(group, name, blip)
  print("slrn_groups")
  exports.slrn_groups:CreateBlipForGroup(group, name, blip)
end

function groups.removeBlipForGroup(group, name)
  exports.slrn_groups:RemoveBlipForGroup(group, name)
end

function groups.notifyGroup(group, message, type)
  exports.slrn_groups:NotifyGroup(group, message, type)
end

function groups.pNotifyGroup(group, title, message)
  exports.slrn_groups:pNotifyGroup(group, title, message)
end

return groups