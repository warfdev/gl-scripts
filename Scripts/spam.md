### Code;

```lua
-- important
text = "YOUR_SPAM_TEXT"
wait = 4000 -- I wouldn't suggest you to touch this. Editing this can get your bot suspended.




function spam()
    for i=225,1,-1 do
        say(text)
        sleep(wait)
    end
    sleep(300000)
end


while true do
    spam()
end
```
