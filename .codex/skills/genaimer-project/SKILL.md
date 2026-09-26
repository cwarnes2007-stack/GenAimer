---
name: genaimer-project
description: Maintain and extend the GenAimer Roblox Luau project, including its Rayfield interface, configuration, diagnostics, character tracking, cleanup, and project documentation. Use for changes inside the GenAimer repository; do not use for unrelated Roblox or Luau projects.
---

# GenAimer Project

Work from the repository root and treat
`ESP_Rayfield_Build14_StartupHardened.lua` as the canonical source. Do not edit
copies in Downloads unless the user explicitly requests it.

## Before editing

1. Read `agent.md` completely for project invariants and validation rules.
2. Read the relevant section of `changelog.md` to avoid duplicating completed
   work.
3. Inspect the current implementation around every affected subsystem. This is
   a single large Luau file with shared state, so nearby callbacks and cleanup
   paths often need coordinated changes.

## Implementation invariants

- Add user-configurable values to the central `Config` table and give Rayfield
  controls stable, unique flags.
- Keep controls synchronized when presets, profiles, or mode switches modify
  values programmatically.
- Preserve the Standard-mode snapshot when Legit mode temporarily applies its
  recommended values.
- Reset target and scan caches whenever target-selection criteria change.
- Keep line-of-sight validation enabled; do not add anti-cheat bypasses or
  deliberate targeting through cover.
- Keep render-step callbacks lightweight. Cache full target searches and update
  diagnostics less frequently than camera motion.
- Support delayed character loading plus R6, R15, and reasonable custom-rig
  fallbacks.
- Any camera, lighting, cursor, movement, collision, connection, binding, or GUI
  state introduced by a feature must be restored by panic mode and `unload()`.
- Guard optional executor APIs and retain a usable fallback when they are
  unavailable.
- Store every project artifact inside the repository root.

## Workflow

Implement the smallest coherent change that satisfies the request. Reuse the
existing helpers and control registry before adding new abstractions. Preserve
unrelated user changes.

After a user-visible or behavior-changing edit:

1. Update `changelog.md` under `Unreleased`.
2. Inspect every modified section and its cleanup path.
3. Check for duplicate Rayfield flags and stale Build identifiers.
4. Run available Luau validation. If no Luau runtime is installed, state that
   limitation and perform a focused structural review instead.
5. Review repository status and diff. Commit or push only when the user has
   requested repository publication or clearly continued an existing publish
   workflow.

On this Windows machine, if `git` is not yet visible in the current process
PATH, use `C:\Program Files\Git\cmd\git.exe` directly.

## Handoff

Report the changed project files, the observable behavior, validation performed,
and any runtime-only checks that still need to be performed in Roblox.
