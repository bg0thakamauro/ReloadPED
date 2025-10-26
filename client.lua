RegisterCommand('reloadped', function()
  local ped = PlayerPedId()
  local model = GetEntityModel(ped)
  local coords = GetEntityCoords(ped)
  local heading = GetEntityHeading(ped)
  local health = GetEntityHealth(ped)
  local armour = GetPedArmour(ped)
  
  RequestModel(model)
  while not HasModelLoaded(model) do
      Wait(0)
  end

  SetPlayerModel(PlayerId(), model)
  SetPedDefaultComponentVariation(PlayerPedId())
  SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z)
  SetEntityHeading(PlayerPedId(), heading)
  SetEntityHealth(PlayerPedId(), health)
  SetPedArmour(PlayerPedId(), armour)
  SetModelAsNoLongerNeeded(model)

  TriggerEvent('chat:addMessage', {
      color = { 0, 255, 0 },
      multiline = true,
      args = {"[ReloadPED]", "Model reloaded successfully!"}
  })
end)
