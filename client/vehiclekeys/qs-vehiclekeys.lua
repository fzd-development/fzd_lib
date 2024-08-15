local vehiclekeys = {}

function vehiclekeys.isVehicleLocked(vehicle)
  local lockedStatus = exports["qs-vehiclekeys"]:GetDoorState(vehicle)

  if lockedStatus == 1 or lockedStatus == 0 then
    return false
  end

  if lockedStatus == 2 or lockedStatus == 10 then
    return true
  end
end

function vehiclekeys.giveVehicleKeys(vehicle, plate)
  local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
  exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
end

return vehiclekeys