# Render Notifier Max for Live Device Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a cute Max for Live device that plays a notification sound when Ableton Live finishes rendering audio to disk.

**Architecture:** Live API observer (`live.observer`) monitors render state; when rendering finishes (`true` → `false`), triggers audio playback of a user‑selected file (WAV/MP3) via `play~` with volume control (`gain~`) and mute (`switch~`). UI includes file picker, volume slider, mute toggle, test button, status LED, and enable toggle, all styled with pastel colors and bunny/cow emojis.

**Tech Stack:** Max 8, Max for Live, Ableton Live 12, pattrstorage for persistence.

---

## File Structure

**Primary Files:**
- `src/render-notifier.maxpat` – Main Max patch (Max for Live device)
- `assets/notification-sounds/` – Optional default sound samples
- `README.md` – User instructions

**The Max patch (`render-notifier.maxpat`) contains:**
- **Observer Section:** `live.observer` watching `live_set.is_rendering`
- **Audio Section:** `play~`, `gain~`, `switch~`, `dac~`
- **UI Section:** `live.text`, `live.toggle`, `live.slider`, `live.button`, `filepicker`, `live.led`
- **Storage Section:** `pattrstorage`, `pattr` bindings
- **Logic Section:** `route`, `sel`, `trigger`, `message` boxes for state management

---

### Task 1: Create Project Structure and Base Max Patch

**Files:**
- Create: `F:\renderPLUGIN\src\render-notifier.maxpat`
- Create: `F:\renderPLUGIN\README.md`
- Create: `F:\renderPLUGIN\assets\notification-sounds\README.txt`

- [ ] **Step 1: Create directories**

```bash
mkdir -p src assets/notification-sounds
```

- [ ] **Step 2: Initialize Max patch with basic device settings**

Create `src/render-notifier.maxpat` with minimal structure:

```json
{
  "fileversion": 1,
  "appversion": "8.6.0",
  "boxes": [],
  "lines": [],
  "dependency_cache": [],
  "patcher": {
    "fileversion": 1,
    "appversion": "8.6.0",
    "rect": [0, 0, 800, 600],
    "bglocked": false,
    "openinpresentation": true,
    "default_fontsize": 12,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridsize": [15, 15],
    "gridsnap": true
  }
}
```

- [ ] **Step 3: Write README stub**

```markdown
# Render Notifier Max for Live Device

Plays a cute notification sound when Ableton Live finishes rendering.

## Installation
1. Open `render-notifier.maxpat` in Max 8.
2. Save as `.amxd` via File → Save As → "Render Notifier.amxd".
3. Drop the `.amxd` file into any Ableton Live track.

## Usage
- Click 🐮 Choose Sound to select a WAV/MP3 file.
- Adjust volume with the slider.
- Toggle mute and enable/disable as needed.
- The bunny emoji 🐰 lights up when rendering is in progress.
```

- [ ] **Step 4: Commit**

```bash
git add src/render-notifier.maxpat README.md assets/notification-sounds/README.txt
git commit -m "chore: create project structure and base Max patch"
```

---

### Task 2: Implement Live API Render State Observer

**Files:**
- Modify: `F:\renderPLUGIN\src\render-notifier.maxpat`
- Add boxes for `live.path`, `live.observer`, `route`, `sel`, `trigger`.

- [ ] **Step 1: Add live.path and live.observer objects**

Edit `src/render-notifier.maxpat` to include these boxes (coordinates approximate):

```json
"boxes": [
  {
    "maxclass": "newobj",
    "text": "live.path live_set",
    "patching_rect": [50, 50, 100, 22],
    "id": "livepath"
  },
  {
    "maxclass": "newobj",
    "text": "live.observer is_rendering",
    "patching_rect": [50, 80, 120, 22],
    "id": "observer"
  },
  {
    "maxclass": "newobj",
    "text": "route 1",
    "patching_rect": [50, 110, 60, 22],
    "id": "route"
  },
  {
    "maxclass": "newobj",
    "text": "sel 0 1",
    "patching_rect": [50, 140, 60, 22],
    "id": "sel"
  },
  {
    "maxclass": "newobj",
    "text": "t b b",
    "patching_rect": [50, 170, 40, 22],
    "id": "trigger"
  }
]
```

