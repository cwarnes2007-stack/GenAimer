# Agent Guide

This file defines the working conventions for automated contributors to the
GenAimer project.

## Canonical project location

- Project root: `G:\My Drive\github\Roblox Aim Script`
- Main source: `GenAimer.lua`
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
9. Update `changelog.md` under `Unreleased` whenever a code change is
   completed. The code change is not complete until the entry exists.
10. Store all project files inside the canonical project root.
11. Do not commit, push, merge, or open a pull request automatically. Explain
    the current Git state, share a short contextual GitHub tip, and ask the user
    which repository action they want next.

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
- `changelog.md` describes every completed code change.
- The user has been asked before any commit, push, or merge operation.

## Versioning

The live source uses the `GenAimer` branding; Build 14 remains historical
context in `changelog.md`. A future structural rewrite or module split should
be documented as a new release rather than silently changing its identity.
