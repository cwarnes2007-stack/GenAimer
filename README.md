# GenAimer

GenAimer is a Roblox Lua interface project with configurable visual overlays,
aim-assist controls, movement utilities, profiles, diagnostics, and cleanup.

## Main file

- `ESP_Rayfield_Build14_StartupHardened.lua` — current canonical source.

## Project notes

- Make changes in this repository folder, not the Downloads copy.
- The Rayfield profile system uses the executor's filesystem APIs when they are
  available and falls back to an in-memory session backup.
- The script includes an unload path that restores cursor, camera, lighting,
  movement, collision, and GUI state.

## Repository

Remote: <https://github.com/cwarnes2007-stack/GenAimer>
