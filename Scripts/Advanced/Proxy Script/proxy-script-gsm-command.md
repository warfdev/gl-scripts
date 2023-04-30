### Code;
* (visual)
```lua
newCommand({
  name = "/gsm",
  code = [[
    msg = clog:gsub("action|input\n|text|", "")
    if msg == "" then
      LogToConsole("error")
    end
    
    function GlobalSystemMessage(str)
      str = msg
      LogToConsole("`4 ** Global System Message: `0" .. str)
    end
    GlobalSystemMessage(msg)
  ]]
})
```
