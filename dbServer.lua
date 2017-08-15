RegisterServerEvent('spawnPlayer')
Citizen.CreateThread(function()
		AddEventHandler('spawnPlayer', function(client)
		print("Client Requested Spawn!")
			MySQL.Async.fetchAll('SELECT * FROM players where steamid="'..GetPlayerIdentifier(client,0)..'"', {}, function(player) 
				print(player[1].steamid)
				if player[1].steamid == GetPlayerIdentifier(client,0) then
					TriggerClientEvent("loadPlayerIn", client, player[1].x, player[1].y, player[1].z, player[1].hunger, player[1].thirst, player[1].weapons)
					print("Sent!")
				end
			end)
	end)
	
		AddEventHandler("onPlayerWasted", function(client)
		
		end)
end)


