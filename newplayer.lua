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
		

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if not displayRadar then
			DisplayRadar(false)
		end
	end
end)