- [ ] **Step 2: Connect observer to route and sel**

Add lines array entries (connect boxes):

```json
"lines": [
  { "patchline": ["observer", 0], "destination": ["route", 0] },
  { "patchline": ["route", 0], "destination": ["sel", 0] },
  { "patchline": ["sel", 0], "destination": ["trigger", 0] }
]
```

- [ ] **Step 3: Add comment explaining the logic**

Insert a `comment` box:

```json
{
  "maxclass": "comment",
  "text": "Observer watches live_set.is_rendering\nOutput 1 when rendering starts, 0 when it stops.\nWe only care about the stop (0) -> trigger bang.",
  "patching_rect": [200, 50, 200, 60],
  "id": "comment1"
}
```

- [ ] **Step 4: Commit**

```bash
git add src/render-notifier.maxpat
git commit -m "feat: add Live API observer for render state"
```

---

### Task 3: Build Audio Playback Chain

**Files:**
- Modify: `F:\renderPLUGIN\src\render-notifier.maxpat`
- Add `play~`, `gain~`, `switch~`, `dac~` objects and connections.

- [ ] **Step 1: Add audio objects below observer section**

Add boxes (starting at y=250):

```json
{
  "maxclass": "newobj",
  "text": "play~",
  "patching_rect": [50, 250, 60, 22],
  "id": "play"
},
{
  "maxclass": "newobj",
  "text": "gain~",
  "patching_rect": [120, 250, 60, 22],
  "id": "gain"
},
{
  "maxclass": "newobj",
  "text": "switch~",
  "patching_rect": [190, 250, 70, 22],
  "id": "switch"
},
{
  "maxclass": "newobj",
  "text": "dac~",
  "patching_rect": [270, 250, 50, 22],
  "id": "dac"
}
```

- [ ] **Step 2: Connect audio chain**

Add lines:

```json
{ "patchline": ["play", 0], "destination": ["gain", 0] },
{ "patchline": ["gain", 0], "destination": ["switch", 0] },
{ "patchline": ["switch", 0], "destination": ["dac", 0] },
{ "patchline": ["switch", 1], "destination": ["dac", 1] }
```

- [ ] **Step 3: Add message to load file and volume control**

Add `message` and `float` boxes:

```json
{
  "maxclass": "newobj",
  "text": "message read \\$1",
  "patching_rect": [50, 280, 80, 22],
  "id": "msg_read"
},
{
  "maxclass": "newobj",
  "text": "f \\$1",
  "patching_rect": [140, 280, 40, 22],
  "id": "vol_float"
}
```

Connect `vol_float` to `gain~`:

```json
{ "patchline": ["vol_float", 0], "destination": ["gain", 1] }
```

- [ ] **Step 4: Commit**

```bash
git add src/render-notifier.maxpat
git commit -m "feat: add audio playback chain with play~, gain~, switch~"
```

---

### Task 4: Create UI Elements – Status and Enable Toggle

**Files:**
- Modify: `F:\renderPLUGIN\src\render-notifier.maxpat`
- Add `live.text` (status), `live.toggle` (enable), and logic.

- [ ] **Step 1: Add status LED (bunny emoji)**

Place at top right (x=500, y=50):

```json
{
  "maxclass": "live.text",
  "text": "🐰",
  "patching_rect": [500, 50, 40, 40],
  "id": "status_text",
  "style": {
    "bgcolor": [248, 242, 255, 255],
    "textcolor": [93, 93, 129, 255],
    "bordercolor": [255, 182, 193, 255],
    "borderthickness": 2,
    "cornerradius": 5
  }
}
```

- [ ] **Step 2: Add enable toggle**

Below status (y=100):

