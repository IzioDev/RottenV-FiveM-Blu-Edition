-- CONFIG --

-- A list of vehicles that should be spawned
local spawnableCars =
{
	"Adder",
	"Airbus",
	"Airtug",
	"Akuma",
	"Alpha",
	"Ambulance",
	"Annihilator",
	"Apc",
	"Ardent",
	"Asea",
	"Asea2",
	"Asterope",
	"Avarus",
	"Bagger",
	"Baller",
	"Baller2",
	"Baller3",
	"Baller4",
	"Baller5",
	"Baller6",
	"Banshee",
	"Banshee2",
	"Barracks",
	"Barracks2",
	"Barracks3",
	"Bati",
	"Bati2",
	"Benson",
	"Besra",
	"BestiaGTS",
	"BF400",
	"BfInjection",
	"Biff",
	"Bifta",
	"Bison",
	"Bison2",
	"Bison3",
	"BJXL",
	"Blade",
	"Blazer",
	"Blazer2",
	"Blazer3",
	"Blazer4",
	"Blazer5",
	"Blista",
	"Blista2",
	"Blista3",
	"Bmx",
	"BobcatXL",
	"Bodhi2",
	"Boxville",
	"Boxville2",
	"Boxville3",
	"Boxville4",
	"Boxville5",
	"Brawler",
	"Brickade",
	"Brioso",
	"BType",
	"BType2",
	"BType3",
	"Buccaneer",
	"Buccaneer2",
	"Buffalo",
	"Buffalo2",
	"Buffalo3",
	"Bulldozer",
	"Bullet",
	"Burrito",
	"Burrito2",
	"Burrito3",
	"Burrito4",
	"Burrito5",
	"Bus",
	"Buzzard",
	"Buzzard2",
	"Caddy",
	"Caddy2",
	"Caddy3",
	"Camper",
	"Carbonizzare",
	"CarbonRS",
	"Cargobob",
	"Cargobob2",
	"Cargobob3",
	"Cargobob4",
	"Casco",
	"Cavalcade",
	"Cavalcade2",
	"Cheetah",
	"Cheetah2",
	"Chimera",
	"Chino",
	"Chino2",
	"Cliffhanger",
	"Coach",
	"Cog55",
	"Cog552",
	"CogCabrio",
	"Cognoscenti",
	"Cognoscenti2",
	"Comet2",
	"Comet3",
	"Contender",
	"Coquette",
	"Coquette2",
	"Coquette3",
	"Cruiser",
	"Crusader",
	"Cuban800",
	"Cutter",
	"Daemon",
	"Daemon2",
	"Defiler",
	"Diablous",
	"Diablous2",
	"Dilettante",
	"Dilettante2",
	"Dinghy",
	"Dinghy2",
	"Dinghy3",
	"Dinghy4",
	"DLoader",
	"Docktug",
	"Dodo",
	"Dominator",
	"Dominator2",
	"Double",
	"Dubsta",
	"Dubsta2",
	"Dubsta3",
	"Dukes",
	"Dukes2",
	"Dune",
	"Dune2",
	"Dune3",
	"Dune4",
	"Dune5",
	"Duster",
	"Elegy",
	"Elegy2",
	"Emperor",
	"Emperor2",
	"Emperor3",
	"Enduro",
	"EntityXF",
	"Esskey",
	"Exemplar",
	"F620",
	"Faction",
	"Faction2",
	"Faction3",
	"Faggio",
	"Faggio2",
	"Faggio3",
	"FBI",
	"FBI2",
	"FCR",
	"FCR2",
	"Felon",
	"Felon2",
	"Feltzer2",
	"Feltzer3",
	"FireTruk",
	"Fixter",
	"Flatbed",
	"Forklift",
	"FMJ",
	"FQ2",
	"Frogger",
	"Frogger2",
	"Fugitive",
	"Furoregt",
	"Fusilade",
	"Futo",
	"Gargoyle",
	"Gauntlet",
	"Gauntlet2",
	"GBurrito",
	"GBurrito2",
	"Glendale",
	"GP1",
	"Granger",
	"Gresley",
	"Guardian",
	"Habanero",
	"Hakuchou",
	"Hakuchou2",
	"HalfTrack",
	"Handler",
	"Hauler",
	"Hauler2",
	"Hexer",
	"Hotknife",
	"Huntley",
	"Hydra",
	"Infernus",
	"Infernus2",
	"Ingot",
	"Innovation",
	"Insurgent",
	"Insurgent2",
	"Insurgent3",
	"Intruder",
	"Issi2",
	"ItaliGTB",
	"ItaliGTB2",
	"Jackal",
	"JB700",
	"Jester",
	"Jester2",
	"Jetmax",
	"Journey",
	"Kalahari",
	"Khamelion",
	"Kuruma",
	"Kuruma2",
	"Landstalker",
	"Lazer",
	"LE7B",
	"Lectro",
	"Lguard",
	"Limo2",
	"Lurcher",
	"Luxor",
	"Luxor2",
	"Lynx",
	"Mamba",
	"Mammatus",
	"Manana",
	"Manchez",
	"Marquis",
	"Marshall",
	"Massacro",
	"Massacro2",
	"Maverick",
	"Mesa",
	"Mesa2",
	"Mesa3",
	"Minivan",
	"Minivan2",
	"Mixer",
	"Mixer2",
	"Monroe",
	"Monster",
	"Moonbeam",
	"Moonbeam2",
	"Mower",
	"Mule",
	"Mule2",
	"Mule3",
	"Nemesis",
	"Nero",
	"Nero2",
	"Nightblade",
	"Nightshade",
	"NightShark",
	"Nimbus",
	"Ninef",
	"Ninef2",
	"Omnis",
	"Oppressor",
	"Oracle",
	"Oracle2",
	"Osiris",
	"Packer",
	"Panto",
	"Paradise",
	"Patriot",
	"PBus",
	"PCJ",
	"Penetrator",
	"Penumbra",
	"Peyote",
	"Pfister811",
	"Phantom",
	"Phantom2",
	"Phantom3",
	"Phoenix",
	"Picador",
	"Pigalle",
	"Police",
	"Police2",
	"Police3",
	"Police4",
	"Policeb",
	"PoliceOld1",
	"PoliceOld2",
	"PoliceT",
	"Polmav",
	"Pony",
	"Pony2",
	"Pounder",
	"Prairie",
	"Pranger",
	"Predator",
	"Premier",
	"Primo",
	"Primo2",
	"Prototipo",
	"Radi",
	"RancherXL",
	"RancherXL2",
	"RallyTruck",
	"RapidGT",
	"RapidGT2",
	"Raptor",
	"RatBike",
	"RatLoader",
	"RatLoader2",
	"Reaper",
	"Rebel",
	"Rebel2",
	"Regina",
	"RentalBus",
	"Rhapsody",
	"Rhino",
	"Riot",
	"Ripley",
	"Rocoto",
	"Romero",
	"Rubble",
	"Ruffian",
	"Ruiner",
	"Ruiner2",
	"Ruiner3",
	"Rumpo",
	"Rumpo2",
	"Rumpo3",
	"Ruston",
	"SabreGT",
	"SabreGT2",
	"Sadler",
	"Sadler2",
	"Sanchez",
	"Sanchez2",
	"Sanctus",
	"Sandking",
	"Sandking2",
	"Savage",
	"Schafter2",
	"Schafter3",
	"Schafter4",
	"Schafter5",
	"Schafter6",
	"Schwarzer",
	"Scorcher",
	"Scrap",
	"Seashark",
	"Seashark2",
	"Seashark3",
	"Seminole",
	"Sentinel",
	"Sentinel2",
	"Serrano",
	"Seven70",
	"Shamal",
	"Sheava",
	"Sheriff",
	"Sheriff2",
	"Shotaro",
	"Skylift",
	"SlamVan",
	"SlamVan2",
	"SlamVan3",
	"Sovereign",
	"Specter",
	"Specter2",
	"Speeder",
	"Speeder2",
	"Speedo",
	"Speedo2",
	"Squalo",
	"Stalion",
	"Stalion2",
	"Stanier",
	"Stinger",
	"StingerGT",
	"Stockade",
	"Stockade3",
	"Stratum",
	"Stretch",
	"Stunt",
	"Sultan",
	"SultanRS",
	"Suntrap",
	"Superd",
	"Supervolito",
	"Supervolito2",
	"Surano",
	"Surfer",
	"Surfer2",
	"Surge",
	"Swift2",
	"Swift",
	"T20",
	"Taco",
	"Tailgater",
	"Tampa",
	"Tampa2",
	"Tampa3",
	"Taxi",
	"Technical",
	"Technical2",
	"Technical3",
	"Tempesta",
	"Thrust",
	"TipTruck",
	"TipTruck2",
	"Titan",
	"Torero",
	"Tornado",
	"Tornado2",
	"Tornado3",
	"Tornado4",
	"Tornado5",
	"Tornado6",
	"Toro",
	"Toro2",
	"Tourbus",
	"TowTruck",
	"TowTruck2",
	"Tractor",
	"Tractor2",
	"Tractor3",
	"Trash",
	"Trash2",
	"TRFlat",
	"TriBike",
	"TriBike2",
	"TriBike3",
	"TrophyTruck",
	"TrophyTruck2",
	"Tropic",
	"Tropic2",
	"Tropos",
	"Tug",
	"Turismor",
	"Turismo2",
	"Tyrus",
	"Vacca",
	"Vader",
	"Vagner",
	"Valkyrie",
	"Valkyrie2",
	"Velum",
	"Velum2",
	"Verlierer2",
	"Vestra",
	"Vigero",
	"Vindicator",
	"Virgo",
	"Virgo2",
	"Virgo3",
	"Volatus",
	"Voltic",
	"Voltic2",
	"Voodoo",
	"Voodoo2",
	"Vortex",
	"Warrener",
	"Washington",
	"Wastelander",
	"Windsor",
	"Windsor2",
	"Wolfsbane",
	"XA21",
	"XLS",
	"XLS2",
	"Youga",
	"Youga2",
	"Zentorno",
	"Zion",
	"Zion2",
	"ZombieA",
	"ZombieB",
	"ZType"
}

