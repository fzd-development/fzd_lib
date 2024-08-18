if Config.VehicleKeys ~= "default" then return end

fzd.vehiclekeys = {}

function fzd.vehiclekeys.isVehicleLocked(vehicle)
  if Config.Framework == "qbcore" or Config.Framework == "esx" then
    local lockedStatus = GetVehicleDoorLockStatus(vehicle)

    if lockedStatus == 1 or lockedStatus == 0 then
      return false
    end

    if lockedStatus == 2 or lockedStatus == 10 then
      return true
    end
  end

  if Config.Framework == "nd_core" then
    lockedStatus = lib.callback.await("fzd_lib:isVehicleLocked", vehicle)
    return lockedStatus
  end
end

function fzd.vehiclekeys.giveVehicleKeys(vehicle, plate)
  TriggerServerEvent("qb-vehiclekeys:server:AcquireVehicleKeys", plate)

  if Config.Framework == "nd_core" then
    TriggerServerEvent("fzd_lib:giveVehicleKeys", NetworkGetNetworkIdFromEntity(vehicle))
  end
end