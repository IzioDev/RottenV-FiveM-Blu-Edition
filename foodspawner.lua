-- CONFIG --

-- A list of weapons that should be spawned
-- CODE --

players = {}

RegisterNetEvent("Z:playerUpdate")
AddEventHandler("Z:playerUpdate", function(mPlayers)
	players = mPlayers
end)

spawnedItems = {}
itemLights = {}
NewItemZ = 0.0


Citizen.CreateThread(function()
	function ForceCreateFoodPickupAtCoord(x,y,z)
	
		local pickupItem = math.random(1, #consumableItems)
		local chance = math.random(0,100)
		if chance > 80 then
			pickupItemCount = math.random(1,3)+0.0
		else
			pickupItemCount = 1.0
		end
		local pickup = CreatePickupRotate(GetHashKey("PICKUP_PORTABLE_PACKAGE"), x, y, z, 0.0, 0.0, 0.0, 512, 1, 24, 24, true, GetHashKey("PICKUP_PORTABLE_PACKAGE"))
		Citizen.Trace(x)
		Citizen.Trace(y)
		Citizen.Trace(z)
		local itemInfo = {pickup = pickup, x = x, y = y, z = z, pickupItem = pickupItem, pickupItemCount = pickupItemCount}
		if itemInfo.pickup ~= 0 then
			table.insert(spawnedItems, itemInfo)
			Citizen.Trace(itemInfo.pickup.." Spawned by Ped Dying!")
		else
			RemovePickup(itemInfo.pickup)
			Citizen.Trace("Removed Faulty Pickup!")
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Wait(1)
		
		if #spawnedItems < 3 then
			x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			
			repeat
				Wait(1)
				
				repeat
					Wait(1)
					NewItemX = x + math.random(-250, 250)
					NewItemY = y + math.random(-250, 250)
					_,NewItemZ = GetGroundZFor_3dCoord(NewItemX+.0,NewItemY+.0,z+9999.0, 1)
				until NewItemZ ~= 0 and NewItemZ < z+20
				
				NewItemZ = NewItemZ+1
				for player, _ in pairs(players) do
					Wait(1)
					playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
					if NewItemX > playerX - 60 and NewItemX < playerX + 60 or NewItemY > playerY - 60 and NewItemY < playerY + 60 then
						canSpawn = false
						break
					else
						canSpawn = true
					end
				end
			until canSpawn
			
			local pickupItem = math.random(1, #consumableItems)
			local chance = math.random(0,100)
			if chance > 80 then
				pickupItemCount = math.random(1,3)+0.0
			else
				pickupItemCount = 1.0
			end
			
			
			pickup = CreatePickupRotate(GetHashKey("PICKUP_PORTABLE_PACKAGE"), NewItemX, NewItemY, NewItemZ, 0.0, 0.0, 0.0, 512, 1, 24, 24, true, GetHashKey("PICKUP_PORTABLE_PACKAGE"))
			local itemInfo = {pickup = pickup, x = NewItemX, y = NewItemY, z = NewItemZ, pickupItem = pickupItem, pickupItemCount = pickupItemCount}
			if itemInfo.pickup ~= 0 then
				table.insert(spawnedItems, itemInfo)
				Citizen.Trace(itemInfo.pickup.." Spawned!")
--				if not NetworkGetEntityIsNetworked(itemInfo.weapon) then
--					NetworkRegisterEntityAsNetworked(itemInfo.weapon)
--				end
			else
				RemovePickup(itemInfo.pickup)
				Citizen.Trace("Removed Faulty Pickup!")
			end
		end
		
		for i, itemInfo in pairs(spawnedItems) do
			playerX,playerY,playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			if not DoesPickupExist(itemInfo.pickup) or HasPickupBeenCollected(itemInfo.pickup) and DistanceBetweenCoords(playerX,playerY,playerZ,itemInfo.x,itemInfo.y,itemInfo.z) < 10.0 then
				
				Citizen.Trace("pickup: "..itemInfo.pickup.." with "..itemInfo.pickupItem.." count "..itemInfo.pickupItemCount)
				consumableItems.count[itemInfo.pickupItem] = consumableItems.count[itemInfo.pickupItem]+itemInfo.pickupItemCount
				if itemInfo.pickupItemCount > 1 then
					TriggerEvent('showNotification', "You Found: ~g~"..math.round(itemInfo.pickupItemCount).." "..consumableItems[itemInfo.pickupItem].."s" )
				else
					TriggerEvent('showNotification', "You Found: ~g~"..math.round(itemInfo.pickupItemCount).." "..consumableItems[itemInfo.pickupItem] )
				end
				table.remove(spawnedItems, i)
				break
			end
			local	playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			local 	itemX = itemInfo.x
			local 	itemY = itemInfo.y
			
			if itemX < playerX - 400 or itemX > playerX + 400 or itemY < playerY - 400 or itemY > playerY + 400 then
				-- Set weapon as no longer needed for despawning
				--Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(itemInfo.weapon))
				Citizen.Trace(itemInfo.pickup.." Deleted!")
				--	SetEntityAsNoLongerNeeded(itemInfo.pickup)
				RemovePickup(itemInfo.pickup)
				table.remove(spawnedItems, i)
			end
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for i, itemInfo in pairs(spawnedItems) do
			local itemX,itemY,itemZ = table.unpack(GetPickupCoords(itemInfo.pickup))
			playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			--		DrawLine(playerX,playerY, playerZ, itemInfo.x, itemInfo.y, itemInfo.z, 0.0,255.0,0.0,255)
			DrawLightWithRange(itemX,itemY,itemZ+0.1, 1.0, 1.0, 1.0, 1.7, 0.001)
		end
	end
end) 


RegisterNetEvent("Z:cleanup")
AddEventHandler("Z:cleanup", function()
	for i, itemInfo in pairs(spawnedItems) do
		-- Set weapon as no longer needed for despawning
		if DoesPickupExist(itemInfo.pickup) and DoesEntityExist(itemInfo.pickup) then	
			--	SetEntityAsNoLongerNeeded(itemInfo.weapon)
			RemovePickup(itemInfo.pickup)
		end
		table.remove(spawnedItems, i)
	end
end)