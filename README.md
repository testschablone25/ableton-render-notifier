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

If the rendering indicator doesn't work on your version of Live, the `is_rendering` property may not be available. Try changing the property in the `live.observer` object to a different property that's available in your Live version, or use `live.path` to explicitly set the path before the observer.
