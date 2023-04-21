### Code;
```lua
function start()
  while true do
    --vars
    posx = GetLocal().posX
    posy = GetLocal().posY


    --cmd
    SendPacket(2, "action|input\n|text|/setname `2( PosX - `6"..posx.."`2) `#--- `2( PosY - `6"..posy.."`2)")
    Sleep(500)
    SendPacket(2, "action|input\n|text|/setname `2( PosX - `6"..posx.."`2) `#--- `2( PosY - `6"..posy.."`2)")
  end
end
-- run --
while true do
start()
end```
