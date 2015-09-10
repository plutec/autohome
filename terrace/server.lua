

srv=net.createServer(net.TCP) srv:listen(80,function(conn)
    conn:on("receive",function(conn,payload)
    --print(payload) -- for debugging only
    --generates HTML web site
    conn:send('HTTP/1.1 200 OK\r\nConnection: keep-alive\r\nCache-Control: private, no-store\r\n\r\n\
    {"temp": '..temperature..', "hum": '..humidity..'}')
    conn:on("sent",function(conn) conn:close() end)
    end)
end)