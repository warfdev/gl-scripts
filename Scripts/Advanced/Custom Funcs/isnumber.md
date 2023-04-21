### Code;

```lua
function isNumber(value)
    if value == tostring(tonumber(value)) then
        return true
    else
        return false
    end
end
```

| Usage | Returns |
|-------|---------|
|`isNumber("hello")`|`false`|
|`isNumber(31)`|`true`|

### example code;
```lua
str = "Selam"
if isNumber(str) == true then
    LogToConsole("contains numbers")
else if isNumber(str) == false then
    LogToConsole("does not contains numbers")
end
end
```
