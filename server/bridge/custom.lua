if Config.Framework ~= "custom" then return end

fzd.bridge = {}

local Players = {}

function fzd.bridge.getJob(src)

end

function fzd.bridge.hasJob(src, job, grade)

end

function fzd.bridge.getPlayer(src)

end

function fzd.bridge.getPlayerFromIdentifier(identifier)

end

function fzd.bridge.getPlayerIdentifier(src)

end

function fzd.bridge.getFullName(src)

end

function fzd.bridge.getMoney(src, type)

end

function fzd.bridge.addMoney(src, amount, type, reason)

end

function fzd.bridge.removeMoney(src, amount, type, reason)

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