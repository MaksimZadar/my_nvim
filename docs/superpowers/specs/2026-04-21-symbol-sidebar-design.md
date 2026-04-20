---
date: 2026-04-21
topic: "Symbol Sidebar"
status: validated
---

# Symbol Sidebar Design

## Problem Statement

The config has no persistent symbol outline sidebar. Symbol navigation currently requires `<Leader>ls` (Telescope popup) which is transient. For large C# files with many methods and properties, a persistent right-side sidebar is more ergonomic for navigation.

## Constraints

- Must not conflict with existing `<Leader>ls` (Telescope document symbols popup)
- Must open on the **right** side (not left — nvim-tree already owns the left)
- Keybind: `<Leader>lS` (capital S)
- Must work with the existing `csharp_ls` LSP server
- Minimal config — no overengineering

## Approach

Use **`hedyhli/outline.nvim`** — a purpose-built LSP symbol outline sidebar.

Rejected alternatives:
- `stevearc/aerial.nvim` — heavier, more config, overkill for this use case
- `simrat39/symbols-outline.nvim` — older, less maintained, superseded by outline.nvim

## Architecture

Two files are modified:

1. `lua/plugins/init.lua` — add the outline.nvim plugin spec
2. `lua/mappings/lsp.lua` — add the `<Leader>lS` toggle keymap

No new files needed.

## Components

**outline.nvim plugin spec:**
- `cmd = { "Outline", "OutlineOpen" }` for lazy loading
- `opts` block configures:
  - `window.position = "right"` — sidebar on the right
  - `window.width = 30` — consistent with nvim-tree width
  - `outline_window.auto_close = true` — close when last window
  - `outline_window.auto_jump = false` — don't jump on cursor move (only on Enter)
  - `outline_window.show_cursorline = true` — highlight current symbol

**Keymap in `lua/mappings/lsp.lua`:**
- `<Leader>lS` → `:Outline!<CR>` — toggle sidebar (`:Outline!` focuses outline on open, returns to editor if refocusing, closes if already focused)
- desc: `"Toggle symbol outline"`

**which-key:** No changes needed — `<Leader>l` group is already registered as "Language Tools".

## Data Flow

1. User opens a buffer with an attached LSP (e.g., `.cs` file with `csharp_ls`)
2. User presses `<Leader>lS`
3. outline.nvim sends `textDocument/documentSymbol` request to LSP
4. LSP returns symbol tree (classes, methods, properties, fields, etc.)
5. Sidebar renders the tree on the right
6. As cursor moves in the buffer, the sidebar highlights the enclosing symbol
7. Pressing `Enter` on a sidebar entry jumps the cursor to that symbol in the buffer
8. Pressing `<Leader>lS` again closes the sidebar

## Error Handling

- No LSP attached: outline.nvim shows an empty/unavailable state — no errors thrown
- Toggle is safe to call at any time regardless of filetype

## Testing Strategy

1. Open a `.cs` file (or any LSP-backed file)
2. Press `<Leader>lS` — sidebar should appear on the right listing symbols
3. Move cursor in buffer — sidebar should highlight the current symbol
4. Press `Enter` on a sidebar symbol — cursor should jump to that symbol
5. Press `<Leader>lS` again — sidebar should close
6. Press `<Leader>ls` (lowercase) — Telescope popup should still work unchanged
7. Open a plain text file, press `<Leader>lS` — should show empty state, no errors

## Open Questions

None.