```json
{
  "maxclass": "live.toggle",
  "text": "Enable Plugin",
  "patching_rect": [500, 100, 100, 22],
  "id": "enable_toggle",
  "parameter": "enable",
  "style": {
    "bgcolor": [248, 242, 255, 255],
    "activecolor": [255, 182, 193, 255],
    "bordercolor": [255, 182, 193, 255],
    "cornerradius": 5
  }
}
```

- [ ] **Step 3: Wire enable toggle to observer trigger**

Add a `gate` controlled by enable toggle:

```json
{
  "maxclass": "newobj",
  "text": "gate",
  "patching_rect": [200, 200, 40, 22],
  "id": "gate"
}
```

Connect `trigger` → `gate` → `play` bang:

```json
{ "patchline": ["trigger", 0], "destination": ["gate", 0] },
{ "patchline": ["gate", 0], "destination": ["play", 0] }
```

Add line from enable toggle to gate open:

```json
{ "patchline": ["enable_toggle", 0], "destination": ["gate", 1] }
```

- [ ] **Step 4: Commit**

```bash
git add src/render-notifier.maxpat
git commit -m "feat: add status LED and enable toggle UI"
```

---

### Task 5: Add File Browser and Test Button

**Files:**
- Modify: `F:\renderPLUGIN\src\render-notifier.maxpat`
- Add `filepicker`, `live.button` (test), filename display.

- [ ] **Step 1: Add filepicker button (cow emoji)**

At x=50, y=350:

```json
{
  "maxclass": "newobj",
  "text": "filepicker",
  "patching_rect": [50, 350, 100, 22],
  "id": "filepicker",
  "style": {
    "bgcolor": [248, 242, 255, 255],
    "activecolor": [255, 182, 193, 255],
    "bordercolor": [255, 182, 193, 255],
    "cornerradius": 5
  }
}
```

- [ ] **Step 2: Add test button (play + bunny)**

Next to filepicker (x=160, y=350):

```json
{
  "maxclass": "live.button",
  "text": "▶️🐰 Preview",
  "patching_rect": [160, 350, 100, 22],
  "id": "test_button",
  "style": {
    "bgcolor": [248, 242, 255, 255],
    "activecolor": [255, 182, 193, 255],
    "bordercolor": [255, 182, 193, 255],
    "cornerradius": 5
  }
}
```

- [ ] **Step 3: Add filename display**

Below filepicker (y=380):

```json
{
  "maxclass": "live.text",
  "text": "No sound selected",
  "patching_rect": [50, 380, 200, 22],
  "id": "filename_display",
  "style": {
    "bgcolor": [248, 242, 255, 255],
    "textcolor": [93, 93, 129, 255],
    "bordercolor": [255, 182, 193, 255],
    "cornerradius": 3
  }
}
```

- [ ] **Step 4: Connect filepicker to message and display**

Add connections:

```json
{ "patchline": ["filepicker", 0], "destination": ["msg_read", 0] },
{ "patchline": ["filepicker", 0], "destination": ["filename_display", 0] },
{ "patchline": ["test_button", 0], "destination": ["play", 0] }
```

- [ ] **Step 5: Commit**

```bash
git add src/render-notifier.maxpat
git commit -m "feat: add file browser and test button UI"
```

---

### Task 6: Implement Volume Slider and Mute Toggle

**Files:**
- Modify: `F:\renderPLUGIN\src\render-notifier.maxpat`
- Add `live.slider` (volume), `live.toggle` (mute cow emoji).

- [ ] **Step 1: Add volume slider**

Below filename display (y=420):

```json
{
  "maxclass": "live.slider",
  "text": "Volume",
  "patching_rect": [50, 420, 200, 22],
  "id": "volume_slider",
  "parameter": "volume",
  "range": [0, 100],
  "initial": 70,
  "style": {
    "bgcolor": [248, 242, 255, 255],
    "activecolor": [255, 182, 193, 255],
    "bordercolor": [255, 182, 193, 255],
    "cornerradius": 3
  }
}
```

- [ ] **Step 2: Add mute toggle (cow emoji)**

Below volume slider (y=450):

