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

## Troubleshooting

### Notification not triggering

The device uses `live_set.is_rendering` to detect render completion. If this doesn't work on your Ableton Live version:
1. Open the device in Max 8 (Edit button in Live)
2. Find the `live.observer is_rendering` object
3. Try changing `is_rendering` to `rendering` or other property names
4. Test with a render to verify detection
