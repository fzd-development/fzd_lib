local config = require "config.shared"

local vehiclekeys = {}

function vehiclekeys.isVehicleLocked(vehicle)
  if config.framework == "qbcore" or config.framework == "esx" then
    local lockedStatus = GetVehicleDoorLockStatus(vehicle)

    if lockedStatus == 1 or lockedStatus == 0 then
      return false
    end

    if lockedStatus == 2 or lockedStatus == 10 then
      return true
    end
  end

  if config.framework == "nd_core" then
    lockedStatus = lib.callback.await("fzd_lib:isVehicleLocked", vehicle)
    return lockedStatus
  end
end

function vehiclekeys.giveVehicleKeys(vehicle, plate)
  TriggerServerEvent("qb-vehiclekeys:server:AcquireVehicleKeys", plate)

  if config.framework == "nd_core" then
    TriggerServerEvent("fzd_lib:giveVehicleKeys", NetworkGetNetworkIdFromEntity(vehicle))
  end
end

return vehiclekeys