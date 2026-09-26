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

After every completed code change:

1. Update `changelog.md` under `Unreleased` before handing the work back. Do
   not treat the code change as complete until its changelog entry exists.
2. Inspect every modified section and its cleanup path.
3. Check for duplicate Rayfield flags and stale Build identifiers.
4. Run available Luau validation. If no Luau runtime is installed, state that
   limitation and perform a focused structural review instead.
5. Review the current branch, repository status, and diff.

## Git and GitHub coaching

Do not commit, push, merge, or open a pull request automatically after a code
change. At the end of each completed change:

1. Summarize the working-tree state and name the current branch.
2. Give the user one short Git or GitHub tip relevant to the current state. As
   the project evolves, explain concepts such as working tree, staging, commit,
   branch, push, pull request, and merge in context rather than as a long generic
   tutorial.
3. Propose a concise commit message when there are uncommitted changes.
4. Ask whether the user wants to leave the changes uncommitted, commit them,
   commit and push them, or merge a feature branch.

Only offer a merge when a separate branch actually exists. If work is already
on `main`, explain that there is nothing to merge and suggest using a feature
branch for the next substantial change. Never interpret approval to commit as
approval to push or merge; confirm each broader repository action.

On this Windows machine, if `git` is not yet visible in the current process
PATH, use `C:\Program Files\Git\cmd\git.exe` directly.

## Handoff

Report the changed project files, observable behavior, validation performed,
runtime-only checks that still need to be performed in Roblox, and the current
Git state. Finish with the Git/GitHub tip and repository-action question.
