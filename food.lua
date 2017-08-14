Citizen.CreateThread(function()
while true do
		Citizen.Wait(0)
		DecorSetFloat(GetPlayerPed(-1), "hunger", DecorGetFloat(GetPlayerPed(-1),"hunger")-0.00001)
		DecorSetFloat(GetPlayerPed(-1), "thirst", DecorGetFloat(GetPlayerPed(-1),"thirst")-0.00003)
end
end)
