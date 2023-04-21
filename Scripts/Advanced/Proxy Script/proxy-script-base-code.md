### Code;

```lua
-- wharf#8770


scriptLog = "`2[SCRIPT] `o"

function log(str)
    LogToConsole(scriptLog .. str)
end



function custom_command(type, packet) -- bu bizim kullanacagimiz hook olucak
    
    clog = "action|input\n|text|"
    
    -- example basic commands
    if packet:find(clog .. "/selam" ) then
        SendPacket(2, "action|input\n|text|Selam `2"..GetLocal().name.."`0!")
        return true
    end

    if packet:find(clog .. "/proxy") then
        log([[Proxy Commands >> /selam
        ]])
    end
    
    return false
end


-- HOOK
AddHook(custom_command, "OnSendPacket") 
