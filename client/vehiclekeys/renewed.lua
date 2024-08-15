local vehiclekeys = {}

function vehiclekeys.isVehicleLocked(vehicle)
  local lockedStatus = GetVehicleDoorLockStatus(vehicle)

  if lockedStatus == 1 or lockedStatus == 0 then
    return false
  end

  if lockedStatus == 2 or lockedStatus == 10 then
    return true
  end
end

function vehiclekeys.giveVehicleKeys(_, plate)
  exports['Renewed-Vehiclekeys']:addKey(plate)
end

return vehiclekeys