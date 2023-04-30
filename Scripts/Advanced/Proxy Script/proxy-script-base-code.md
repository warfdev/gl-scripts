### Code;

```lua
-- wharf#8770

-- new command function
function newCommand(command)
  local cmdName = command.name
  local cmdCode = command.code
  
  if packet:find(clog .. cmdName) then
    load(cmdCode)()
    return true
  end
end




scriptLog = "`2[SCRIPT] `o"

function log(str)
    LogToConsole(scriptLog .. str)
end



function custom_command(type, packet)
    
    clog = "action|input\n|text|"
    
    -- example basic commands
    if packet:find(clog .. "/selam" ) then
        SendPacket(2, "action|input\n|text|Selam `2"..GetLocal().name.."`0!")
        return true
    end

    if packet:find(clog .. "/proxy") then
        log([[Proxy Commands >> /selam
        ]])
        return true
    end
    

    newCommand({
        name = "/gay",
        code = [[
          user = GetLocal().name
          LogToConsole(user .. " gay")
        ]]
    })


    return false
end


-- HOOK
AddHook(custom_command, "OnSendPacket") 
