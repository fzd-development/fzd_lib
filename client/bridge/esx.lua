if Config.Framework ~= "esx" then return end

fzd.bridge = {}

local Player = {}
local Loaded = false

success, ESX = pcall(function()
  return exports['es_extended']:getSharedObject()
end)

if not success then
  while not ESX do
    TriggerEvent('esx:getSharedObject', function(object)
      ESX = object
    end)

    Wait(500)
  end
end

function fzd.bridge.getPlayerIdentifier()
  return Player and Player.identifier
end

function fzd.bridge.sendNotification(payload)
  if payload.type == "inform" then
    payload.type = "info"
  end

  ESX.ShowNotification(payload.message, payload.type, payload.duration)
end

RegisterNetEvent('esx:setPlayerData', function(key, value)
  if not Loaded or GetInvokingResource() ~= 'es_extended' then
    return
  end

  if key ~= 'job' then
    return
  end

  Player.job.name = value.name
  Player.job.grade = value.grade

  TriggerEvent("fzd_lib:client:updateJob", Player.job)
end)

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
  Player = {
    job = {
      name = xPlayer.job.name,
      grade = xPlayer.job.grade
    },

    identifier = xPlayer.identifier,
    name = xPlayer.firstName .. ' ' .. xPlayer.lastName
  }

  Loaded = true
  TriggerEvent("fzd_lib:client:playerLoaded", Player)
end)

RegisterNetEvent('esx:onPlayerLogout', function()
  Player = table.wipe(Player)
  TriggerEvent("fzd_lib:client:playerUnloaded")
end)