Citizen.CreateThread(function()
	greenr,greeng,greenb = 0,255,0
	yellowr,yellowg,yellowb = 255,191,0
	redr,redg,redb = 255,0,0
	while true do
		Wait(1)
		
		SetTextFont(0)
		SetTextProportional(1)
		SetTextScale(0.0, 0.3)
		SetTextColour(128, 128, 200, 255)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString("RottenV:R Alpha v1.15R: https://discord.gg/jxHaDea")
		DrawText(0.005, 0.005)
		
		health = GetEntityHealth(GetPlayerPed(-1))
		if health then
			SetTextFont(0)
			SetTextProportional(1)
			SetTextScale(0.0, 0.55)
			if health < 130 then 
			SetTextColour(redr,redg,redb, 255)
			else
			SetTextColour(0, 255, 0, 255)
			end
			SetTextDropshadow(0, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()
			SetTextEntry("STRING")
			AddTextComponentString("HP: " .. health - 100)
			DrawText(0.16, 0.95)
		end
		hunger = DecorGetFloat(GetPlayerPed(-1), "hunger")
		if hunger then
			SetTextFont(0)
			SetTextProportional(1)
			SetTextScale(0.0, 0.55)
			if hunger < 40.0 and hunger > 20.0 then
			SetTextColour(yellowr,yellowg,yellowb, 255)
			elseif hunger < 20.0 then
			SetTextColour(redr,redg,redb, 255)
			else
			SetTextColour(0, 255, 0, 255)
			end
			SetTextDropshadow(0, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()
			SetTextEntry("STRING")
			AddTextComponentString("Hunger: " .. math.round(hunger))
			DrawText(0.16, 0.85)
		end
		thirst = DecorGetFloat(GetPlayerPed(-1), "thirst")
		if thirst then
			SetTextFont(0)
			SetTextProportional(1)
			SetTextScale(0.0, 0.55)
			if thirst < 40.0 and thirst > 20.0 then
			SetTextColour(yellowr,yellowg,yellowb, 255)
			elseif thirst < 20.0 then
			SetTextColour(redr,redg,redb, 255)
			else
			SetTextColour(0, 255, 0, 255)
			end
			SetTextDropshadow(0, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()
			SetTextEntry("STRING")
			AddTextComponentString("Thirst: " .. math.round(thirst))
			DrawText(0.16, 0.90)
		end
	end
end)


function math.round(num, numDecimalPlaces)
	return string.format("%.0f", num)
end