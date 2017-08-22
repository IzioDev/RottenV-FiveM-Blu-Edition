isAdmin = false
players = {}

RegisterNetEvent("adminresponse")
RegisterNetEvent("Z:playerUpdate")
RegisterNetEvent("amiadmin")

AddEventHandler('adminresponse', function(response)

isAdmin = response

end)






Citizen.CreateThread(function()
	local currentItemIndex = 1
	local selectedItemIndex = 1
	
	WarMenu.CreateMenu('Interaction', 'Interaction Menu')
	WarMenu.CreateSubMenu('consumables', 'Interaction', 'Consumables')
	WarMenu.CreateSubMenu('admin', 'Interaction', 'Admin Menu')
	WarMenu.CreateSubMenu('kickplayers', 'admin', 'Kick Player')
	WarMenu.CreateSubMenu('spectateplayers', 'admin', 'Spectate Players')
	WarMenu.CreateSubMenu('kys', 'Interaction', "R.I.P.")
	TriggerServerEvent("amiadmin")
	
	while true do
		if WarMenu.IsMenuOpened('Interaction') then
			-- add stuff here if activated
			
			if WarMenu.Button('Drop Current Weapon') then
				TriggerServerEvent("dropPlayerWeapon", GetPlayerServerId(PlayerId()))
				-- Do your stuff here if current item was activated
			elseif WarMenu.MenuButton('Consumables', 'consumables') then
				
			elseif WarMenu.MenuButton('Commit Suicide', 'kys') then
			
			elseif isAdmin and WarMenu.MenuButton('Admin Menu', 'admin') then
			end
			
			
			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('kys') then
			if WarMenu.Button('Yes') then
				TriggerEvent("Z:killplayer")
				WarMenu.CloseMenu()
			elseif WarMenu.MenuButton('No', 'Interaction') then
			end
			WarMenu.Display()
			
		elseif WarMenu.IsMenuOpened('admin') then
			if not isAdmin then
				WarMenu.CloseMenu()
			elseif isAdmin then
				if WarMenu.MenuButton('Kick Player', 'kickplayers') then
				
				elseif WarMenu.MenuButton('Spectate Player', 'spectateplayers') then
				
				end
			end
		WarMenu.Display()
		elseif WarMenu.IsMenuOpened("kickplayers") then
		
		for i,thePlayer in ipairs(players) do
			if WarMenu.MenuButton("["..GetPlayerServerId( thePlayer ).."] "..GetPlayerName( thePlayer ), 'kickplayers') then
				TriggerServerEvent("kickPlayer", GetPlayerServerId( thePlayer ))
			end
		end
		WarMenu.Display()
		
		elseif WarMenu.IsMenuOpened("spectateplayers") then
		
		for i,thePlayer in ipairs(players) do
			if WarMenu.MenuButton("["..GetPlayerServerId( thePlayer ).."] "..GetPlayerName( thePlayer ), 'spectateplayers') then
				spectatePlayer(GetPlayerPed(thePlayer), GetPlayerName( thePlayer ))
			end
		end
		WarMenu.Display()
		
		
		
		elseif WarMenu.IsMenuOpened('consumables') then
			
			cindex=0
			for i,Consumable in ipairs(consumableItems) do			
				cindex=cindex+1
				if consumableItems.count[cindex] > 0.0 and WarMenu.Button(Consumable, tostring(math.round(consumableItems.count[cindex]))) then
					DecorSetFloat(GetPlayerPed(-1), "hunger", DecorGetFloat(GetPlayerPed(-1),"hunger")+consumableItems.replenish[cindex].hunger)
					DecorSetFloat(GetPlayerPed(-1), "thirst", DecorGetFloat(GetPlayerPed(-1),"thirst")+consumableItems.replenish[cindex].thirst)
						local newhealth = GetEntityHealth(GetPlayerPed(-1)) + consumableItems.replenish[cindex].health
						SetEntityHealth(GetPlayerPed(-1), newhealth)
						if GetEntityHealth(GetPlayerPed(-1)) > 200.0 then
							SetEntityHealth(GetPlayerPed(-1), 200.0)
						end
					consumableItems.count[cindex] = consumableItems.count[cindex]-1.0
				end
			end
			WarMenu.Display()
			
		elseif WarMenu.Button('Close') then
			WarMenu.CloseMenu()
		elseif IsControlJustReleased(0, 244) then --M by default
			WarMenu.OpenMenu('Interaction')
		end
		
		Citizen.Wait(0)
	end
end)



function GetPlayerList()
    players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive( i ) then
            table.insert( players, i )
        end
    end
	SetTimeout(5000, GetPlayerList)
end
GetPlayerList()


function spectatePlayer(target,name)
	local playerPed = GetPlayerPed(-1) -- yourself
	enable = true
	if target == playerPed then enable = false end

	if(enable)then
		if (not IsScreenFadedOut() and not IsScreenFadingOut()) then
			DoScreenFadeOut(1000)
			while (not IsScreenFadedOut()) do
				Wait(0)
			end

			local targetx,targety,targetz = table.unpack(GetEntityCoords(target, false))

			RequestCollisionAtCoord(targetx,targety,targetz)
			NetworkSetInSpectatorMode(true, target)

			if(IsScreenFadedOut()) then
				DoScreenFadeIn(1000)
			end
		end


		TriggerEvent("showNotification", "Spectating ~b~<C>"..name.."</C>.")
	else
		if(not IsScreenFadedOut() and not IsScreenFadingOut()) then
			DoScreenFadeOut(1000)
			while (not IsScreenFadedOut()) do
				Wait(0)
			end

			local targetx,targety,targetz = table.unpack(GetEntityCoords(target, false))

			RequestCollisionAtCoord(targetx,targety,targetz)
			NetworkSetInSpectatorMode(false, target)

			if(IsScreenFadedOut()) then
				DoScreenFadeIn(1000)
			end
		end

		TriggerEvent("showNotification", "Stopped Spectating ~b~<C>"..name.."</C>.")
	end
end

