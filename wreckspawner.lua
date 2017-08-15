-- CONFIG --

-- Zombies have a 1 in 150 chance to spawn with guns
-- It will choose a gun in this list when it happens
-- Weapon list here: https://www.se7ensins.com/forums/threads/weapon-and-explosion-hashes-list.1045035/
-- Only add the weapon name, not the weapon hash
local wrecks =
{
}

-- CODE --

players = {}
RegisterNetEvent("Z:playersupdate")
AddEventHandler("Z:playersupdate", function(newPlayers)
	players = newPlayers
end)

wrecks = {}

Citizen.CreateThread(function()
	while true do
		Wait(1000)
		
		if #wrecks < 9 then
			x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			
			newX = x + math.random(-300, 300)
			while newX > x - 60 and newX < x + 60 do
				Wait(1)
				newX = x + math.random(-300, 300)
			end
			
			newY = y + math.random(-300, 300)
			while newY > y - 60 and newY < y + 60 do
				Wait(1)
				newY = y + math.random(-300, 300)
			end
			
			repeat
				Wait(1)
				
				newX = x + math.random(-300, 300)
				while newX > x - 60 and newX < x + 60 do
					Wait(1)
					newX = x + math.random(-300, 300)
				end
				
				newY = y + math.random(-300, 300)
				while newY > y - 60 and newY < y + 60 do
					Wait(1)
					newY = y + math.random(-300, 300)
				end
				
				for _, player in pairs(players) do
					Wait(1)
					playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
					if newX > playerX - 60 and newX < playerX + 60 or newY > playerY - 60 and newY < playerY + 60 then
						canSpawn = false
						break
					else
						canSpawn = true
					end
				end
			until canSpawn
			
			RequestModel(GetHashKey("prop_rub_trukwreck_1"))
			while not HasModelLoaded(GetHashKey("prop_rub_trukwreck_1")) or not HasCollisionForModelLoaded(GetHashKey("prop_rub_trukwreck_1")) do
				Wait(1)
			end
			
			wreck = CreateObject(GetHashKey("prop_rub_trukwreck_1"), newX, newY, z - 500, true, true, true)
			SetEntityCollision(wreck, true, true)
			SetEntityDynamic(wreck, true)
			Wait(5000)
			PlaceObjectOnGroundProperly(wreck)
			
			table.insert(wrecks, wreck)
		end
		
		for i, wreck in pairs(wrecks) do
			if not DoesEntityExist(wreck) then
				table.remove(wrecks, i)
			else
				playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
				wreckX, wreckY = table.unpack(GetEntityCoords(wreck, true))
				
				if wreckX < playerX - 400 or wreckX > playerX + 400 or wreckY < playerY - 400 or wreckY > playerY + 400 then
					-- Set wreck as no longer needed for despawning
					Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(wreck))
					table.remove(wrecks, i)
				end
			end
		end
	end
end)

RegisterNetEvent("Z:cleanup")
AddEventHandler("Z:cleanup", function()
	for i, wreck in pairs(wrecks) do
		-- Set wreck as no longer needed for despawning
		Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(wreck))
		
		table.remove(wrecks, i)
	end
end)