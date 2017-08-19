-- CONFIG --

local spawnWithFlashlight = true
local displayRadar = true
local bool = true


-- CODE --

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if bool then
			TriggerServerEvent("Z:newplayer", PlayerId())
			TriggerServerEvent("Z:newplayerID", GetPlayerServerId(PlayerId()))
			bool = false
		end
	end
end)

local welcomed = false
DecorRegister("hunger",1)
DecorRegister("thirst",1)

AddEventHandler("playerSpawned", function(spawn)
	if spawnWithFlashlight then
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1, false, false)
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BAT"), 1, false, false)
		GiveWeaponToPed(GetPlayerPed(-1), 0xFBAB5776, true)
		DecorSetFloat(GetPlayerPed(-1), "hunger", 100.0)
		DecorSetFloat(GetPlayerPed(-1), "thirst", 100.0)
		DecorSetFloat(GetPlayerPed(-1), "Apple", 1.0)
		consumableItems.count[1] = 1.0
		spawnindex=0
		for i,Consumable in ipairs(consumableItems) do			
			spawnindex=spawnindex+1
			consumableItems.count[spawnindex] = 99.0
			DecorSetFloat(GetPlayerPed(-1), Consumable, 99.0)
		end
		SetPedDropsWeaponsWhenDead(GetPlayerPed(-1),true)
	    NetworkSetFriendlyFireOption(true)
		SetCanAttackFriendly(GetPlayerPed(-1), true, true)
		Wait(1000)
		initiateSave()
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetEntityHeightAboveGround(GetPlayerPed(-1)) < 50 and IsPedInParachuteFreeFall(GetPlayerPed(-1)) then
			ForcePedToOpenParachute(GetPlayerPed(-1))
		end
	end
end)
