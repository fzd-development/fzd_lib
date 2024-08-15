local bridge = {}

local Players = {}

function bridge.getJob(src)

end

function bridge.hasJob(src, job, grade)

end

function bridge.getPlayer(src)

end

function bridge.getPlayerIdentifier(src)

end

function bridge.getFullName(src)

end

function bridge.getMoney(src, type)

end

function bridge.addMoney(src, amount, type, reason)

end

function bridge.removeMoney(src, amount, type, reason)

end

AddEventHandler('updateJobEvent', function()

end)

local function updatePlayerData()

end

AddEventHandler('playerLoadedEvent', function()

end)

AddEventHandler('playerDroppedEvent', function(playerId)

end)

AddEventHandler('playerDropped', function()
  if Players[source] then
    TriggerEvent('fzd_lib:server:playerUnloaded', source, Players[source])
    Players[source] = nil
  end
end)

return bridge