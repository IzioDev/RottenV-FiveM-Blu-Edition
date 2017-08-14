-- CONFIG --

-- Zombies have a 1 in 150 chance to spawn with guns
-- It will choose a gun in this list when it happens
-- Weapon list here: https://www.se7ensins.com/forums/threads/weapon-and-explosion-hashes-list.1045035/
-- Only add the weapon name, not the weapon hash
local pedWeps =
{
	"WEAPON_PISTOL",
	"WEAPON_MG",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SNIPERRIFLE"
}

local pedModels = 
{
"A_F_M_Beach_01",
"A_F_M_BevHills_01",
"A_F_M_BevHills_02",
"A_F_M_BodyBuild_01",
"A_F_M_Business_02",
"A_F_M_Downtown_01",
"A_F_M_EastSA_01",
"A_F_M_EastSA_02",
"A_F_M_FatBla_01",
"A_F_M_FatCult_01",
"A_F_M_FatWhite_01",
"A_F_M_KTown_01",
"A_F_M_KTown_02",
"A_F_M_ProlHost_01",
"A_F_M_Salton_01",
"A_F_M_SkidRow_01",
"A_F_M_SouCentMC_01",
"A_F_M_SouCent_01",
"A_F_M_SouCent_02",
"A_F_M_Tourist_01",
"A_F_M_TrampBeac_01",
"A_F_M_Tramp_01",
"A_F_O_GenStreet_01",
"A_F_O_Indian_01",
"A_F_O_KTown_01",
"A_F_O_Salton_01",
"A_F_O_SouCent_01",
"A_F_O_SouCent_02",
"A_F_Y_Beach_01",
"A_F_Y_BevHills_01",
"A_F_Y_BevHills_02",
"A_F_Y_BevHills_03",
"A_F_Y_BevHills_04",
"A_F_Y_Business_01",
"A_F_Y_Business_02",
"A_F_Y_Business_03",
"A_F_Y_Business_04",
"A_F_Y_EastSA_01",
"A_F_Y_EastSA_02",
"A_F_Y_EastSA_03",
"A_F_Y_Epsilon_01",
"A_F_Y_Fitness_01",
"A_F_Y_Fitness_02",
"A_F_Y_GenHot_01",
"A_F_Y_Golfer_01",
"A_F_Y_Hiker_01",
"A_F_Y_Hippie_01",
"A_F_Y_Hipster_01",
"A_F_Y_Hipster_02",
"A_F_Y_Hipster_03",
"A_F_Y_Hipster_04",
"A_F_Y_Indian_01",
"A_F_Y_Juggalo_01",
"A_F_Y_Runner_01",
"A_F_Y_RurMeth_01",
"A_F_Y_SCDressy_01",
"A_F_Y_Skater_01",
"A_F_Y_SouCent_01",
"A_F_Y_SouCent_02",
"A_F_Y_SouCent_03",
"A_F_Y_Tennis_01",
"A_F_Y_Topless_01",
"A_F_Y_Tourist_01",
"A_F_Y_Tourist_02",
"A_F_Y_Vinewood_01",
"A_F_Y_Vinewood_02",
"A_F_Y_Vinewood_03",
"A_F_Y_Vinewood_04",
"A_F_Y_Yoga_01",
"A_M_M_ACult_01",
"A_M_M_AfriAmer_01",
"A_M_M_Beach_01",
"A_M_M_Beach_02",
"A_M_M_BevHills_01",
"A_M_M_BevHills_02",
"A_M_M_Business_01",
"A_M_M_EastSA_01",
"A_M_M_EastSA_02",
"A_M_M_Farmer_01",
"A_M_M_FatLatin_01",
"A_M_M_GenFat_01",
"A_M_M_GenFat_02",
"A_M_M_Golfer_01",
"A_M_M_HasJew_01",
"A_M_M_Hillbilly_01",
"A_M_M_Hillbilly_02",
"A_M_M_Indian_01",
"A_M_M_KTown_01",
"A_M_M_Malibu_01",
"A_M_M_MexCntry_01",
"A_M_M_MexLabor_01",
"A_M_M_OG_Boss_01",
"A_M_M_Paparazzi_01",
"A_M_M_Polynesian_01",
"A_M_M_ProlHost_01",
"A_M_M_RurMeth_01",
"A_M_M_Salton_01",
"A_M_M_Salton_02",
"A_M_M_Salton_03",
"A_M_M_Salton_04",
"A_M_M_Skater_01",
"A_M_M_Skidrow_01",
"A_M_M_SoCenLat_01",
"A_M_M_SouCent_01",
"A_M_M_SouCent_02",
"A_M_M_SouCent_03",
"A_M_M_SouCent_04",
"A_M_M_StLat_02",
"A_M_M_Tennis_01",
"A_M_M_Tourist_01",
"A_M_M_TrampBeac_01",
"A_M_M_Tramp_01",
"A_M_M_TranVest_01",
"A_M_M_TranVest_02",
"A_M_O_ACult_01",
"A_M_O_ACult_02",
"A_M_O_Beach_01",
"A_M_O_GenStreet_01",
"A_M_O_KTown_01",
"A_M_O_Salton_01",
"A_M_O_SouCent_01",
"A_M_O_SouCent_02",
"A_M_O_SouCent_03",
"A_M_O_Tramp_01",
"A_M_Y_ACult_01",
"A_M_Y_ACult_02",
"A_M_Y_BeachVesp_01",
"A_M_Y_BeachVesp_02",
"A_M_Y_Beach_01",
"A_M_Y_Beach_02",
"A_M_Y_Beach_03",
"A_M_Y_BevHills_01",
"A_M_Y_BevHills_02",
"A_M_Y_BreakDance_01",
"A_M_Y_BusiCas_01",
"A_M_Y_Business_01",
"A_M_Y_Business_02",
"A_M_Y_Business_03",
"A_M_Y_Cyclist_01",
"A_M_Y_DHill_01",
"A_M_Y_Downtown_01",
"A_M_Y_EastSA_01",
"A_M_Y_EastSA_02",
"A_M_Y_Epsilon_01",
"A_M_Y_Epsilon_02",
"A_M_Y_Gay_01",
"A_M_Y_Gay_02",
"A_M_Y_GenStreet_01",
"A_M_Y_GenStreet_02",
"A_M_Y_Golfer_01",
"A_M_Y_HasJew_01",
"A_M_Y_Hiker_01",
"A_M_Y_Hippy_01",
"A_M_Y_Hipster_01",
"A_M_Y_Hipster_02",
"A_M_Y_Hipster_03",
"A_M_Y_Indian_01",
"A_M_Y_Jetski_01",
"A_M_Y_Juggalo_01",
"A_M_Y_KTown_01",
"A_M_Y_KTown_02",
"A_M_Y_Latino_01",
"A_M_Y_MethHead_01",
"A_M_Y_MexThug_01",
"A_M_Y_MotoX_01",
"A_M_Y_MotoX_02",
"A_M_Y_MusclBeac_01",
"A_M_Y_MusclBeac_02",
"A_M_Y_Polynesian_01",
"A_M_Y_RoadCyc_01",
"A_M_Y_Runner_01",
"A_M_Y_Runner_02",
"A_M_Y_Salton_01",
"A_M_Y_Skater_01",
"A_M_Y_Skater_02",
"A_M_Y_SouCent_01",
"A_M_Y_SouCent_02",
"A_M_Y_SouCent_03",
"A_M_Y_SouCent_04",
"A_M_Y_StBla_01",
"A_M_Y_StBla_02",
"A_M_Y_StLat_01",
"A_M_Y_StWhi_01",
"A_M_Y_StWhi_02",
"A_M_Y_Sunbathe_01",
"A_M_Y_Surfer_01",
"A_M_Y_VinDouche_01",
"A_M_Y_Vinewood_01",
"A_M_Y_Vinewood_02",
"A_M_Y_Vinewood_03",
"A_M_Y_Vinewood_04",
"A_M_Y_Yoga_01",
"CSB_Abigail",
"CSB_Anita",
"CSB_Anton",
"CSB_BallasOG",
"CSB_Bride",
"CSB_BurgerDrug",
"CSB_Car3guy1",
"CSB_Car3guy2",
"CSB_Chef",
"CSB_Chin_goon",
"CSB_Cletus",
"CSB_Cop",
"CSB_Customer",
"CSB_Denise_friend",
"CSB_FOS_rep",
"CSB_G",
"CSB_Groom",
"CSB_Grove_str_dlr",
"CSB_Hao",
"CSB_Hugh",
"CSB_Imran",
"CSB_Janitor",
"CSB_Maude",
"CSB_MWeather",
"CSB_Ortega",
"CSB_Oscar",
"CSB_PornDudes",
"CSB_PrologueDriver",
"CSB_ProlSec",
"CSB_Ramp_gang",
"CSB_Ramp_hic",
"CSB_Ramp_hipster",
"CSB_Ramp_marine",
"CSB_Ramp_mex",
"CSB_Reporter",
"CSB_RoccoPelosi",
"CSB_Screen_Writer",
"CSB_Stripper_01",
"CSB_Stripper_02",
"CSB_Tonya",
"CSB_TrafficWarden",
"CS_AmandaTownley",
"CS_Andreas",
"cs_ashley",
"CS_Bankman",
"CS_Barry",
"CS_Beverly",
"CS_Brad",
"CS_BradCadaver",
"CS_Carbuyer",
"CS_Casey",
"CS_ChengSr",
"CS_ChrisFormage",
"CS_Clay",
"CS_Dale",
"CS_DaveNorton",
"cs_debra",
"cs_denise",
"CS_Devin",
"CS_Dom",
"CS_Dreyfuss",
"CS_DrFriedlander",
"CS_Fabien",
"CS_FBISuit_01",
"CS_Floyd",
"CS_Guadalope",
"cs_gurk",
"CS_Hunter",
"CS_Janet",
"CS_JewelAss",
"CS_JimmyBoston",
"CS_JimmyDiSanto",
"CS_JoeMinuteMan",
"CS_JohnnyKlebitz",
"CS_Josef",
"CS_Josh",
"CS_LamarDavis",
"CS_Lazlow",
"CS_LesterCrest",
"CS_LifeInvad_01",
"CS_Magenta",
"CS_Manuel",
"CS_Marnie",
"CS_MartinMadrazo",
"CS_MaryAnn",
"CS_Michelle",
"CS_Milton",
"CS_Molly",
"CS_MovPremF_01",
"CS_MovPremMale",
"CS_MRK",
"CS_MrsPhillips",
"CS_MRS_Thornhill",
"CS_Natalia",
"CS_NervousRon",
"CS_Nigel",
"CS_Old_Man1A",
"CS_Old_Man2",
"CS_Omega",
"CS_Orleans",
"CS_Paper",
"CS_Patricia",
"CS_Priest",
"CS_ProlSec_02",
"CS_RussianDrunk",
"CS_SiemonYetarian",
"CS_Solomon",
"CS_SteveHains",
"CS_Stretch",
"CS_Tanisha",
"CS_TaoCheng",
"CS_TaosTranslator",
"CS_TennisCoach",
"CS_Terry",
"CS_Tom",
"CS_TomEpsilon",
"CS_TracyDiSanto",
"CS_Wade",
"CS_Zimbor",
"G_F_Y_ballas_01",
"G_F_Y_Families_01",
"G_F_Y_Lost_01",
"G_F_Y_Vagos_01",
"G_M_M_ArmBoss_01",
"G_M_M_ArmGoon_01",
"G_M_M_ArmLieut_01",
"G_M_M_ChemWork_01",
"G_M_M_ChiBoss_01",
"G_M_M_ChiCold_01",
"G_M_M_ChiGoon_01",
"G_M_M_ChiGoon_02",
"G_M_M_KorBoss_01",
"G_M_M_MexBoss_01",
"G_M_M_MexBoss_02",
"G_M_Y_ArmGoon_02",
"G_M_Y_Azteca_01",
"G_M_Y_BallaEast_01",
"G_M_Y_BallaOrig_01",
"G_M_Y_BallaSout_01",
"G_M_Y_FamCA_01",
"G_M_Y_FamDNF_01",
"G_M_Y_FamFor_01",
"G_M_Y_Korean_01",
"G_M_Y_Korean_02",
"G_M_Y_KorLieut_01",
"G_M_Y_Lost_01",
"G_M_Y_Lost_02",
"G_M_Y_Lost_03",
"G_M_Y_MexGang_01",
"G_M_Y_MexGoon_01",
"G_M_Y_MexGoon_02",
"G_M_Y_MexGoon_03",
"G_M_Y_PoloGoon_01",
"G_M_Y_PoloGoon_02",
"G_M_Y_SalvaBoss_01",
"G_M_Y_SalvaGoon_01",
"G_M_Y_SalvaGoon_02",
"G_M_Y_SalvaGoon_03",
"G_M_Y_StrPunk_01",
"G_M_Y_StrPunk_02",
"HC_Driver",
"HC_Gunman",
"HC_Hacker",
"IG_Abigail",
"IG_AmandaTownley",
"IG_Andreas",
"IG_Ashley",
"IG_BallasOG",
"IG_Bankman",
"IG_Barry",
"IG_BestMen",
"IG_Beverly",
"IG_Brad",
"IG_Bride",
"IG_Car3guy1",
"IG_Car3guy2",
"IG_Casey",
"IG_Chef",
"IG_ChengSr",
"IG_ChrisFormage",
"IG_Clay",
"IG_ClayPain",
"IG_Cletus",
"IG_Dale",
"IG_DaveNorton",
"IG_Denise",
"IG_Devin",
"IG_Dom",
"IG_Dreyfuss",
"IG_DrFriedlander",
"IG_Fabien",
"IG_FBISuit_01",
"IG_Floyd",
"IG_Groom",
"IG_Hao",
"IG_Hunter",
"IG_Janet",
"ig_JAY_Norris",
"IG_JewelAss",
"IG_JimmyBoston",
"IG_JimmyDiSanto",
"IG_JoeMinuteMan",
"ig_JohnnyKlebitz",
"IG_Josef",
"IG_Josh",
"IG_KerryMcIntosh",
"IG_LamarDavis",
"IG_Lazlow",
"IG_LesterCrest",
"IG_LifeInvad_01",
"IG_LifeInvad_02",
"IG_Magenta",
"IG_Manuel",
"IG_Marnie",
"IG_MaryAnn",
"IG_Maude",
"IG_Michelle",
"IG_Milton",
"IG_Molly",
"IG_MRK",
"IG_MrsPhillips",
"IG_MRS_Thornhill",
"IG_Natalia",
"IG_NervousRon",
"IG_Nigel",
"IG_Old_Man1A",
"IG_Old_Man2",
"IG_Omega",
"IG_ONeil",
"IG_Orleans",
"IG_Ortega",
"IG_Paper",
"IG_Patricia",
"IG_Priest",
"IG_ProlSec_02",
"IG_Ramp_Gang",
"IG_Ramp_Hic",
"IG_Ramp_Hipster",
"IG_Ramp_Mex",
"IG_RoccoPelosi",
"IG_RussianDrunk",
"IG_Screen_Writer",
"IG_SiemonYetarian",
"IG_Solomon",
"IG_SteveHains",
"IG_Stretch",
"IG_Talina",
"IG_Tanisha",
"IG_TaoCheng",
"IG_TaosTranslator",
"U_M_Y_Zombie_01"
}
-- CODE --

