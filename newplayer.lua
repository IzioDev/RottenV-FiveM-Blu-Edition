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

AddEventHandler("playerSpawned", function(spawn)
	if spawnWithFlashlight then
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1, false, false)
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