local config = require "config.shared"

local vehiclekeys = {}

lib.callback.register("fzd_lib:isVehicleLocked", function(vehicle)
  local vehicle = NDCore.getVehicle(vehicle)
  return vehicle.locked
end)

RegisterNetEvent("fzd_lib:giveVehicleKeys", function(vehicle)
  local vehicle = NetworkGetEntityFromNetworkId(vehicle)
  
  if config.framework == "nd_core" then
    local state = Entity(vehicle).state
    state.hotwired = true
    state.locked = false
  end
end)

return vehiclekeys