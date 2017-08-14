players = {}
host = nil
time = {h = 9, m = 0, s = 0}

RegisterServerEvent("Z:newplayer")
AddEventHandler("Z:newplayer", function(id)
    players[source] = id

    if not host then
        host = source
        TriggerClientEvent("Z:timesynchost", source, time)
    end
end)

AddEventHandler("playerDropped", function(reason)
    players[source] = nil

    if source == host then
        if #players > 0 then
            for mSource, _ in pairs(players) do
                host = mSource
                TriggerClientEvent("Z:timesynchost", host, time)
                break
            end
        else
            host = nil
        end
    end
end)

RegisterServerEvent("Z:timesync")
AddEventHandler("Z:timesync", function(newTime)
    time = newTime
    TriggerClientEvent("Z:timesync", -1, time)
end)