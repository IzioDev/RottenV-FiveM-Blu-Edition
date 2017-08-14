resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

server_scripts {
		"main.lua",
		"hosthandler.lua",
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
}

resource_type 'map' { gameTypes = { fivem = true } }

map 'map.lua'
