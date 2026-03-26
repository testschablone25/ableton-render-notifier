```
    (\(\
    ( -.-)
    o_(")(")
```

# render notifier 🐰🐮

this plays a sound when it's done rendering to file so you don't have to keep checking

## what it does

- detects when rendering finishes
- plays whatever sound you want (wav/mp3)
- volume slider
- mute button if you're in a call or whatever
- remembers your settings

```
  ┌─────────────────────────┐
  │ 🐰 Render Notifier 🐮  │
  │                         │
  │  🐮 pick a sound  ▶️🐰  │
  │  ━━━━━━━━━━ 70%         │
  │  🐮 mute                │
  └─────────────────────────┘
```

## install

just drag `Render Notifier.amxd` into any track in ableton 12

that's it

```
  (\(\
  ( -.-)    "ez"
  o_(")(")
```

## if it doesn't work

the device uses `live_set.is_rendering` to know when you're rendering

if your ableton version uses a different property name:
1. open the device in max 8 (click edit)
2. find `live.observer is_rendering`
3. change it to whatever your version uses
4. cry then try again

```
  (\(\
  ( O_O)   "oh no"
  o_(")(")
```



```
    (\(\
    ( -.-)
    o_(")(")  🐰 + 🐮
```

[github repo](https://github.com/testschablone25/ableton-render-notifier)

^_^