-- CODE --

-- CODE --

players = {}

RegisterNetEvent("Z:playerUpdate")
AddEventHandler("Z:playerUpdate", function(mPlayers)
	players = mPlayers
end)

cars = {}

Citizen.CreateThread(function()
	while true do
		Wait(1)
		
		if #cars < 2 then
			x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			
			repeat
				Wait(1)
				
				repeat
					Wait(1)
					newVehicleX = x + math.random(-1000, 1000)
					NewVehicleY = y + math.random(-1000, 1000)
					_,NewVehicleZ = GetGroundZFor_3dCoord(newVehicleX+.0,NewVehicleY+.0,z+999.0, 1)
				until NewVehicleZ ~= 0
				canSpawn = true
				
				--[[
				for _, player in pairs(players) do
					Wait(1)
					playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
					if newVehicleX > playerX - 200 and newVehicleX < playerX + 200 or NewVehicleY > playerY - 200 and NewVehicleY < playerY + 200 then
						canSpawn = false
						break
					else
						canSpawn = true
					end
				end
				--]]
			until canSpawn
			
			choosenCar = spawnableCars[math.random(1, #spawnableCars)]
			RequestModel(choosenCar)
			while not HasModelLoaded(choosenCar) or not HasCollisionForModelLoaded(choosenCar) do
				Wait(1)
			end
			
			car = CreateVehicle(choosenCar, newVehicleX, NewVehicleY, NewVehicleZ, math.random(), true, true)
			SetVehicleFuelLevel(car, math.random() + math.random(10, 80))
			SetVehicleEngineHealth(car, math.random(400,1000)+0.0)
			PlaceObjectOnGroundProperly(car)
			if not NetworkGetEntityIsNetworked(car) then
				NetworkRegisterEntityAsNetworked(car)
			end
			table.insert(cars, car)
		end
		
		for i, car in pairs(cars) do
			if not DoesEntityExist(car) then
				SetEntityAsNoLongerNeeded(car)
				table.remove(cars, i)
			elseif IsEntityDead(car) then
				SetEntityAsNoLongerNeeded(car)
				DeleteDeadVeh(car)
			else
				local	playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
				local	carX, carY = table.unpack(GetEntityCoords(car, false))
				
				if carX < playerX - 1000 or carX > playerX + 1000 or carY < playerY - 1000 or carY > playerY + 1000 then
					-- Set car as no longer needed for despawning
					SetEntityAsNoLongerNeeded(car)
					table.remove(cars, i)
				end
			end
		end
	end
end)


Citzen.CreateThread(function()
	function DeleteDeadVeh(veh)
		Citizen.Wait(180000)
		DeleteVehicle(veh)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for i, car in pairs(cars) do
			playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			carX, carY, carZ = table.unpack(GetEntityCoords(car, false))
			--	DrawLine(playerX,playerY, playerZ, carX, carY, carZ, 255.0,0.0,0.0,255.0)
		end
	end
end)

RegisterNetEvent("Z:cleanup")
AddEventHandler("Z:cleanup", function()
	for i, car in pairs(cars) do
		-- Set car as no longer needed for despawning
		Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(car))
		
		table.remove(cars, i)
	end
end)