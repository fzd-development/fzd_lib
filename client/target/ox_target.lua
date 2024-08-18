if Config.Target ~= "ox_target" then return end

fzd.target = {}

function fzd.target.addLocalEntity(entity, payload)
  exports.ox_target:addLocalEntity(entity, payload)
end

function fzd.target.removeLocalEntity(entity, payload)
  exports.ox_target:removeLocalEntity(entity, payload)
end

function fzd.target.disableTargeting(boolean)
  exports.ox_target:disableTargeting(boolean)
end