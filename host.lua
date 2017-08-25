


function DistanceBetweenCoords(x1,y1,z1,x2,y2,z2)
    local deltax = x1 - x2
    local deltay = y1 - y2
    local deltaz = z1 - z2
    
    dist = math.sqrt((deltax * deltax) + (deltay * deltay) + (deltaz * deltaz))
    xout = math.abs(deltax)
    yout = math.abs(deltay)
    zout = math.abs(deltaz)
    result = {distance = dist, x = xout, y = yout, z = zout}
    
    return dist
end
