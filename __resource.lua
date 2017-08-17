resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

server_scripts {
		"@mysql-async/lib/MySQL.lua",
		"main.lua",
		"hosthandler.lua",
		"dbServer.lua",
} 

client_scripts {
		"newplayer.lua",
		"nopeds.lua",
		"zombiespawner.lua",
		--"wreckspawner.lua",
		"weaponspawner.lua",
		"carspawner.lua",
		"environment.lua",
		"killplayer.lua",
		"drawtext.lua",
		"host.lua",
		"food.lua",
		"banditspawner.lua",
		"dbClient.lua",
		
}

resource_type 'map' { gameTypes = { fivem = true } }

map 'map.lua'
