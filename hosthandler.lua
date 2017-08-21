players = {}
host = nil
time = {h = 9, m = 0, s = 0}

RegisterServerEvent("Z:newplayer")
AddEventHandler("Z:newplayer", function(id)
	players[source] = id
	
	if not host then
		host = source
	end
end)

AddEventHandler("playerDropped", function(reason)
	players[source] = nil
	
	if source == host then
		if #players > 0 then
			for mSource, _ in pairs(players) do
				host = mSource
				break
			end
		else
			host = nil
		end
	end
end)

time = {hour = 8, minute = 0, second = 0} -- start time
date = {day = 1, month = 1, year = 2017} -- start date

RegisterServerEvent("tads:newplayer")
AddEventHandler("tads:newplayer", function()
	print("Syncing time and date for: "..GetPlayerName(source))
    TriggerClientEvent("tads:timeanddatesync", source, time, date)
end)

RegisterServerEvent("tads:timeanddatesync")
AddEventHandler("tads:timeanddatesync", function(newTime, newDate)
    time = newTime
    date = newDate
end)