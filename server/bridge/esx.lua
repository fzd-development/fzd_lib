local bridge = {}

local success, ESX = pcall(function()
  return exports['es_extended']:getSharedObject()
end)

if not success then
  TriggerEvent('esx:getSharedObject', function(object)
      ESX = object
  end)
end

local Players = {}

function bridge.getJob(src)
  return Players[src] and Players[src].job
end

function bridge.hasJob(src, job, grade)
  local Player = Players[src]

  if not Player then
    return false
  end

  return Player.job.name == job and Player.job.grade >= grade
end

function bridge.getPlayer(src)
  return Players[src]
end

function bridge.getPlayerIdentifier(src)
  return Players[src] and Players[src].identifier or false
end

function bridge.getFullName(src)
  return Players[src] and Players[src].name or false
end

function bridge.getMoney(src, type)
  local xPlayer = ESX.GetPlayerFromId(src)

  if not xPlayer then
    return
  end

  return xPlayer.getAccount(type).money
end

function bridge.addMoney(src, amount, type, reason)
  local xPlayer = ESX.GetPlayerFromId(src)

  if not xPlayer then
    return
  end

  if type == "cash" then
    type = "money"
  end

  xPlayer.addAccountMoney(type, amount, reason)
end

function bridge.removeMoney(src, amount, type, reason)
  local xPlayer = ESX.GetPlayerFromId(src)

  if not xPlayer then
    return
  end

  if type == "cash" then
    type = "money"
  end

  if xPlayer.getAccount(type).money < amount then
    return false
  end

  xPlayer.removeAccountMoney(type, amount, reason)
end

AddEventHandler('esx:setJob', function(source, job, lastJob)
  local xPlayer = Players[source]

  if not xPlayer then
    return
  end

  TriggerEvent("fzd_lib:server:updateJob", source, lastJob, job.name, job.grade)

  xPlayer.job.name = job.name
  xPlayer.job.grade = job.grade
end)

local function updatePlayerData(src)
  local xPlayer = ESX.GetPlayerFromId(src)

  Players[PlayerData.source] = {
    job = {
      name = xPlayer.job.name,
      grade = xPlayer.job.grade
    },

    identifier = xPlayer.identifier,
    name = xPlayer.name
  }
end

AddEventHandler('esx:playerLoaded', function(player)
  updatePlayerData(player)
  TriggerEvent("fzd_lib:server:playerLoaded", player, Players[player])
end)

CreateThread(function()
  Wait(250)

  for _, sourceId in ipairs(ESX.GetPlayers()) do
    updatePlayerData(sourceId)
    Wait(50)
  end
end)

AddEventHandler('esx:playerDropped', function(playerId)
  if Players[playerId] then
    TriggerEvent("fzd_lib:server:playerUnloaded", playerId)
    Players[playerId] = nil
  end
end)

AddEventHandler('playerDropped', function()
  if Players[source] then
    TriggerEvent('fzd_lib:server:playerUnloaded', source, Players[source])
    Players[source] = nil
  end
end)

return bridge