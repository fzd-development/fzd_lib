local bridge = {}

local Player = {}

function bridge.getPlayerIdentifier()
  return Player and Player.identifier
end

function bridge.sendNotification(payload)
  return Player and Player.identifier
end

return bridge