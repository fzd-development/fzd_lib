if Config.VehicleKeys ~= "renewed" then return end

fzd.vehiclekeys = {}

function fzd.vehiclekeys.isVehicleLocked(vehicle)
  local lockedStatus = GetVehicleDoorLockStatus(vehicle)

  if lockedStatus == 1 or lockedStatus == 0 then
    return false
  end

  if lockedStatus == 2 or lockedStatus == 10 then
    return true
  end
end

function fzd.vehiclekeys.giveVehicleKeys(_, plate)
  exports['Renewed-Vehiclekeys']:addKey(plate)
end