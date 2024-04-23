rednet.open("top")
while(true) do 
    local id, msg, protocol = rednet.receive()
    if msg == "query_lever" then
        rednet.broadcast(rs.getInput("back"))
    end
end
