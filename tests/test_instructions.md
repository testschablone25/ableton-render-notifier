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
