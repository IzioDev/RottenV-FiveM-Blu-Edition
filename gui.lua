Citizen.CreateThread(function()
	local currentItemIndex = 1
	local selectedItemIndex = 1
	
	WarMenu.CreateMenu('Interaction', 'Interaction Menu')
	WarMenu.CreateSubMenu('consumables', 'Interaction', 'Consumables')
	WarMenu.CreateSubMenu('kys', 'Interaction', "R.I.P.")
	
	while true do
		if WarMenu.IsMenuOpened('Interaction') then
			-- add stuff here if activated
			
			if WarMenu.Button('Drop Current Weapon') then
				TriggerServerEvent("dropPlayerWeapon", GetPlayerServerId(PlayerId()))
				-- Do your stuff here if current item was activated
			elseif WarMenu.MenuButton('Consumables', 'consumables') then
				
			elseif WarMenu.MenuButton('Commit Suicide', 'kys') then
			end
			
			
			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('kys') then
			if WarMenu.Button('Yes') then
				TriggerEvent("Z:killplayer")
				WarMenu.CloseMenu()
			elseif WarMenu.MenuButton('No', 'Interaction') then
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