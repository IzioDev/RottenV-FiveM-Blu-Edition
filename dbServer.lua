RegisterServerEvent('spawnPlayer')
RegisterServerEvent('SavePlayerData')
Citizen.CreateThread(function()
		AddEventHandler('spawnPlayer', function(client)
		print("Client Requested Spawn!")
			MySQL.Async.fetchAll('SELECT * FROM players where steamid="'..GetPlayerIdentifier(client,0)..'"', {}, function(player) 
				if player[1] then
					if player[1].steamid == GetPlayerIdentifier(client,0) then
						TriggerClientEvent("loadPlayerIn", client, player[1].x, player[1].y, player[1].z, player[1].hunger, player[1].thirst, player[1].weapons)
						print("Sent!")
					end
				else
					MySQL.Async.execute('INSERT INTO players (steamid, x, y, z, hunger, thirst) VALUES("'..GetPlayerIdentifier(client,0)..'", 0.0, 0.0, 77.0, 100.0, 100.0)', {}, function() end)
				end
			end)
	end)
	
		AddEventHandler("SavePlayerData", function(client,posX,posY,posZ,hunger,thirst,weapons)
		MySQL.Async.execute('UPDATE players SET x="'..posX..'", y="'..posY..'", z="'..posZ..'", hunger="'..hunger..'", thirst="'..thirst..'" WHERE steamid="'..GetPlayerIdentifier(client,0)..'"', {}, function() end)
		end)
end)


