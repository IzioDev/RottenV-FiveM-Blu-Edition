Citizen.CreateThread(function()
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
                AddTextComponentString("RottenV Alpha v3.0 Blü edition")
                DrawText(0.005, 0.005)

                health = GetEntityHealth(GetPlayerPed(-1))
                if health then
                        SetTextFont(0)
                        SetTextProportional(1)
                        SetTextScale(0.0, 0.55)
        	        SetTextColour(0, 255, 0, 255)
        	        SetTextDropshadow(0, 0, 0, 0, 255)
        	        SetTextEdge(1, 0, 0, 0, 255)
        	        SetTextDropShadow()
        	        SetTextOutline()
        	        SetTextEntry("STRING")
        	        AddTextComponentString("HP: " .. health - 100)
        	        DrawText(0.005, 0.95)
                end
	end
end)