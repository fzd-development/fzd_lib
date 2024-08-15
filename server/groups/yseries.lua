local groups = {}

lib.callback.register("fzd_lib:getCurrentStage", function()
  local group = exports["yseries"]:FindGroupByMember(source)
  local stages = exports["yseries"]:GetJobStatus(group)
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
  return exports["yseries"]:FindGroupByMember(member)
end

function groups.getGroupMembers(group)
  return exports["yseries"]:GetGroupMembers(group)
end

function groups.setJobStatus(group, _, status)
  exports["yseries"]:SetJobStatus(group, status)
end

function groups.getGroupStages(group)
  return exports["yseries"]:GetJobStatus(group)
end

function groups.createBlipForGroup(group, name, blip)
  exports["yseries"]:CreateBlipForGroup(group, name, blip)
end

function groups.removeBlipForGroup(group, name)
  exports["yseries"]:RemoveBlipForGroup(group, name)
end

function groups.notifyGroup(group, message, type)
  exports["yseries"]:NotifyGroup(group, message)
end

function groups.pNotifyGroup(group, title, message)
  exports["yseries"]:NotifyGroup(group, message)
end

return groups