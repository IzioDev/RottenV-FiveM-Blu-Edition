firstSpawn = true

Citizen.CreateThread( function()
	RegisterNetEvent('loadPlayerIn')
	AddEventHandler('loadPlayerIn', function(x,y,z,hunger,thirst,weapons) 
		Wait(500)
		local playerPed = GetPlayerPed(-1)
		Citizen.Trace("Recieving Stats...")
		SetEntityCoords(playerPed,x+.0,y+.0,z+.0,1,0,0,1)
		weaponTable = {}
		weaponTable.ammo = {}
		index = 0
		for _,value in ipairs(mysplit(weapons, "|")) do 
			index = index + 1
			weaponTable[index] = value
		--	Citizen.Trace("Got Gun:"..value)
		
		for _,value in ipairs(mysplit(value, ":")) do 
			if not tonumber(value) then
				weaponTable[index] = value
			else
				weaponTable.ammo[index] = value
			end
		end
		end
		index = 0
		for _,theWeapon in ipairs(weaponTable) do 
		index = index +1
		Citizen.Trace(weaponTable.ammo[index])
			GiveWeaponToPed(playerPed, GetHashKey(theWeapon), weaponTable.ammo[index], true, true)
		end
		DecorSetFloat(playerPed, "hunger", hunger)
		DecorSetFloat(playerPed, "thirst", thirst)
		GetPedWeapontypeInSlot(playerPed,1)
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
	
	
	
	function initiateSave()
		local playerPed = GetPlayerPed(-1)
        local posX,posY,posZ = table.unpack(GetEntityCoords(playerPed,true))
		local hunger = DecorGetFloat(GetPlayerPed(-1),"hunger")
		local thirst = DecorGetFloat(GetPlayerPed(-1),"thirst")
		-- weapons not yet implemented
		
		TriggerServerEvent("SavePlayerData",GetPlayerServerId(PlayerId()), posX,posY,posZ,hunger,thirst)
		
		Citizen.Trace("Saving PlayerData!")
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

