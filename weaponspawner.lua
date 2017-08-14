-- CONFIG --

-- A list of weapons that should be spawned
local spawnableWeapons =
{
	"pickup_weapon_Knife",
	"pickup_weapon_Nightstick",
	"pickup_weapon_Hammer",
	"pickup_weapon_Bat",
	"pickup_weapon_GolfClub",
	"pickup_weapon_Crowbar",
	"pickup_weapon_Bottle",
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
	"pickup_weapon_Hatchet",
	"pickup_weapon_KnuckleDuster",
	"pickup_weapon_Machete",
	"pickup_weapon_MachinePistol",
	"pickup_weapon_Flashlight",
	"pickup_weapon_SweeperShotgun",
	"pickup_weapon_BattleAxe",
	"pickup_weapon_MiniSMG",
	"pickup_weapon_PipeBomb",
	"pickup_weapon_PoolCue",
	"pickup_weapon_Wrench",
	"pickup_weapon_PistolMk2",
	"pickup_weapon_AssaultRifleMk2",
	"pickup_weapon_CarbineRifleMk2",
	"pickup_weapon_CombatMGMk2",
	"pickup_weapon_HeavySniperMk2",
	"pickup_weapon_SMGMk2"
}

-- CODE --

players = {}

RegisterNetEvent("Z:playerUpdate")
AddEventHandler("Z:playerUpdate", function(mPlayers)
	players = mPlayers
end)

weapons = {}
newz = 0.0

Citizen.CreateThread(function()
	while true do
		Wait(1)
		
		if #weapons < 5 then
			x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			
			repeat
				Wait(1)
				
				newX = x + math.random(-300, 300)
				newY = y + math.random(-300, 300)
				_,newZ = GetGroundZFor_3dCoord(newX+.0,newY+.0,z+999.0, 1)
				for player, _ in pairs(players) do
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
			
			choosenWeapon = spawnableWeapons[math.random(1, #spawnableWeapons)]
			choosenWeapon = string.upper(choosenWeapon)
			weapon = CreatePickupRotate(GetHashKey(choosenWeapon), newX, newY, newZ, 0.0, 0.0, 0.0, 8, 1.0, 24, 24, true, GetHashKey(choosenWeapon))
			SetEntityDynamic(weapon, true)
			SetEntityRecordsCollisions(weapon, true)
			SetEntityHasGravity(weapon, true)
			FreezeEntityPosition(weapon, false)
			SetEntityVelocity(weapon, 0.0, 0.0, -0.2)
			
			
			Citizen.Trace("Spawned weapon " .. choosenWeapon .. "\n")
			weaponInfo = {weapon = weapon, x = newX, y = newY, z = newZ}
			table.insert(weapons, weaponInfo)
		end
		
		for i, weaponInfo in pairs(weapons) do
			if not DoesPickupExist(weaponInfo.weapon) then
				table.remove(weapons, i)
			else
				playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
				weaponX = weaponInfo.x
				weaponY = weaponInfo.y
				
				if weaponX < playerX - 400 or weaponX > playerX + 400 or weaponY < playerY - 400 or weaponY > playerY + 400 then
					-- Set weapon as no longer needed for despawning
					Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(weaponInfo.weapon))
					table.remove(weapons, i)
				end
			end
		end
	end
end)
	


RegisterNetEvent("Z:cleanup")
AddEventHandler("Z:cleanup", function()
	for i, weapon in pairs(weapons) do
		-- Set weapon as no longer needed for despawning
		Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(weapon))
		
		table.remove(weapons, i)
	end
end)