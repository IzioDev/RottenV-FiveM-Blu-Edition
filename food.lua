Citizen.CreateThread(function()
	defaultHungerLoss = 0.00001
	defaultThirstLoss = 0.00003
	SprintingHungerLoss = 0.00003
	SprintingThirstLoss = 0.00005
	while true do
		Citizen.Wait(0)
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