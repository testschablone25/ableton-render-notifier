# Render Notifier Max for Live Device - Design Specification

**Date:** 2026-03-26  
**Project:** Ableton Live 12 Render Completion Notification Plugin  
**Type:** Max for Live Device (no audio/MIDI processing)

## Overview
A cute, customizable Max for Live device that plays a notification sound when Ableton Live finishes rendering audio to disk. The plugin observes Live's render state via the Live API and triggers a user‑selected sound file with volume control and mute options.

## Requirements
- **Trigger:** Detect when Ableton's Render to Disk operation completes
- **Sound:** User‑selectable audio file (WAV/MP3) via file browser
- **UI:** File browser, volume slider, mute toggle, test button, status indicator, global on/off toggle
- **Styling:** Simple cute styling with pastel colors and bunny/cow emojis
- **Device Type:** Max for Live Device (no audio/MIDI processing)
- **Persistence:** Save settings across Live sessions

## Architecture

### Core Components
1. **Live API Observer (`live.observer`)**
   - Monitors the `live_set`'s render‑state property (exact path TBD: likely `live_set.is_rendering` or similar)
   - When state changes from `true` → `false`, sends a bang to trigger playback

2. **Audio Playback Chain**
   - `play~` object loads user‑selected audio file (WAV/MP3)
   - `gain~` controls volume (0‑1 mapped from UI slider 0‑100%)
   - `switch~` implements mute toggle (opens/closes audio signal)

3. **UI Layer**
   - `filepicker` for sound selection
   - `live.slider` for volume
   - `live.toggle` for mute
   - `live.button` for test
   - `live.led` or `live.text` as status indicator
   - `live.toggle` for global enable/disable

4. **State Management**
   - `live.text` boxes store file path, volume, mute, and enabled state
   - `pattrstorage` saves settings to Ableton's preset system

### Signal Flow
```
live.observer (render state) → enable toggle → mute toggle → play~ → gain~ → dac~
                                    ↑              ↑           ↑        ↑
                                UI toggle     UI toggle   file picker  UI slider
```

## UI Design

### Layout (vertical flow)
```
[ 🐰 Render Notifier 🐮 ]
[──────────────────────]
[ Status: 🐰 ]  (green when rendering, off when idle)
[──────────────────────]
[ ✓ Enable Plugin ]
[──────────────────────]
[ 🐮 Choose Sound ]  [ ▶️🐰 Preview ]
    [selected‑filename.txt]
[──────────────────────]
[ Volume: 0%─────┼─────100% ]
[──────────────────────]
[ 🐮 Mute ]
```

### UI Elements
- **Title:** `live.text` "🐰 Render Notifier 🐮"
- **Status Indicator:** `live.led` or colored `live.text` "🐰" (green = rendering, gray = idle)
- **Enable Toggle:** `live.toggle` labeled "Enable Plugin"
- **File Browser:** `filepicker` button "🐮 Choose Sound"; filename displayed in `live.text` below
- **Test Button:** `live.button` "▶️🐰 Preview" (triggers `play~` immediately)
- **Volume Slider:** `live.slider` 0‑100, logarithmic mapping to gain
- **Mute Toggle:** `live.toggle` labeled "🐮 Mute"

## Cute Styling

### Color Palette (pastel)
- **Background:** `#f8f2ff` (very light lavender)
- **Accent:** `#ffb6c1` (light pink) for active toggles/slider
- **Text:** `#5d5d81` (soft purple‑gray)
- **Status Active:** `#98fb98` (pastel green)

### Visual Enhancements
- **Emojis:** Bunny (`🐰`) in title and status; cow (`🐮`) for file browser and mute
- **Rounded Corners:** `@cornerradius: 5` on all buttons/toggles
- **Border:** Subtle border `border: 5px; bordercolor: #ffb6c1;`
- **Active States:** Toggles/sliders use accent color when active

### Object Attributes
```javascript
// Example styling on live.toggle
@bgcolor #f8f2ff
@activecolor #ffb6c1
@bordercolor #ffb6c1
@cornerradius 5
```

## Implementation Notes

### Live API Details
- Need to confirm exact property path for render state: `live_set.is_rendering` or `live_set.rendering`
- May need to use `live.path` + `live.observer` combination
- Fallback: monitor transport state if render property not accessible

### Audio File Support
- `play~` supports WAV, AIFF, MP3 (if QuickTime installed)
- File path stored relative to Live project or absolute (user choice)
- Validate file exists on load; show error if missing

### State Persistence
- Use `pattrstorage` to save/load: file path, volume, mute, enabled
- Settings survive Live project close/reopen

### Error Handling
- If render state cannot be observed, show warning in status
- If audio file missing, disable playback and show error in filename display
- Graceful handling of missing Live API (older Live versions)

## Testing & Verification

### Test Scenarios
1. **Render Detection:** Start render in Ableton, verify status LED lights; when render finishes, verify sound plays (if enabled)
2. **UI Controls:** Test file browser, volume slider, mute toggle, enable toggle, test button
3. **Persistence:** Close/reopen Live project, verify settings restored
4. **Edge Cases:** Canceled render, multiple rapid renders, missing audio file

### Validation Steps
- Device loads without errors in Max for Live
- All UI controls respond correctly
- Sound plays at correct volume when triggered
- Status LED accurately reflects render state
- Settings persist across Live sessions

## Open Questions
- Exact Live API property path for render state (requires testing)
- Whether `play~` or `sfplay~` is better for MP3 support
- Whether to add a "custom emoji" option for advanced users

## Next Steps
1. Create implementation plan (`writing‑plans` skill)
2. Build Max patch with core observer + audio chain
3. Add UI elements and styling
4. Test with Ableton Live 12
5. Package as `.amxd` file