```json
{
  "maxclass": "live.toggle",
  "text": "🐮 Mute",
  "patching_rect": [50, 450, 80, 22],
  "id": "mute_toggle",
  "parameter": "mute",
  "style": {
    "bgcolor": [248, 242, 255, 255],
    "activecolor": [255, 182, 193, 255],
    "bordercolor": [255, 182, 193, 255],
    "cornerradius": 5
  }
}
```

- [ ] **Step 3: Map volume slider to gain~ (0‑100 → 0‑1)**

Add a `scale` object:

```json
{
  "maxclass": "newobj",
  "text": "scale 0 100 0 1",
  "patching_rect": [260, 420, 80, 22],
  "id": "scale"
}
```

Connect slider → scale → vol_float:

```json
{ "patchline": ["volume_slider", 0], "destination": ["scale", 0] },
{ "patchline": ["scale", 0], "destination": ["vol_float", 0] }
```

- [ ] **Step 4: Connect mute toggle to switch~**

Connect mute toggle to switch~’s right inlet (0 = unmuted, 1 = muted):

```json
{ "patchline": ["mute_toggle", 0], "destination": ["switch", 1] }
```

- [ ] **Step 5: Commit**

```bash
git add src/render-notifier.maxpat
git commit -m "feat: add volume slider and mute toggle UI"
```

---

### Task 7: Add pattrstorage for Persistence

**Files:**
- Modify: `F:\renderPLUGIN\src\render-notifier.maxpat`
- Add `pattrstorage`, `pattr` bindings, and parameter names.

- [ ] **Step 1: Add pattrstorage object**

Place at bottom right (x=700, y=500):

```json
{
  "maxclass": "newobj",
  "text": "pattrstorage",
  "patching_rect": [700, 500, 80, 22],
  "id": "pattrstorage",
  "parameter": "pattrstorage"
}
```

- [ ] **Step 2: Add pattr objects for each UI element**

Bind `enable_toggle`, `volume_slider`, `mute_toggle`, and filename display:

```json
{
  "maxclass": "newobj",
  "text": "pattr enable",
  "patching_rect": [650, 100, 60, 22],
  "id": "pattr_enable"
},
{
  "maxclass": "newobj",
  "text": "pattr volume",
  "patching_rect": [260, 400, 60, 22],
  "id": "pattr_volume"
},
{
  "maxclass": "newobj",
  "text": "pattr mute",
  "patching_rect": [130, 450, 60, 22],
  "id": "pattr_mute"
},
{
  "maxclass": "newobj",
  "text": "pattr filename",
  "patching_rect": [260, 380, 60, 22],
  "id": "pattr_filename"
}
```

- [ ] **Step 3: Connect pattr objects to their UI counterparts**

Wire each pattr to the UI element's parameter inlet:

```json
{ "patchline": ["pattr_enable", 0], "destination": ["enable_toggle", 1] },
{ "patchline": ["pattr_volume", 0], "destination": ["volume_slider", 1] },
{ "patchline": ["pattr_mute", 0], "destination": ["mute_toggle", 1] },
{ "patchline": ["pattr_filename", 0], "destination": ["filename_display", 1] }
```

- [ ] **Step 4: Configure pattrstorage to save to Live’s preset system**

Add attribute to pattrstorage:

```json
{
  "maxclass": "newobj",
  "text": "pattrstorage",
  "patching_rect": [700, 500, 80, 22],
  "id": "pattrstorage",
  "parameter": "pattrstorage",
  "savestate": 1,
  "clientwindow": 0,
  "autopopulate": 1,
  "showeditor": 0
}
```

- [ ] **Step 5: Commit**

```bash
git add src/render-notifier.maxpat
git commit -m "feat: add pattrstorage for persistent settings"
```

---

### Task 8: Apply Cute Styling and Polish

**Files:**
- Modify: `F:\renderPLUGIN\src\render-notifier.maxpat`
- Add title, adjust colors, add border, set rounded corners.

- [ ] **Step 1: Add title with bunny and cow emojis**

Place at top left (x=50, y=10):

