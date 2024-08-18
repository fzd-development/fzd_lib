if Config.Groups ~= "yseries" then return end

fzd.groups = {}

function fzd.groups.isInGroup()
  local inGroup = exports["yseries"]:GetGroupId()

  if inGroup == 0 then
    return false
  end

  return true
end

function fzd.groups.isGroupLeader()
  local isLeader = exports["yseries"]:IsGroupLeader()

  if not isLeader then
    return false
  end

  return true
end

function fzd.groups.getCurrentStage()
  return lib.callback.await("fzd_lib:getCurrentStage", false)
end