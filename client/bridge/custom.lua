if Config.Framework ~= "custom" then return end

fzd.bridge = {}

local Player = {}

function fzd.bridge.getPlayerIdentifier()
  return Player and Player.identifier
end

function fzd.bridge.sendNotification(payload)
  return Player and Player.identifier
end