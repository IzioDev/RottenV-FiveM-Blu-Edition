-- Thanks to @nobody
Citizen.CreateThread(function()
	while true do
		-- These natives has to be called every frame.
		SetVehicleDensityMultiplierThisFrame(0.0)
		SetPedDensityMultiplierThisFrame(0.0)
		SetRandomVehicleDensityMultiplierThisFrame(0.0)
		SetParkedVehicleDensityMultiplierThisFrame(0.0)
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
		
		local playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(playerPed) 
		RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0, pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0);
		
		-- These natives do not have to be called everyframe.
		SetGarbageTrucks(0)
		SetRandomBoats(0)
		
		EnableDispatchService(1,false)
		EnableDispatchService(2,false)
		EnableDispatchService(3,false)
		EnableDispatchService(4,false)
		EnableDispatchService(5,false)
		EnableDispatchService(6,false)
		EnableDispatchService(7,false)
		EnableDispatchService(8,false)
		EnableDispatchService(9,false)
		EnableDispatchService(10,false)
		EnableDispatchService(11,false)
		EnableDispatchService(12,false)
		EnableDispatchService(13,false)
		EnableDispatchService(14,false)
		EnableDispatchService(15,false)
		
		Citizen.Wait(1)
	end
end)



Citizen.CreateThread(function()
	while true do
		local handle, ped = FindFirstPed()
		local finished = false -- FindNextPed will turn the first variable to false when it fails to find another ped in the index
		repeat
			if IsPedDeadOrDying(ped) and not IsPedAPlayer(ped) then
				SetEntityAsMissionEntity(ped)
				SetEntityAsNoLongerNeeded(ped)
				model = GetEntityModel(ped)
				SetModelAsNoLongerNeeded(model)
				DeleteEntity(ped)
				Citizen.Trace("Deleted Dead Zombie")
			end
			finished, ped = FindNextPed(handle) -- first param returns true while entities are found
		until not finished
		EndFindPed(handle)
		Citizen.Wait(60000)
end
end)
