if Config.Framework ~= "nd_core" then return end

fzd.bridge = {}

local Players = {}

function fzd.bridge.getJob(src)
  return Players[src] and Players[src].job
end

function fzd.bridge.hasJob(src, job, grade)
  local Player = Players[src]

  if not Player then
    return false
  end

  return Player.job.name == job and Player.job.grade >= grade
end

function fzd.bridge.getPlayer(src)
  return Players[src]
end

function fzd.bridge.getPlayerFromIdentifier(identifier)
  for _, Player in pairs(Players) do
    if Player.identifier == identifier then
      return Player
    end
  end

  return false
end

function fzd.bridge.getPlayerIdentifier(src)
  return Players[src] and Players[src].identifier or false
end

function fzd.bridge.getFullName(src)
  return Players[src] and Players[src].name or false
end

function fzd.bridge.getMoney(src, type)
  local character = NDCore.getPlayer(src)

  if not character then
    return
  end

  return character[type]
end

function fzd.bridge.addMoney(src, amount, type, reason)
  local character = NDCore.getPlayer(src)

  if not character then
    return
  end

  character.addMoney(type, amount, reason or 'unknown')
end

function fzd.bridge.removeMoney(src, amount, type, reason)
  local character = NDCore.getPlayer(src)

  if not character then
    return
  end

  if character[type] < amount then
    return
  end

  player.deductMoney(type, amount, reason or 'unknown')
end

AddEventHandler('ND:updateCharacter', function(character)
  local Player = Players[character.source]

  if not Player then
    return
  end

  TriggerEvent("fzd_lib:server:updateJob", character.source, Player.job, character.job, character.jobInfo.grade)

  Player.job.name = character.job
  Player.job.grade = character.jobInfo.grade
end)

local function updatePlayerData(PlayerData)
  Players[PlayerData.source] = {
    job = {
      name = PlayerData.job,
      grade = PlayerData.jobInfo.grade
    },

    identifier = PlayerData.identifier,
    name = PlayerData.fullname,
    source = PlayerData.source
  }
end

AddEventHandler('ND:characterLoaded', function(character)
  local PlayerData = character

  updatePlayerData(PlayerData)
  TriggerEvent("fzd_lib:server:playerLoaded", PlayerData.source, Players[PlayerData.source])
end)

CreateThread(function()
  Wait(250)

  for _, sourceId in ipairs(NDCore.getPlayer()) do
    local character = NDCore.getPlayer(tonumber(sourceId))

    if not character then
      return
    end

    updatePlayerData(character)
    Wait(50)
  end
end)

AddEventHandler('ND:characterUnloaded', function(source)
  if Players[source] then
    TriggerEvent("fzd_lib:server:playerUnloaded", source)
    Players[source] = nil
  end
end)

AddEventHandler('playerDropped', function()
  if Players[source] then
    TriggerEvent('fzd_lib:server:playerUnloaded', source, Players[source])
    Players[source] = nil
  end
end)