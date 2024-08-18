if Config.Target ~= "qb-target" then return end

fzd.target = {}

function fzd.target.addLocalEntity(entity, payload)
  for i = 1, #payload do
    local option = payload[i]

    if option.onSelect then
      option.action = onSelect
    end

    if option.serverEvent then
      option.type = "server"
      option.event = option.serverEvent
    end
  end

  exports["qb-target"]:AddTargetEntity(entity, payload)
end

function fzd.target.removeLocalEntity(entity, payload)
  exports['qb-target']:RemoveTargetEntity(entity, payload)
end

function fzd.target.disableTargeting(boolean)
  exports['qb-target']:AllowTargeting(boolean)
end