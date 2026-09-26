# Changelog

All notable changes to GenAimer are documented here.

## Unreleased

### Added

- Added a smoother Legit aim feel with configurable target grace,
  acceleration, and maximum turn speed controls.
- Added repository documentation and ignore rules.
- Added this agent guide and project changelog.
- Added the project-local `$genaimer-project` Codex skill with UI metadata,
  implementation invariants, validation guidance, and repository workflow.
- Added a redesigned performance monitor with:
  - Padded metric cards for FPS, ping, memory, and session duration.
  - Color-coded FPS and ping status.
  - A gradient accent, live-status badge, border, and drop shadow.
  - Session formatting that supports hours.

### Changed

- Legit mode now eases into capped camera movement and preserves its target
  candidate briefly through transient scan misses.
- Updated the agent guide to point to the active Google Drive repository path.
- Moved the canonical source into the project repository folder.
- Kept the Downloads copy as a non-canonical backup.
- Updated the project skill and agent guide to require a changelog entry after
  every completed code change, teach GitHub concepts in context, and request
  confirmation before commits, pushes, or merges.

## Build 14 - Startup Hardened

### Added

- Rayfield Gen2 startup fallback and visible bootstrap error reporting.
- Standard and Legit aim modes with automatic setting preservation.
- Recommended Standard and Legit aim presets.
- Configurable aim follow speed, reaction time, front cone, and target scan
  interval.
- Cached target scanning with smooth per-frame target revalidation.
- More reliable character registration and recovery for delayed character
  loading.
- Correct handling of neutral players in games without Roblox Teams.
- Session config backup when executor file storage is unavailable.
- Noclip with collision restoration on disable, panic, and unload.
- Custom cursor layering through a high-priority or hidden UI container.
- Crosshair editor, performance diagnostics, spectating, FOV control, movement
  controls, panic mode, and full cleanup.

### Changed

- Retuned Legit mode for faster and more reliable acquisition.
- Improved target-part fallbacks for custom character rigs.
- Cached aim raycast parameters to reduce repeated allocation.
- Weapon presets now include aim follow speed.
- Save and load controls now retain an in-memory fallback.

### Fixed

- Fixed every neutral player being classified as a teammate through the default
  TeamColor.
- Fixed missed targets when character roots load later than the player event.
- Improved restoration of movement, collision, cursor, lighting, and GUI state.
