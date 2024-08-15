local target = {}

function target.addLocalEntity(entity, payload)
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

function target.removeLocalEntity(entity, payload)
  exports['qb-target']:RemoveTargetEntity(entity, payload)
end

function target.disableTargeting(boolean)
  exports['qb-target']:AllowTargeting(boolean)
end

return target