```json
{
  "maxclass": "live.text",
  "text": "🐰 Render Notifier 🐮",
  "patching_rect": [50, 10, 200, 30],
  "id": "title",
  "style": {
    "bgcolor": [248, 242, 255, 255],
    "textcolor": [93, 93, 129, 255],
    "bordercolor": [255, 182, 193, 255],
    "borderthickness": 5,
    "cornerradius": 10
  }
}
```

- [ ] **Step 2: Apply pastel colors to all UI elements**

Iterate through each UI box and set style attributes (example for volume_slider):

```json
"style": {
  "bgcolor": [248, 242, 255, 255],
  "activecolor": [255, 182, 193, 255],
  "bordercolor": [255, 182, 193, 255],
  "cornerradius": 5
}
```

- [ ] **Step 3: Add background panel with rounded border**

Create a `panel` or `live.panel` behind UI elements:

```json
{
  "maxclass": "panel",
  "patching_rect": [40, 0, 760, 550],
  "id": "background",
  "style": {
    "bgcolor": [248, 242, 255, 255],
    "bordercolor": [255, 182, 193, 255],
    "borderthickness": 5,
    "cornerradius": 10
  }
}
```

- [ ] **Step 4: Set status emoji to change color when active**

Connect observer output to `status_text`'s color (optional advanced):

```json
{
  "maxclass": "newobj",
  "text": "switch",
  "patching_rect": [450, 80, 40, 22],
  "id": "color_switch"
}
```

Wire observer → color_switch → status_text color inlet.

- [ ] **Step 5: Final commit**

```bash
git add src/render-notifier.maxpat
git commit -m "style: apply cute pastel theme and emojis"
```

---

### Task 9: Package as Max for Live Device (.amxd) and Test

**Files:**
- Create: `F:\renderPLUGIN\Render Notifier.amxd`
- Create: `F:\renderPLUGIN\tests\test_instructions.md`

- [ ] **Step 1: Save Max patch as .amxd**

Open `src/render-notifier.maxpat` in Max 8.
File → Save As → Choose location `F:\renderPLUGIN\`.
Set file type to “Max for Live Device (*.amxd)”.
Name: `Render Notifier.amxd`.

- [ ] **Step 2: Write test instructions**

Create `tests/test_instructions.md`:

```markdown
# Test Instructions for Render Notifier

## Setup
1. Drop `Render Notifier.amxd` into any Ableton Live track.
2. Ensure audio output is configured.

## Test Cases
1. **Render Detection**
   - Start a render (File → Export Audio/Video).
   - Observe bunny emoji 🐰 lights up during render.
   - When render finishes, notification sound should play (if enabled).
2. **File Browser**
   - Click 🐮 Choose Sound → select a WAV/MP3 file.
   - Filename appears below button.
3. **Test Button**
   - Click ▶️🐰 Preview → sound plays immediately.
4. **Volume Control**
   - Adjust slider → volume changes proportionally.
5. **Mute Toggle**
   - Toggle mute → sound does not play (or is silent).
6. **Enable Toggle**
   - Turn off enable → no sound on render completion.
   - Turn on → sound resumes.
7. **Persistence**
   - Adjust settings, save Live set, close, reopen.
   - Settings should be retained.
```

- [ ] **Step 3: Commit**

```bash
git add "Render Notifier.amxd" tests/test_instructions.md
git commit -m "feat: package as .amxd and add test instructions"
```

---

## Open Questions & Notes

1. **Live API Property Path:** The exact property `live_set.is_rendering` may need verification. If that fails, try `live_set.rendering` or use `live.path` to locate the correct attribute.
2. **Audio File Support:** `play~` supports WAV/AIFF natively; MP3 requires QuickTime on system.
3. **Performance:** The observer runs continuously but lightweight; no noticeable CPU impact expected.

## Execution Handoff

Plan complete and saved to `docs/superpowers/plans/2026-03-26-render-notifier-implementation.md`. Two execution options:

**1. Subagent-Driven (recommended)** - I dispatch a fresh subagent per task, review between tasks, fast iteration

**2. Inline Execution** - Execute tasks in this session using executing-plans, batch execution with checkpoints

Which approach?
