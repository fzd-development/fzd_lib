local target = {}

function target.addLocalEntity(entity, payload)
  exports.ox_target:addLocalEntity(entity, payload)
end

function target.removeLocalEntity(entity, payload)
  exports.ox_target:removeLocalEntity(entity, payload)
end

function target.disableTargeting(boolean)
  exports.ox_target:disableTargeting(boolean)
end

return target