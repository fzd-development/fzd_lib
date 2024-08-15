local bridge = {}

local QBCore = exports['qb-core']:GetCoreObject()

local Player = {}

function bridge.getPlayerIdentifier()
  return Player and Player.identifier
end

function bridge.sendNotification(payload)
  if payload.type == "inform" then
    payload.type = "primary"
  end

  QBCore.Functions.Notify({
    text = payload.title,
    caption = payload.description,
  }, payload.type, payload.duration)
end

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
  Player.job.name = job.name
  Player.job.grade = job.grade

  TriggerEvent("fzd_lib:client:updateJob", Player.job)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
  local PlayerData = QBCore.Functions.GetPlayerData()

  Player = {
    job = {
      name = PlayerData.job.name,
      grade = PlayerData.job.grade
    },

    identifier = PlayerData.citizenid,
    name = PlayerData.charinfo.firstname .. ' ' .. PlayerData.charinfo.lastname
  }

  TriggerEvent("fzd_lib:client:playerLoaded", Player)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
  Player = table.wipe(Player)
  TriggerEvent("fzd_lib:client:playerUnloaded")
end)

return bridge