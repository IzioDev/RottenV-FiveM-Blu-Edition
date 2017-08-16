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

local function object_entry(data)
	dependency 'object-loader'

	files(data)
	object_file(data)
end

object_entry 'trees.xml'

resource_type 'map' { gameTypes = { fivem = true } }

map 'map.lua'
