-- Your access point's SSID and password
local SSID = "SSID"
local SSID_PASSWORD = "PASSWD"
local cfg =
  {
    ip="192.168.1.201",
    netmask="255.255.255.0",
    gateway="192.168.1.1"
  }

wifi.setmode(wifi.STATION)
wifi.sta.setip(cfg)

wifi.sta.config(SSID, SSID_PASSWORD)
wifi.sta.autoconnect(1)
tmr.delay(15000000) --15 seconds
print(wifi.sta.getip())


function check_wifi()
 local ip = wifi.sta.getip()
 if(ip==nil) then
  -- print("Connecting...")
 else
  tmr.stop(0)
  -- print("Connected to AP!")
  -- print(ip) 
 end
 
end

tmr.alarm(0,2000,1,check_wifi)