players = {}

RegisterNetEvent("Z:playerUpdate")
AddEventHandler("Z:playerUpdate", function(mPlayers)
	players = mPlayers
end)

peds = {}

Citizen.CreateThread(function()
	AddRelationshipGroup("zombeez")
	SetRelationshipBetweenGroups(5, GetHashKey("zombeez"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("zombeez"))
	SetAiMeleeWeaponDamageModifier(2.0)

	while true do
		Wait(1)

		if #peds < 100 then
			x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))

			choosenPed = pedModels[math.random(1, #pedModels)]
			choosenPed = string.upper(choosenPed)
			RequestModel(GetHashKey(choosenPed))
			while not HasModelLoaded(GetHashKey(choosenPed)) or not HasCollisionForModelLoaded(GetHashKey(choosenPed)) do
				Wait(1)
			end

			repeat
				Wait(1)

				newX = x + math.random(-300, 300)
				newY = y + math.random(-300, 300)

				for _, player in pairs(players) do
					Wait(1)
					playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
					if newX > playerX - 60 and newX < playerX + 60 or newY > playerY - 60 and newY < playerY + 60 then
						canSpawn = false
						break
					else
						canSpawn = true
					end
				end
			until canSpawn

			ped = CreatePed(4, GetHashKey(choosenPed), newX, newY, z - 500, 0.0, true, true)
			SetPedArmour(ped, 100)
			SetPedAccuracy(ped, 25)
			SetPedSeeingRange(ped, 9900000.0)
			SetPedHearingRange(ped, 9900000.0)

			SetPedFleeAttributes(ped, 0, 0)
   			SetPedCombatAttributes(ped, 16, 1)
			SetPedCombatAttributes(ped, 17, 0)
   			SetPedCombatAttributes(ped, 46, 1)
			SetPedCombatAttributes(ped, 1424, 0)
			SetPedCombatAttributes(ped, 5, 1)
			SetPedCombatRange(ped,2)
			SetAmbientVoiceName(ped, "ALIENS")
			SetPedEnableWeaponBlocking(ped, true)
			SetPedRelationshipGroupHash(ped, GetHashKey("zombeez"))
			DisablePedPainAudio(ped, true)
			SetPedDiesInWater(ped, false)
			SetPedDiesWhenInjured(ped, false)
			PlaceObjectOnGroundProperly(ped)
			SetPedIsDrunk(ped, true)
			RequestAnimSet("move_m@drunk@verydrunk")
			while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
				Wait(1)
			end
			SetPedMovementClipset(ped, "move_m@drunk@verydrunk", 1.0)
			ApplyPedDamagePack(ped,"BigHitByVehicle", 0.0, 9.0)
			ApplyPedDamagePack(ped,"SCR_Dumpster", 0.0, 9.0)
			ApplyPedDamagePack(ped,"SCR_Torture", 0.0, 9.0)
			StopPedSpeaking(ped,true)

			--TaskCombatPed(ped, GetPlayerPed(-1), 0, 16)
			x, y, z = table.unpack(GetEntityCoords(ped, true))
			TaskWanderStandard(ped, 1.0, 10)

			chance = math.random(150)
			if chance == 50 then
				randomWep = math.random(1, #pedWeps)
				GiveWeaponToPed(ped, GetHashKey(pedWeps[randomWep]), 9999, true, true)
			else
				
			end

			table.insert(peds, ped)
		end

		for i, ped in pairs(peds) do
			if not DoesEntityExist(ped) then
				table.remove(peds, i)
			elseif IsPedDeadOrDying(ped, 1) then
				-- Set ped as no longer needed for despawning
				Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(ped))
				table.remove(peds, i)
			else
				playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
				pedX, pedY = table.unpack(GetEntityCoords(ped, true))
			SetPedArmour(ped, 100)
			SetPedAccuracy(ped, 25)
			SetPedSeeingRange(ped, 9900000.0)
			SetPedHearingRange(ped, 9900000.0)

			SetPedFleeAttributes(ped, 0, 0)
   			SetPedCombatAttributes(ped, 16, 1)
			SetPedCombatAttributes(ped, 17, 0)
   			SetPedCombatAttributes(ped, 46, 1)
			SetPedCombatAttributes(ped, 1424, 0)
			SetPedCombatAttributes(ped, 5, 1)
			SetPedCombatRange(ped,2)
			SetAmbientVoiceName(ped, "ALIENS")
			SetPedEnableWeaponBlocking(ped, true)
			SetPedRelationshipGroupHash(ped, GetHashKey("zombeez"))
			DisablePedPainAudio(ped, true)
			SetPedDiesInWater(ped, false)
			SetPedDiesWhenInjured(ped, false)
				if pedX < playerX - 400 or pedX > playerX + 400 or pedY < playerY - 400 or pedY > playerY + 400 then
					-- Set ped as no longer needed for despawning
					local model = GetEntityModel(ped)
					SetEntityAsNoLongerNeeded(ped)
					eh = SetModelAsNoLongerNeeded(model)
					Citizen.Trace(eh)
					table.remove(peds, i)
				end
			end
		end
	end
end)

RegisterNetEvent("Z:cleanup")
AddEventHandler("Z:cleanup", function()
	for i, ped in pairs(peds) do
		-- Set ped as no longer needed for despawning
		local model = GetEntityModel(ped)
		SetEntityAsNoLongerNeeded(ped)
		Citizen.Trace(model)
		SetModelAsNoLongerNeeded(model)

		table.remove(peds, i)
	end
end)