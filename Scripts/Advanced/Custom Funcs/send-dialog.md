### Code;
```lua
function sendDialog(code)
        var = {}
        var.v0 = "OnDialogRequest"
        var.v1 = code
        SendVariant(var);
        return true
end
```

### Usage;
```lua
sendDialog([[
add_label_with_icon|wharf#8770 SC|left|32|
add_spacer|big|
add_textbox|`2sup||
add_spacer|big|
end_dialog||Close|Okay|
add_quick_exit|
]])
```
