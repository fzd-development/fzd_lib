local config = require "config.shared"
local target = require (("client.target.%s"):format(config.target))

local peds = {}
local storage = {}

local function spawnPed(payload)
  if not payload.coords or not payload.model then
    return
  end

  lib.requestModel(payload.model, 1000)

  local ped = CreatePed(0, payload.model, payload.coords.x, payload.coords.y, payload.coords.z, payload.heading, false, true)

  if payload.freeze then
    FreezeEntityPosition(ped, true)
  end

  if payload.invincible then
    SetEntityInvincible(ped, true)
  end

  if payload.tempevents then
    SetBlockingOfNonTemporaryEvents(ped, true)
  end

  if payload.animDict and payload.animName then
    lib.requestAnimDict(payload.animDict, 1000)
    TaskPlayAnim(ped, payload.animDict, payload.animName, 8.0, 0.0, -1, 1, 0, false, false, false)
    RemoveAnimDict(payload.animDict)
  end

  if payload.scenario then
    TaskStartScenarioInPlace(ped, payload.scenario, 0, true)
  end

  if payload.target then
    target.addLocalEntity(ped, payload.target)
  end

  SetModelAsNoLongerNeeded(payload.model)

  return ped
end

function peds.addPed(payload)
  payload = table.type(payload) == "array" and payload or { payload }

  local pedSize = #storage
  local resource = GetInvokingResource()
  local pCoords = GetEntityCoords(cache.ped)

  for i = 1, #payload do
    local ped = payload[i]

    if ped.coords and ped.model then
      if #(pCoords - ped.coords) < ped.dist then
        ped.spawned = spawnPed(ped)
      end

      ped.resource = resource

      pedSize = pedSize + 1
      storage[pedSize] = ped
    end
  end
end

local function deletePed(payload)
  if not payload.entity then
    return
  end

  if payload.entity == 0 then
    return
  end

  if not DoesEntityExist(payload.entity) then
    return
  end

  if payload.target then
    for i = 1, #payload.target do
      target.removeLocalEntity(payload.entity, payload.target[i]?.name)
    end
  end

  SetEntityAsMissionEntity(payload.entity, false, true)
  DeleteEntity(payload.entity)
end

function peds.removePed(payload)
  if not payload.id then
    return
  end

  for i = 1, #storage do
    local ped = storage[i]

    if ped.id == payload.id then
      if ped.spawned then
        deletePed({ entity = ped.spawned, target = ped.target })
      end

      table.remove(storage, i)
      break
    end
  end
end

function peds.setPedCoords(payload)
  if not payload.id then
    return
  end

  for i = 1, #storage do
    local ped = storage[i]

    if ped.id == payload.id then
      ped.coords = payload.coords
      ped.heading = payload.heading

      if ped.spawned then
        SetEntityCoords(ped.spawned, ped.coords.x, ped.coords.y, ped.coords.z, false, false, false, false)
        SetEntityHeading(ped.spawned, ped.heading)
      end

      break
    end
  end
end

function peds.getPedById(id)
  if not id then
    return
  end

  for i = 1, #storage do
    local ped = storage[i]

    if ped.spawned and ped.id == id then
      return ped.spawned
    end
  end
end

function peds.removeResourcePed(resource)
  resource = resource or GetInvokingResource() or cache.resource

  for i = #storage, 1, -1 do
    local ped = storage[i]

    if ped.resource == resource then
      if ped.spawned then
        deletePed({ entity = ped.spawned, target = ped.target })
      end

      table.remove(storage, i)
    end
  end
end

AddEventHandler("onClientResourceStop", function(resource)
  for i = #storage, 1, -1 do
    local ped = storage[i]

    if ped.resource == resource then
      if ped.spawned then
        deletePed({ entity = ped.spawned, target = ped.target })
      end

      table.remove(storage, i)
    end
  end
end)

CreateThread(function()
  while true do
    local pCoords = GetEntityCoords(cache.ped)
    local pedCount = #storage

    for i = 1, pedCount do
      local ped = storage[i]
      local inDist = #(pCoords - ped.coords) < ped.dist

      if ped.spawned and not inDist then
        deletePed({ entity = ped.spawned, target = ped.target })
        ped.spawned = nil
        Wait(0)
      end

      if not ped.spawned and inDist then
        ped.spawned = spawnPed(ped)
        Wait(0)
      end
    end

    Wait(5000)
  end
end)

return peds