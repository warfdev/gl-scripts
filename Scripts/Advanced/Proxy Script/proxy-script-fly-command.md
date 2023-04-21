### Code;

```lua
mfly = "false"
if packet:find(clog .. "/fly") then
        if mfly == "false" then
            EditToggle("ModFly", true)
            log("Fly mode `2enabled")
            mfly = "true"
        else if mfly == "true" then
            EditToggle("ModFly", false)
            log("Fly mode `4disabled")
            mfly = "false"
        end
        end

        return true
    end
```
