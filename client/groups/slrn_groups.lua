local groups = {}

function groups.isInGroup()
  local inGroup = lib.callback.await("fzd_lib:isInGroup", false)

  if not inGroup then
    return false
  end

  return true
end

function groups.isGroupLeader()
  local isLeader = lib.callback.await("fzd_lib:isGroupLeader", false)

  if not isLeader then
    return false
  end

  return true
end

function groups.getCurrentStage()
  return lib.callback.await("fzd_lib:getCurrentStage", false)
end

return groups