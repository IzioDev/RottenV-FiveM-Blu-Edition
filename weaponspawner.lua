-- CONFIG --

-- A list of weapons that should be spawned
local spawnableWeapons =
{
	"pickup_weapon_Nightstick",
	"pickup_weapon_Hammer",
	"pickup_weapon_Bat",
	"pickup_weapon_GolfClub",
	"pickup_weapon_Crowbar",
	"pickup_weapon_SwitchBlade",
	"pickup_weapon_Pistol",
	"pickup_weapon_CombatPistol",
	"pickup_weapon_APPistol",
	"pickup_weapon_Pistol50",
	"pickup_weapon_FlareGun",
	"pickup_weapon_MarksmanPistol",
	"pickup_weapon_Revolver",
	"pickup_weapon_MicroSMG",
	"pickup_weapon_SMG",
	"pickup_weapon_AssaultSMG",
	"pickup_weapon_CombatPDW",
	"pickup_weapon_AssaultRifle",
	"pickup_weapon_CarbineRifle",
	"pickup_weapon_AdvancedRifle",
	"pickup_weapon_CompactRifle",
	"pickup_weapon_MG",
	"pickup_weapon_CombatMG",
	"pickup_weapon_PumpShotgun",
	"pickup_weapon_SawnOffShotgun",
	"pickup_weapon_AssaultShotgun",
	"pickup_weapon_BullpupShotgun",
	"pickup_weapon_DoubleBarrelShotgun",
	"pickup_weapon_StunGun",
	"pickup_weapon_SniperRifle",
	"pickup_weapon_HeavySniper",
	"pickup_weapon_Grenade",
	"pickup_weapon_StickyBomb",
	"pickup_weapon_SmokeGrenade",
	"pickup_weapon_Molotov",
	"pickup_weapon_FireExtinguisher",
	"pickup_weapon_PetrolCan",
	"pickup_weapon_SNSPistol",
	"pickup_weapon_SpecialCarbine",
	"pickup_weapon_HeavyPistol",
	"pickup_weapon_BullpupRifle",
	"pickup_weapon_VintagePistol",
	"pickup_weapon_Dagger",
	"pickup_weapon_Musket",
	"pickup_weapon_MarksmanRifle",
	"pickup_weapon_HeavyShotgun",
	"pickup_weapon_Gusenberg",
	"pickup_weapon_Machete",
	"pickup_weapon_MachinePistol",
	"pickup_weapon_SweeperShotgun",
	"pickup_weapon_BattleAxe",
	"pickup_weapon_MiniSMG",
	"pickup_weapon_PipeBomb",
	"pickup_weapon_PoolCue",
	"pickup_weapon_Wrench",
	"pickup_weapon_Pistol_Mk2",
	"pickup_weapon_AssaultRifle_Mk2",
	"pickup_weapon_CarbineRifle_Mk2",
	"pickup_weapon_CombatMG_Mk2",
	"pickup_weapon_HeavySniper_Mk2",
	"pickup_weapon_SMG_Mk2",
	"PICKUP_HEALTH_STANDARD"
}

-- CODE --

players = {}

RegisterNetEvent("Z:playerUpdate")
AddEventHandler("Z:playerUpdate", function(mPlayers)
	players = mPlayers
end)

weapons = {}
weaponLights = {}
NewWeaponZ = 0.0

Citizen.CreateThread(function()
	while true do
		Wait(1)
		
		if #weapons < 7 then
			x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			
			repeat
				Wait(1)
				
				repeat
					Wait(1)
					NewWeaponX = x + math.random(-250, 250)
					NewWeaponY = y + math.random(-250, 250)
					_,NewWeaponZ = GetGroundZFor_3dCoord(NewWeaponX+.0,NewWeaponY+.0,z+9999.0, 1)
				until NewWeaponZ ~= 0 and NewWeaponZ < z+20
				
				NewWeaponZ = NewWeaponZ+1
				for player, _ in pairs(players) do
					Wait(1)
					playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
					if NewWeaponX > playerX - 60 and NewWeaponX < playerX + 60 or NewWeaponY > playerY - 60 and NewWeaponY < playerY + 60 then
						canSpawn = false
						break
					else
						canSpawn = true
					end
				end
			until canSpawn
			
			choosenWeapon = spawnableWeapons[math.random(1, #spawnableWeapons)]
			choosenWeapon = string.upper(choosenWeapon)
			local chance = math.random(100,1000)
			local chance = chance/100
			weapon = CreatePickupRotate(GetHashKey(choosenWeapon), NewWeaponX, NewWeaponY, NewWeaponZ, 0.0, 0.0, 0.0, 512, chance, 24, 24, true, GetHashKey(choosenWeapon))
			local weaponInfo = {weapon = weapon, x = NewWeaponX, y = NewWeaponY, z = NewWeaponZ}
			if weaponInfo.weapon ~= 0 then
				table.insert(weapons, weaponInfo)
				Citizen.Trace(weaponInfo.weapon.." Spawned!")
--				if not NetworkGetEntityIsNetworked(weaponInfo.weapon) then
--					NetworkRegisterEntityAsNetworked(weaponInfo.weapon)
--				end
			else
				RemovePickup(weaponInfo.weapon)
				Citizen.Trace("Removed Faulty Pickup!")
			end
		end
		
		for i, weaponInfo in pairs(weapons) do
			if not DoesPickupExist(weaponInfo.weapon) or HasPickupBeenCollected(weaponInfo.weapon) then
				table.remove(weapons, i)
				break
			end
			local	playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			local 	weaponX = weaponInfo.x
			local 	weaponY = weaponInfo.y
			
			if weaponX < playerX - 400 or weaponX > playerX + 400 or weaponY < playerY - 400 or weaponY > playerY + 400 then
				-- Set weapon as no longer needed for despawning
				--Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(weaponInfo.weapon))
				Citizen.Trace(weaponInfo.weapon.." Deleted!")
				--	SetEntityAsNoLongerNeeded(weaponInfo.weapon)
				RemovePickup(weaponInfo.weapon)
				table.remove(weapons, i)
			end
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for i, weaponInfo in pairs(weapons) do
			local weaponX,weaponY,weaponZ = table.unpack(GetPickupCoords(weaponInfo.weapon))
			playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			--		DrawLine(playerX,playerY, playerZ, weaponInfo.x, weaponInfo.y, weaponInfo.z, 0.0,255.0,0.0,255)
			DrawLightWithRange(weaponX,weaponY,weaponZ+0.1, 1.0, 1.0, 1.0, 1.7, 0.001)
		end
	end
end) 


RegisterNetEvent("Z:cleanup")
AddEventHandler("Z:cleanup", function()
	for i, weaponInfo in pairs(weapons) do
		-- Set weapon as no longer needed for despawning
		if DoesPickupExist(weaponInfo.weapon) and DoesEntityExist(weaponInfo.weapon) then	
			--	SetEntityAsNoLongerNeeded(weaponInfo.weapon)
			RemovePickup(weaponInfo.weapon)
		end
		table.remove(weapons, i)
	end
end)