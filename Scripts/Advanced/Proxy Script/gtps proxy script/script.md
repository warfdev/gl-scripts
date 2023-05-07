### READ UPDATES - `SC-INFO.md`
```lua
-- main vars
proxy = {}
proxy.cmd = "`6[PS-PROXY] `o"
proxy.dev = "wharf#8770"
proxy.tag = "`6[PS-PROXY]`` "
proxy.log = LogToConsole
proxy.toggle = EditToggle



-- command vars
commands = {}
commands.modfly = false
commands.savedworld = false
commands.modsdetect = false




-- custom funcs
function plog(str)
  proxy.log(proxy.cmd .. str)
end

function ulog(str)
  proxy.log(proxy.cmd.."`2Used Command: `6 "..str)
end

function isNumber(value)
  return type(value) == "number" and value == value
end

function gsm(str)
  proxy.log("`4Global System Message: `o"..str)
end

function drop(itemid, amount)
  SendPacket(2, "action|drop\n|itemID|"..itemid)
  Sleep(150)
  SendPacket(2, "action|dialog_return\ndialog_name|dropdialog\ndropitemcount|"..amount)
end

function tOverlay(str)
  var = {}
  var.v0 = "OnTextOverlay"
  var.v1 = str
  SendVariant(var);
end




-- dialog vars
help = [[
add_label_with_icon|big|`6[PS-PROXY] `oGrowtopia Proxy Gazette                    |left|5016|
add_spacer|small|
add_textbox|proxy by `2wharf#8770||
add_spacer|big|
add_label_with_icon|small|Commands  List|left|5016|
add_spacer|small|
add_textbox|`o/wl [amount] `3(drop wl - if you have)||
add_textbox|`o/dl [amount] `3(drop dl - if you have)||
add_textbox|`o/bgl [amount] `3(drop bgl - if you have)||
add_textbox|`o/gsm [text] `3(send global system message - VISUAL)||
add_textbox|`o/fly `3(mod fly)||
add_spacer|big|
end_dialog|end|Close|Okay|
]]
var = {}
var.v0 = "OnDialogRequest"
var.v1 = help
SendVariant(var);

-- event hook
function on_events(type, packet)
  clog = "action|input\n|text|"
  
  if packet:find(clog .. "/proxy") or packet:find(clog.. "/p") then
    ulog("/proxy")
    var = {}
    var.v0 = "OnDialogRequest"
    var.v1 = help
    SendVariant(var);
    return true
  end
  
  
  if packet:find(clog .. "/wl") then
    ulog("/wl")
    str = packet:gsub("action|input\n|text|/wl", "")
    if str == "" then
      plog("Please enter the amount to drop.")
    else
      SendPacket(2, "action|drop\n|itemID|242")
      Sleep(150)
      SendPacket(2, "action|dialog_return\ndialog_name|dropdialog\ndropitemcount|"..str)
      plog("dropped `0"..str.." `0 World Lock")
    end
    return true
  end
  
  
  if packet:find(clog .. "/dl") then
    ulog("/dl")
    str = packet:gsub("action|input\n|text|/dl", "")
    if str == "" then
      plog("Please enter the amount to drop.")
    else
      SendPacket(2, "action|drop\n|itemID|242")
      Sleep(150)
      SendPacket(2, "action|dialog_return\ndialog_name|dropdialog\ndropitemcount|"..str)
      plog("dropped `0"..str.."`0 Diamond Lock")
    end
    return true
  end
  
  
  
  if packet:find(clog .. "/bgl") then
    ulog("/dl")
    str = packet:gsub("action|input\n|text|/bgl", "")
    if str == "" then
      plog("Please enter the amount to drop.")
    else
      SendPacket(2, "action|drop\n|itemID|7188")
      Sleep(150)
      SendPacket(2, "action|dialog_return\ndialog_name|dropdialog\ndropitemcount|"..str)
      plog("dropped `0"..str.." `0 Blue Gem Lock")
    end
    return true
  end
  
  
  
  if packet:find(clog .. "/gsm") then
    ulog("/gsm")
    str = packet:gsub("action|input\n|text|/gsm", "")
    
    if str == "" then
      plog("Lutfen mesaj yazin")
    else
      gsm(str)
    end
    return true
  end
  
  
  if packet:find(clog .. "/fly") then
    ulog("/fly")
    if commands.modfly == false then
      plog("ModFly `2activated")
      proxy.toggle("ModFly", true)
      commands.modfly = true
    else
      plog("ModFly `4de-activated")
      proxy.toggle("ModFly", false)
      commands.modfly = false
    end
    return true
  end
  
  
  if packet:find(clog .. "/savew") then
    ulog("/savew")
    if commands.savedworld == false then
      commands.savedworld = GetWorldName()
      plog("world saved: `2"..commands.savedworld)
    else
      world = {}
      world.old = commands.savedworld
      world.new = GetWorldName()
      commands.savedworld = world.new
      plog("save world changed: `2"..commands.saveworld)
    end
    
    return true
  end
  
  
  if packet:find(clog .. "/gow") then
    ulog("/gow")
    if commands.savedworld == false then
      plog("the world is not set. `2/savew")
    else
      tOverlay("Warping to `2"..commands.savedworld.."`0..")
      SendPacket(3, "action|joinrequest\nname|"..commands.savedworld.."\ninvitedWorld|0")
    end
    
    
    if packet:find(clog .. "/modsdetect") then
      ulog("/modsdetect")
      if commands.modsdetect == false then
        commands.modsdetect = true
        plog("invis moderator detection mode `2activated")
      else if commands.modsdetect == true then
        commands.modsdetect = false
        plog("invis moderator detection mode `4de-activated")
      end
      end
      
      return true
    end
    
    
    
    return true
  end
  
  return false
end



-- on_variant hook
function on_variant(var)
  varcontent = var.v2
  
  if var.v1 == "OnConsoleMessage" then
    proxy.log(proxy.cmd .. varcontent)
    return true
  end
  
  if commands.modsdetect == true then
    if var.v1 == "OnSpawn" then
      if var.v2 == "invis|1" then
        SendPacket(2, "action|input\n|text|/warn `0 Invisible `#@Moderator `0Joined!")
        plog("Invisible `#@Moderator ``Joined!")
      end
    end
  end
  
end

-- hooks
AddHook(on_events, "OnSendPacket")
AddHook(on_variant, "OnVariant")
```
