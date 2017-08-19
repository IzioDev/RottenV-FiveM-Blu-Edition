RegisterServerEvent("dropPlayerWeapon")

AddEventHandler("dropPlayerWeapon", function(p)
	TriggerClientEvent("dropweapon", p)	
end)