RegisterNetEvent("dropweapon")
AddEventHandler('dropweapon', function()
	local ped = GetPlayerPed(-1)
	if DoesEntityExist(ped) and not IsEntityDead(ped) then
		weapon = GetSelectedPedWeapon(ped) 
		ammo = GetAmmoInPedWeapon(playerPed, GetHashKey(theWeapon))
		ammo = ammo-30
		SetPedDropsInventoryWeapon(ped,weapon, 0.4, 3.7, 0.0, ammo )
	end
end)