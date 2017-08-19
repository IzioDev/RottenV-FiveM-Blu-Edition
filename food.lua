Citizen.CreateThread(function()
	defaultHungerLoss = 0.0001
	defaultThirstLoss = 0.0003
	SprintingHungerLoss = 0.0003
	SprintingThirstLoss = 0.0005
	Saturation = 0
	while true do
		Citizen.Wait(0)
		if DecorGetFloat(GetPlayerPed(-1),"hunger") > 100.0 then
			DecorSetFloat(GetPlayerPed(-1), "hunger", 100.0)
		end
		if DecorGetFloat(GetPlayerPed(-1),"thirst") > 100.0 then
			DecorSetFloat(GetPlayerPed(-1), "thirst", 100.0)
		end
		if IsPedSprinting(GetPlayerPed(-1)) then
			DecorSetFloat(GetPlayerPed(-1), "hunger", DecorGetFloat(GetPlayerPed(-1),"hunger")-SprintingHungerLoss)
			DecorSetFloat(GetPlayerPed(-1), "thirst", DecorGetFloat(GetPlayerPed(-1),"thirst")-SprintingThirstLoss)
		else
			DecorSetFloat(GetPlayerPed(-1), "hunger", DecorGetFloat(GetPlayerPed(-1),"hunger")-defaultHungerLoss)
			DecorSetFloat(GetPlayerPed(-1), "thirst", DecorGetFloat(GetPlayerPed(-1),"thirst")-defaultThirstLoss)
		end
	end
end
)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		if DecorGetFloat(GetPlayerPed(-1),"hunger") < 10.0 and DecorGetFloat(GetPlayerPed(-1),"hunger") > 2.0 or DecorGetFloat(GetPlayerPed(-1),"thirst") < 10.0 and DecorGetFloat(GetPlayerPed(-1),"thirst") > 2.0 then
			SetEntityHealth(GetEntityHealth(GetPlayerPed(-1))-5)
		elseif DecorGetFloat(GetPlayerPed(-1),"hunger") < 1.0 or DecorGetFloat(GetPlayerPed(-1),"thirst") < 1.0 then
			SetEntityHealth(GetPlayerPed(-1), 1)
		end
	end
end)

consumableItems = {
	"Apple",
	"Cola",
	"Milk",
	"Chips",
	"Beef"
}
consumableItems.count = {}

consumableItems.replenish = {
	{hunger = 15.0,thirst = 3.0,health = 20.0},
	{hunger = 3.0,thirst = 30.0,health = 10.0},
	{hunger = 10.0,thirst = 40.0,health = 15.0},
	{hunger = 15.0,thirst = -10.0,health = 4.0},
	{hunger = 60.0,thirst = -25.0,health = 6.0}
}


Tableindex = 0
for i,Consumable in ipairs(consumableItems) do		
	Tableindex = Tableindex+1
	consumableItems.count[Tableindex] = 0.0
end

Tableindex = 0
for _,theItem in ipairs(consumableItems) do 
	Tableindex = Tableindex +1
	DecorRegister(playerPed, theItem, 1)
end

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
					--			if GetEntityHealth(GetPlayerPed(-1)) + consumableItems.replenish[cindex].health >= 200.0 then
					--				SetEntityHealth(GetPlayerPed(-1), 200.0)
					--			elseif GetEntityHealth(GetPlayerPed(-1)) + consumableItems.replenish[cindex].health < 200.0 then
					--				SetEntityHealth(GetPlayerPed(-1), GetEntityHealth(GetPlayerPed(-1))+ consumableItems.replenish[cindex].health)
					--			end
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