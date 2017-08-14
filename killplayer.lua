RegisterNetEvent("Z:killplayer")

AddEventHandler("Z:killplayer", function()
	SetEntityHealth(GetPlayerPed(-1), 1)
end)