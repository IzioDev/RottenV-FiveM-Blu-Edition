Citizen.CreateThread( function()
	RegisterNetEvent('loadPlayerIn')
	AddEventHandler('loadPlayerIn', function(x,y,z,hunger,thirst,weapons) 
		local playerPed = GetPlayerPed(-1)
		SetEntityCoords(playerPed,x,y,z)
		weaponTable = {}
		weaponTable.ammo = {}
		index = 0
		for value in string.gmatch(weapons, "|") do 
			weaponTable[index] = value
			index = index + 1
		end
		index = 0
		for value in string.gmatch(weapons, ":") do 
			weaponTable.ammo[index] = value
			index = index + 1
		end
		index = 0
		for _,theWeapon in ipairs(weaponTable) do 
			GiveWeaponToPed(ped, GetHashKey(theWeapon), weaponTable.ammo[index], true, true)
			index = index +1
		end
		DecorSetFloat(playerPed, "hunger", hunger)
		DecorSetFloat(playerPed, "thirst", thirst)
	end)
	
	AddEventHandler("playerSpawned", function()
		TriggerServerEvent("spawnPlayer", GetPlayerServerId(PlayerId()))
		Citizen.Trace("Requesting Spawn!")
		Citizen.Trace("Sent!")
	end)
	
	
end)

