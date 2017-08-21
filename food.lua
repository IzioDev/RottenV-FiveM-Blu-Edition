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
		elseif IsPedInVehicle(GetPlayerPed(-1)) then
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
	{hunger = 15.0,thirst = 3.0,health = 5,desc = "The healthy snack for Everyone!"},
	{hunger = 3.0,thirst = 30.0,health = 5,desc = "Famous Cocaine-Containing Drink"},
	{hunger = 10.0,thirst = 40.0,health = 5,desc = "Galactic."},
	{hunger = 15.0,thirst = -10.0,health = 4,desc = "Quick to eat, doesn't taste like much, fills the stomach tho."},
	{hunger = 40.0,thirst = -25.0,health = 6,desc = "Yummie"},
	{hunger = 60.0,thirst = -10.0,health = 6,desc = "Due to extensive research scientists have discovered a new form of beef called Beefium, better than ever, and tastier too!"},
	{hunger = 0.0,thirst = 0.0,health = 20,desc = "Please do not apply on broken hearts."},
	{hunger = 3.0,thirst = 10.0,health = 5,desc = "Tasty AND Healthy!"},
	{hunger = 50.0,thirst = 30.0,health = 5,desc = "Fat.. but so delicious."},
	{hunger = 15.0,thirst = -15.0,health = 5,desc = "Deep Fried is best fried."},
	{hunger = 0.0,thirst = 0.0,health = 50,desc = "Mandatory in every Motorised Vehicle by Law, also useful if you are about to die."},
	{hunger = 0.0,thirst = 50.0,health = 5,desc = "Fresh, clean water, delicious."},
}
