firstSpawn = true

local weapons =
{
	"weapon_Knife",
	"weapon_Nightstick",
	"weapon_Hammer",
	"weapon_Bat",
	"weapon_GolfClub",
	"weapon_Crowbar",
	"weapon_Bottle",
	"weapon_SwitchBlade",
	"weapon_Pistol",
	"weapon_CombatPistol",
	"weapon_APPistol",
	"weapon_Pistol50",
	"weapon_FlareGun",
	"weapon_MarksmanPistol",
	"weapon_Revolver",
	"weapon_MicroSMG",
	"weapon_SMG",
	"weapon_AssaultSMG",
	"weapon_CombatPDW",
	"weapon_AssaultRifle",
	"weapon_CarbineRifle",
	"weapon_AdvancedRifle",
	"weapon_CompactRifle",
	"weapon_MG",
	"weapon_CombatMG",
	"weapon_PumpShotgun",
	"weapon_SawnOffShotgun",
	"weapon_AssaultShotgun",
	"weapon_BullpupShotgun",
	"weapon_DoubleBarrelShotgun",
	"weapon_StunGun",
	"weapon_SniperRifle",
	"weapon_HeavySniper",
	"weapon_Grenade",
	"weapon_StickyBomb",
	"weapon_SmokeGrenade",
	"weapon_Molotov",
	"weapon_FireExtinguisher",
	"weapon_PetrolCan",
	"weapon_SNSPistol",
	"weapon_SpecialCarbine",
	"weapon_HeavyPistol",
	"weapon_BullpupRifle",
	"weapon_VintagePistol",
	"weapon_Dagger",
	"weapon_Musket",
	"weapon_MarksmanRifle",
	"weapon_HeavyShotgun",
	"weapon_Gusenberg",
	"weapon_Hatchet",
	"weapon_KnuckleDuster",
	"weapon_Machete",
	"weapon_MachinePistol",
	"weapon_Flashlight",
	"weapon_SweeperShotgun",
	"weapon_BattleAxe",
	"weapon_MiniSMG",
	"weapon_PipeBomb",
	"weapon_PoolCue",
	"weapon_Wrench",
	"weapon_Pistol_Mk2",
	"weapon_AssaultRifle_Mk2",
	"weapon_CarbineRifle_Mk2",
	"weapon_CombatMG_Mk2",
	"weapon_HeavySniper_Mk2",
	"weapon_SMG_Mk2",
}

Citizen.CreateThread( function()
	RegisterNetEvent('loadPlayerIn')
	AddEventHandler('loadPlayerIn', function(x,y,z,hunger,thirst,weapons,inventory,health) 
		Wait(500)
		local playerPed = GetPlayerPed(-1)
		Citizen.Trace("Recieving Stats...")
		SetEntityCoords(playerPed,x+.0,y+.0,z+.0,1,0,0,1)
		weaponTable = {}
		weaponTable.ammo = {}
		itemTable = {}
		itemTable.count = {}
		index = 0
		for _,value in ipairs(mysplit(weapons, "|")) do 
			index = index + 1
			
			for _,value in ipairs(mysplit(value, ":")) do 
				if not tonumber(value) then
					weaponTable[index] = value
				else
					value = tonumber(value)
					weaponTable.ammo[index] = value
				end
			end
		end
		
		
		index = 0
		for _,value in ipairs(mysplit(inventory, "|")) do 
			index = index + 1
			
			for _,value in ipairs(mysplit(value, ":")) do 
				if not tonumber(value) then
					itemTable[index] = value
				else
					value = tonumber(value+.0)
					consumableItems.count[index] = value
				end
			end
		end
		
		
		index = 0
		for _,theWeapon in ipairs(weaponTable) do 
			index = index +1
			GiveWeaponToPed(playerPed, GetHashKey(theWeapon), weaponTable.ammo[index], true, true)
		end
		
		DecorSetFloat(playerPed, "hunger", hunger)
		DecorSetFloat(playerPed, "thirst", thirst)
		SetEntityHealth(GetPlayerPed(-1), health)
		Citizen.Trace("Done!")
	end)
	
	AddEventHandler("playerSpawned", function()
		if firstSpawn then
			TriggerServerEvent("spawnPlayer", GetPlayerServerId(PlayerId()))
			Citizen.Trace("Requesting Spawn!")
			Citizen.Trace("Sent!")
			firstSpawn = false
		end
	end)
	
	
	
	
	
	
	function initiateSave(allowTimer)
		local playerPed = GetPlayerPed(-1)
		local posX,posY,posZ = table.unpack(GetEntityCoords(playerPed,true))
		local hunger = DecorGetFloat(GetPlayerPed(-1),"hunger")
		local thirst = DecorGetFloat(GetPlayerPed(-1),"thirst")
		local PedWeapons = ""
		for _,theWeapon in ipairs(weapons) do
			if HasPedGotWeapon(playerPed,GetHashKey(theWeapon),false) == 1 then
				local ammo = GetAmmoInPedWeapon(playerPed, GetHashKey(theWeapon))
				if string.len(PedWeapons) > 1 then
					PedWeapons = PedWeapons.."|"..theWeapon..":"..ammo
				else
					PedWeapons = PedWeapons..""..theWeapon..":"..ammo
				end
			end
		end
		
		local PedItems = ""
		index = 0
		for i,theItem in ipairs(consumableItems) do
			index = index+1
			count = consumableItems.count[index]
			
			
			if string.len(PedItems) > 1 then
				PedItems = PedItems.."|"..theItem..":"..count
			else
				PedItems = PedItems..""..theItem..":"..count
			end
		end
		
		TriggerServerEvent("SavePlayerData",GetPlayerServerId(PlayerId()), posX,posY,posZ,hunger,thirst,PedWeapons,PedItems,GetEntityHealth(GetPlayerPed(-1)))
		
		Citizen.Trace("Saving PlayerData!")
		if not allowTimer then
			SetTimeout(180000, initiateSave)
		end
	end
	SetTimeout(180000, initiateSave)
	
	
	function mysplit(inputstr, sep)
		if sep == nil then
			sep = "%s"
		end
		local t={} ; i=1
		for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			t[i] = str
			i = i + 1
		end
		return t
	end
end)