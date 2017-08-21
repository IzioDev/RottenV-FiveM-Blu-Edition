Citizen.CreateThread(function()
	defaultHungerLoss = 0.0003
	defaultThirstLoss = 0.0005
	SprintingHungerLoss = 0.0005
	SprintingThirstLoss = 0.0007
	drivingHungerLoss = 0.0002
	drivingThirstLoss = 0.0003
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
		elseif IsPedInVehicle(GetPlayerPed(-1) then
			DecorSetFloat(GetPlayerPed(-1), "hunger", DecorGetFloat(GetPlayerPed(-1),"hunger")-drivingHungerLoss)
			DecorSetFloat(GetPlayerPed(-1), "thirst", DecorGetFloat(GetPlayerPed(-1),"thirst")-drivingThirstLoss)
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
	"Chips Pack",
	"Beef",
	"Beefium",
	"Bandage",
	"Orange Juice Pack",
	"Pizza",
	"Fried Chicken",
	"Small Medkit",
	"Water Bottle",
}
consumableItems.count = {}
for i,Consumable in ipairs(consumableItems) do		
	consumableItems.count[i] = 0.0
end

consumableItems.replenish = {
	{hunger = 15.0,thirst = 3.0,health = 5,"The healthy snack for Everyone!"},
	{hunger = 3.0,thirst = 30.0,health = 5,"Famous Cocaine-Containing Drink"},
	{hunger = 10.0,thirst = 40.0,health = 5,"Galactic."},
	{hunger = 15.0,thirst = -10.0,health = 4,"Quick to eat, doesn't taste like much, fills the stomach tho."},
	{hunger = 40.0,thirst = -25.0,health = 6,"Yummie"},
	{hunger = 60.0,thirst = -10.0,health = 6,"Due to extensive research scientists have discovered a new form of beef called Beefium, better than ever, and tastier too!"},
	{hunger = 0.0,thirst = 0.0,health = 20,"Please do not apply on broken hearts."},
	{hunger = 3.0,thirst = 10.0,health = 5,"Tasty AND Healthy!"},
	{hunger = 50.0,thirst = 30.0,health = 5,"Fat.. but so delicious."},
	{hunger = 15.0,thirst = -15.0,health = 5,"Deep Fried is best fried."},
	{hunger = 0.0,thirst = 0.0,health = 50,"Mandatory in every Motorised Vehicle by Law, also useful if you are about to die."},
	{hunger = 0.0,thirst = 50.0,health = 5,"Fresh, clean water, delicious."},
}


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