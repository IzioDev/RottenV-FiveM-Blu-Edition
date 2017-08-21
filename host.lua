RegisterNetEvent("Z:timesynchost")
AddEventHandler("Z:timesynchost", function(time)
	Citizen.CreateThread(function()
		while true do
			Wait(33)
			newTime = time
			
			newTime.s = newTime.s + 1
			if newTime.s > 59 then
				newTime.s = 0
				
				newTime.m = newTime.m + 1
				if newTime.m > 59 then
					newTime.m = 0
					
					newTime.h = time.h + 1
					if newTime.h > 23 then
						newTime.h = 0
					end
				end
			end
			
			TriggerServerEvent("Z:timesync", newTime)
		end
	end)
end)

function DistanceBetweenCoords(x1,y1,z1,x2,y2,z2)
    local deltax = x1 - x2
    local deltay = y1 - y2
    local deltaz = y1 - y2
    
    dist = math.sqrt((deltax * deltax) + (deltay * deltay) + (deltaz * deltaz))
    xout = math.abs(deltax)
    yout = math.abs(deltay)
    zout = math.abs(deltaz)
    result = {distance = dist, x = xout, y = yout, z = zout}
    
    return dist
end