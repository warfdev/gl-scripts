### Code;
```lua
-- main vars
proxy = {}
proxy.cmd = "`6[PS-PROXY] `o"
proxy.dev = "wharf#8770"
proxy.log = LogToConsole



-- command vars
modtag = false




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
  
  if packet:find(clog .. "/proxy") then
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
      plog("Lutfen droplanacak miktar yazin")
    else
      SendPacket(2, "action|drop\n|itemID|242")
      Sleep(150)
      SendPacket(2, "action|dialog_return\ndialog_name|dropdialog\ndropitemcount|"..str)
      plog("dropped `2"..str.." `0 World Lock")
    end
    return true
  end
  
  
  if packet:find(clog .. "/dl") then
    ulog("/dl")
    str = packet:gsub("action|input\n|text|/dl", "")
    if str == "" then
      plog("Lutfen droplanacak miktar yazin")
    else
      SendPacket(2, "action|drop\n|itemID|242")
      Sleep(150)
      SendPacket(2, "action|dialog_return\ndialog_name|dropdialog\ndropitemcount|"..str)
      plog("dropped `2"..str.."`0 Diamond Lock")
    end
    return true
  end
  
  
  
  if packet:find(clog .. "/bgl") then
    ulog("/dl")
    str = packet:gsub("action|input\n|text|/bgl", "")
    if str == "" then
      plog("Lutfen droplanacak miktar yazin")
    else
      SendPacket(2, "action|drop\n|itemID|7188")
      Sleep(150)
      SendPacket(2, "action|dialog_return\ndialog_name|dropdialog\ndropitemcount|"..str)
      plog("dropped`2"..str.." `0 Blue Gem Lock")
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
  
  
  
  
  return false
end



-- on_variant hook
function on_variant(var)
  varcontent = var.v2
  
  if var.v1 == "OnConsoleMessage" then
    proxy.log(proxy.cmd .. varcontent)
    return true
  end
  
end

-- hooks
AddHook(on_events, "OnSendPacket")
AddHook(on_variant, "OnVariant")
```
