local groups = {}

function groups.isInGroup()
  local inGroup = exports["yseries"]:GetGroupId()

  if inGroup == 0 then
    return false
  end

  return true
end

function groups.isGroupLeader()
  local isLeader = exports["yseries"]:IsGroupLeader()

  if not isLeader then
    return false
  end

  return true
end

function groups.getCurrentStage()
  return lib.callback.await("fzd_lib:getCurrentStage", false)
end

return groups