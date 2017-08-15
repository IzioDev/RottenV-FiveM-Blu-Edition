
Citizen.CreateThread(function()
RegisterServerEvent('spawnPlayer')
		AddEventHandler('spawnPlayer', function(player)
			MySQL.Sync.fetchScalar('SELECT * FROM players where steamid="'..GetPlayerIdentifier(source,0)..'"', {}, function(player) 
				if player[1].steamid == GetPlayerIdentifier(source,0) then
					TriggerClientEvent("loadPlayerIn", source, player[1].x, player[1].y, player[1].z, player[1].weapons)
					print("Client Requested Spawn!")
					print("Sent!")
				end
			end)
	end)
end)


