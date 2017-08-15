players = {}

RegisterServerEvent("Z:newplayer")
AddEventHandler("Z:newplayer", function(id)
	players[source] = id
	TriggerClientEvent("Z:playerUpdate", -1, players)
end)

AddEventHandler("playerDropped", function(reason)
	players[source] = nil
	TriggerClientEvent("Z:cleanup", source)
	TriggerClientEvent("Z:playerUpdate", -1, players)
end)

AddEventHandler("chatMessage", function(p, color, msg)
	if msg:sub(1, 1) == "/" then
		fullcmd = stringsplit(msg, " ")
		cmd = fullcmd[1]
		
		if cmd == "/die" then
			TriggerClientEvent("Z:killplayer", p)
			CancelEvent()
		end
	end
end)

AddEventHandler("onResourceStop", function()
	TriggerClientEvent("Z:cleanup", -1)
end)

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end