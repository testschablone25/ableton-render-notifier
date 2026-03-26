```
    (\(\
    ( -.-)   🐰 RENDER NOTIFIER 🐮
    o_(")(")
```

# 🐰 Render Notifier 🐮

**A cute Max for Live device that plays a notification sound when Ableton Live finishes rendering!**

```
  ╭──────────────────────────────────╮
  │  🐰 No more wondering if your   │
  │     render is done! 🐮          │
  ╰──────────────────────────────────╯
```

## ✨ Features

- 🐰 **Render Detection** — Automatically detects when rendering finishes
- 🐮 **Custom Sounds** — Load your own WAV/MP3 notification sound
- 🎚️ **Volume Control** — Adjustable volume slider
- 🔇 **Mute Toggle** — Silence notifications when you need focus
- 💾 **Persistent Settings** — Remembers your sound and preferences
- 🎀 **Cute Design** — Pastel colors with bunny & cow emojis

```
    ┌─────────────────────────┐
    │ 🐰 Render Notifier 🐮  │
    ├─────────────────────────┤
    │  [🐰]  Enable Plugin    │
    │  🐮 Choose Sound  ▶️🐰  │
    │  Volume: ━━━━━━━━ 70%   │
    │  🐮 Mute                │
    └─────────────────────────┘
```

## 📦 Installation

1. Download `Render Notifier.amxd` from this repository
2. Drag it into any track in Ableton Live 12
3. That's it! You're ready to go~ 🐰

```
  (\(\
  ( -.-)    "just drag and drop, easy peasy~"
  o_(")(")
```

## 🎮 Usage

1. **Select a sound** 🐮 — Click the file picker to choose a WAV/MP3 file
2. **Preview it** ▶️🐰 — Hit the preview button to test your sound
3. **Adjust volume** — Use the slider to set the perfect level
4. **Toggle mute** 🐮 — Quick silence when you need it
5. **Enable/Disable** — Turn the whole thing on or off

```
  ╭──────────╮
  │    🐰    │  <- bunny lights up when rendering!
  ╰──────────╯
```

## 🔧 Troubleshooting

**Notification not triggering?**

The device uses `live_set.is_rendering` to detect renders. If it doesn't work:

1. Open the device in Max 8 (click Edit in Live)
2. Find `live.observer is_rendering`
3. Try changing to `rendering` or check Live's API docs
4. Test with a render to verify~

```
  (\(\
  ( O_O)   "oh no, let me help you fix it~"
  o_(")(")
```

## 💝 Made with love

```
    (\(\
    ( -.-)
    o_(")(")  🐰 + 🐮 = 💕
```

A cute little device for producers who forget renders are running~

---

**Repository:** [github.com/testschablone25/ableton-render-notifier](https://github.com/testschablone25/ableton-render-notifier)

*^_^ happy rendering~ 🐰🐮*
