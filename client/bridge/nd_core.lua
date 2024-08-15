local bridge = {}

local Player = {}

function bridge.getPlayerIdentifier()
  return Player and Player.identifier
end

function bridge.sendNotification(payload)
  if payload.type == "inform" then
    payload.type = "primary"
  end

  NDCore.notify({
    title = payload.title,
    description = payload.description,
    type = payload.type or 'info',
    duration = payload.duration or 5000
  })
end

RegisterNetEvent('updateCharacter', function(character)
  Player.job.name = character.job
  Player.job.grade = character.jobInfo.rank

  TriggerEvent("fzd_lib:client:updateJob", Player.job)
end)

RegisterNetEvent('ND:characterLoaded', function()
  local player = NDCore.getPlayer()

  Player = {
    job = {
      name = player.job,
      grade = player.jobInfo.rank
    },

    identifier = player.identifier,
    name = player.fullname
  }

  TriggerEvent("fzd_lib:client:playerLoaded", Player)
end)

RegisterNetEvent('ND:characterUnloaded', function(character)
  Player = table.wipe(Player)
  TriggerEvent("fzd_lib:client:playerUnloaded")
end)

return bridge