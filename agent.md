# Agent Guide

This file defines the working conventions for automated contributors to the
GenAimer project.

## Canonical project location

- Project root: `C:\Users\xboxg\Documents\GitHub\Roblox Aim Script`
- Main source: `ESP_Rayfield_Build14_StartupHardened.lua`
- Remote repository: `https://github.com/cwarnes2007-stack/GenAimer`
- Do not treat copies in Downloads as canonical or edit them unless explicitly
  requested.

## Working rules

1. Preserve existing user settings and unrelated changes.
2. Keep new options in the central `Config` table and give every Rayfield
   control a stable, unique flag.
3. Any temporary change to camera, lighting, cursor, collision, movement, or
   GUI state must be restored by panic mode and `unload()`.
4. Clear target caches when a setting changes the target-selection criteria.
5. Keep render-step work small. Cache expensive target searches and update
   visual diagnostics at a lower frequency where possible.
6. Support both R6 and R15 characters and tolerate delayed character loading.
7. Keep the script usable when optional executor APIs such as file access or
   hidden UI containers are unavailable.
8. Keep line-of-sight validation enabled. Do not add anti-cheat bypasses or
   deliberate targeting through cover.
9. Update `changelog.md` for every user-visible or behavior-changing edit.
10. Store all project files inside the canonical project root.

## Style conventions

- Use Luau syntax and Roblox APIs consistently.
- Prefer descriptive local names and small helper functions.
- Use `pcall` only around optional or executor-dependent behavior; avoid hiding
  ordinary logic errors.
- Use named render-step bindings and unbind every binding during cleanup.
- Keep UI wording concise and ensure loaded values are reflected by controls.
- Avoid non-ASCII symbols where executor encoding support is uncertain.

## Validation checklist

Before handing off a change, verify:

- The interface can still initialize if profile storage is unavailable.
- Aim assist remains disabled until enabled and still requires its activation
  input.
- Standard and Legit modes preserve and restore their expected values.
- Panic mode disables overlays and movement changes, then restores the saved
  state.
- Unload disconnects connections, unbinds render steps, destroys GUIs, and
  restores camera, lighting, cursor, movement, and collision state.
- New controls save and load through stable Rayfield flags.
- The performance HUD remains readable at common viewport sizes.

## Versioning

The current source still identifies itself as Build 14. A future structural
rewrite or module split should be released as Build 15 rather than silently
changing the Build 14 identity.
