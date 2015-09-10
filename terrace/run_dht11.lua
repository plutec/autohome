humidity="XX"
temperature="XX"

PIN = 4 --  data pin, GPIO2

--load DHT11 module and read sensor
function ReadDHT11()
    dht11 = require("dht11")
    dht11.read(PIN)
    t = dht11.getTemperature()
    h = dht11.getHumidity()
    humidity=(h)
    temperature=(t)
    -- print("Humidity:    "..humidity.."%")
    -- print("Temperature: "..temperature.." C")
    dht11 = nil
    package.loaded["dht11"]=nil
end

ReadDHT11()

-- Refresh the data each 5 seconds
tmr.alarm(1 , 5000, 1, function() 
    ReadDHT11()
end)
