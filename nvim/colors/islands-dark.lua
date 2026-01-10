 -- Islands Dark colorscheme for Neovim
-- Ported from JetBrains IDEs Islands Dark theme
--
-- Installation:
-- 1. Save to ~/.config/nvim/colors/islands-dark.lua
-- 2. In your init.lua: vim.cmd("colorscheme islands-dark")

local M = {}

-- Palette
local c = {
  bg = "#191a1c",
  bg_float = "#1e1f22",
  bg_highlight = "#1f2024",
  bg_visual = "#2d543f",
  bg_search = "#114957",
  bg_popup = "#27282b",
  fg = "#bcbec4",
  fg_dark = "#a1a3ab",
  fg_gutter = "#4b5059",
  comment = "#7a7e85",
  -- Accent colors
  red = "#f75464",
  red_bright = "#fa6675",
  green = "#6aab73",
  green_bright = "#73bd79",
  yellow = "#d5b778",
  yellow_bright = "#e0bb65",
  blue = "#56a8f5",
  blue_bright = "#70aeff",
  magenta = "#c77dbb",
  magenta_bright = "#b189f5",
  cyan = "#2aacb8",
  cyan_bright = "#56c1d6",
  orange = "#cf8e6d",
  -- Semantic
  error = "#f75464",
  warning = "#f2c55c",
  info = "#56a8f5",
  hint = "#2aacb8",
  added = "#549159",
  changed = "#375fad",
  deleted = "#868a91",
  -- UI
  border = "#393b40",
  selection = "#214283",
  cursor_line = "#1f2024",
  line_nr = "#4b5059",
  line_nr_cur = "#a1a3ab",
  fold = "#393b40",
  none = "NONE",
}

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "islands-dark"

  local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Editor
  hl("Normal", { fg = c.fg, bg = c.bg })
  hl("NormalFloat", { fg = c.fg, bg = c.bg_popup })
  hl("NormalNC", { fg = c.fg, bg = c.bg })
  hl("Cursor", { fg = c.bg, bg = c.fg })
  hl("CursorLine", { bg = c.cursor_line })
  hl("CursorColumn", { bg = c.cursor_line })
  hl("ColorColumn", { bg = c.bg_float })
  hl("LineNr", { fg = c.line_nr })
  hl("CursorLineNr", { fg = c.line_nr_cur })
  hl("SignColumn", { fg = c.fg_gutter, bg = c.bg })
  hl("VertSplit", { fg = c.border })
  hl("WinSeparator", { fg = c.border })
  hl("Folded", { fg = c.comment, bg = c.fold })
  hl("FoldColumn", { fg = c.fg_gutter })
  hl("StatusLine", { fg = c.fg, bg = c.bg_float })
  hl("StatusLineNC", { fg = c.comment, bg = c.bg_float })
  hl("TabLine", { fg = c.comment, bg = c.bg_float })
  hl("TabLineFill", { bg = c.bg })
  hl("TabLineSel", { fg = c.fg, bg = c.bg })
  hl("WinBar", { fg = c.fg, bg = c.bg })
  hl("WinBarNC", { fg = c.comment, bg = c.bg })
  hl("Pmenu", { fg = c.fg, bg = c.bg_popup })
  hl("PmenuSel", { bg = c.selection })
  hl("PmenuSbar", { bg = c.bg_float })
  hl("PmenuThumb", { bg = c.fg_gutter })
  hl("Visual", { bg = c.bg_visual })
  hl("VisualNOS", { bg = c.bg_visual })
  hl("Search", { bg = c.bg_search })
  hl("IncSearch", { fg = c.bg, bg = c.yellow })
  hl("CurSearch", { fg = c.bg, bg = c.orange })
  hl("MatchParen", { fg = c.fg, bg = "#43454a", bold = true })
  hl("NonText", { fg = c.fg_gutter })
  hl("SpecialKey", { fg = c.fg_gutter })
  hl("Whitespace", { fg = "#6f737a" })
  hl("EndOfBuffer", { fg = c.bg })
  hl("Directory", { fg = c.blue })
  hl("Conceal", { fg = c.comment })
  hl("ModeMsg", { fg = c.fg })
  hl("MoreMsg", { fg = c.green })
  hl("Question", { fg = c.blue })
  hl("WarningMsg", { fg = c.warning })
  hl("ErrorMsg", { fg = c.error })
  hl("Title", { fg = c.yellow, bold = true })
  hl("FloatBorder", { fg = c.border, bg = c.bg_popup })
  hl("WildMenu", { fg = c.fg, bg = c.selection })

  -- Syntax
  hl("Comment", { fg = c.comment, italic = true })
  hl("Constant", { fg = c.magenta })
  hl("String", { fg = c.green })
  hl("Character", { fg = c.green })
  hl("Number", { fg = c.cyan })
  hl("Boolean", { fg = c.orange })
  hl("Float", { fg = c.cyan })
  hl("Identifier", { fg = c.fg })
  hl("Function", { fg = c.blue })
  hl("Statement", { fg = c.orange })
  hl("Conditional", { fg = c.orange })
  hl("Repeat", { fg = c.orange })
  hl("Label", { fg = c.cyan_bright })
  hl("Operator", { fg = c.fg })
  hl("Keyword", { fg = c.orange })
  hl("Exception", { fg = c.orange })
  hl("PreProc", { fg = c.orange })
  hl("Include", { fg = c.orange })
  hl("Define", { fg = c.orange })
  hl("Macro", { fg = c.orange })
  hl("PreCondit", { fg = c.orange })
  hl("Type", { fg = c.fg })
  hl("StorageClass", { fg = c.orange })
  hl("Structure", { fg = c.orange })
  hl("Typedef", { fg = c.orange })
  hl("Special", { fg = c.orange })
  hl("SpecialChar", { fg = c.orange })
  hl("Tag", { fg = c.yellow })
  hl("Delimiter", { fg = c.fg })
  hl("SpecialComment", { fg = c.comment })
  hl("Debug", { fg = c.orange })
  hl("Underlined", { fg = c.blue, underline = true })
  hl("Ignore", { fg = c.comment })
  hl("Error", { fg = c.error })
  hl("Todo", { fg = "#8bb33d", italic = true })

  -- Treesitter
  hl("@variable", { fg = c.fg })
  hl("@variable.builtin", { fg = c.magenta })
  hl("@variable.parameter", { fg = c.fg })
  hl("@variable.member", { fg = c.magenta })
  hl("@constant", { fg = c.magenta, italic = true })
  hl("@constant.builtin", { fg = c.magenta, italic = true })
  hl("@constant.macro", { fg = c.magenta })
  hl("@module", { fg = c.fg })
  hl("@label", { fg = c.cyan_bright })
  hl("@string", { fg = c.green })
  hl("@string.escape", { fg = c.orange })
  hl("@string.regexp", { fg = "#42c3d4" })
  hl("@character", { fg = c.green })
  hl("@number", { fg = c.cyan })
  hl("@boolean", { fg = c.orange })
  hl("@float", { fg = c.cyan })
  hl("@function", { fg = c.blue })
  hl("@function.builtin", { fg = c.blue })
  hl("@function.call", { fg = c.blue })
  hl("@function.macro", { fg = c.blue })
  hl("@function.method", { fg = c.blue })
  hl("@function.method.call", { fg = c.blue })
  hl("@constructor", { fg = c.blue })
  hl("@operator", { fg = c.fg })
  hl("@keyword", { fg = c.orange })
  hl("@keyword.function", { fg = c.orange })
  hl("@keyword.operator", { fg = c.orange })
  hl("@keyword.return", { fg = c.orange })
  hl("@keyword.exception", { fg = c.orange })
  hl("@keyword.import", { fg = c.orange })
  hl("@keyword.conditional", { fg = c.orange })
  hl("@keyword.repeat", { fg = c.orange })
  hl("@punctuation.bracket", { fg = c.fg })
  hl("@punctuation.delimiter", { fg = c.fg })
  hl("@punctuation.special", { fg = c.fg })
  hl("@comment", { fg = c.comment, italic = true })
  hl("@comment.documentation", { fg = "#5f826b", italic = true })
  hl("@type", { fg = c.fg })
  hl("@type.builtin", { fg = c.orange })
  hl("@type.qualifier", { fg = c.orange })
  hl("@attribute", { fg = "#b3ae60" })
  hl("@property", { fg = c.magenta })
  hl("@tag", { fg = c.yellow })
  hl("@tag.attribute", { fg = c.fg })
  hl("@tag.delimiter", { fg = c.fg })
  hl("@markup.heading", { fg = c.yellow, bold = true })
  hl("@markup.link", { fg = c.blue, underline = true })
  hl("@markup.link.url", { fg = c.blue, underline = true })
  hl("@markup.raw", { fg = "#ced0d6", bg = "#26292c" })
  hl("@markup.strong", { bold = true })
  hl("@markup.italic", { italic = true })

  -- LSP Semantic Tokens
  hl("@lsp.type.namespace", { fg = c.fg })
  hl("@lsp.type.type", { fg = c.fg })
  hl("@lsp.type.class", { fg = c.fg })
  hl("@lsp.type.enum", { fg = c.fg })
  hl("@lsp.type.interface", { fg = c.fg })
  hl("@lsp.type.struct", { fg = c.fg })
  hl("@lsp.type.parameter", { fg = c.fg })
  hl("@lsp.type.variable", { fg = c.fg })
  hl("@lsp.type.property", { fg = c.magenta })
  hl("@lsp.type.function", { fg = c.blue })
  hl("@lsp.type.method", { fg = c.blue })
  hl("@lsp.type.macro", { fg = c.orange })
  hl("@lsp.type.decorator", { fg = "#b3ae60" })
  hl("@lsp.mod.static", { italic = true })
  hl("@lsp.mod.constant", { italic = true })

  -- Diagnostics
  hl("DiagnosticError", { fg = c.error })
  hl("DiagnosticWarn", { fg = c.warning })
  hl("DiagnosticInfo", { fg = c.info })
  hl("DiagnosticHint", { fg = c.hint })
  hl("DiagnosticUnderlineError", { sp = c.error, undercurl = true })
  hl("DiagnosticUnderlineWarn", { sp = c.warning, undercurl = true })
  hl("DiagnosticUnderlineInfo", { sp = c.info, undercurl = true })
  hl("DiagnosticUnderlineHint", { sp = c.hint, undercurl = true })
  hl("DiagnosticVirtualTextError", { fg = c.error, bg = "#402929" })
  hl("DiagnosticVirtualTextWarn", { fg = c.warning, bg = "#3d3520" })
  hl("DiagnosticVirtualTextInfo", { fg = c.info, bg = "#1e3a5f" })
  hl("DiagnosticVirtualTextHint", { fg = c.hint, bg = "#1a3b2d" })

  -- Git signs
  hl("GitSignsAdd", { fg = c.added })
  hl("GitSignsChange", { fg = c.changed })
  hl("GitSignsDelete", { fg = c.deleted })
  hl("DiffAdd", { bg = "#1a3b2d" })
  hl("DiffChange", { bg = "#1e3a5f" })
  hl("DiffDelete", { bg = "#402929" })
  hl("DiffText", { bg = "#2a5091" })

  -- Telescope
  hl("TelescopeNormal", { fg = c.fg, bg = c.bg_popup })
  hl("TelescopeBorder", { fg = c.border, bg = c.bg_popup })
  hl("TelescopeSelection", { bg = c.selection })
  hl("TelescopeMatching", { fg = c.yellow, bold = true })

  -- NvimTree / Neo-tree
  hl("NvimTreeNormal", { fg = c.fg, bg = c.bg })
  hl("NvimTreeFolderIcon", { fg = c.blue })
  hl("NvimTreeFolderName", { fg = c.fg })
  hl("NvimTreeOpenedFolderName", { fg = c.fg })
  hl("NvimTreeRootFolder", { fg = c.orange })
  hl("NvimTreeGitDirty", { fg = c.changed })
  hl("NvimTreeGitNew", { fg = c.added })
  hl("NvimTreeGitDeleted", { fg = c.deleted })
  hl("NeoTreeNormal", { fg = c.fg, bg = c.bg })
  hl("NeoTreeNormalNC", { fg = c.fg, bg = c.bg })

  -- Indent Blankline
  hl("IblIndent", { fg = "#323438" })
  hl("IblScope", { fg = "#4e5157" })

  -- Which-key
  hl("WhichKey", { fg = c.blue })
  hl("WhichKeyGroup", { fg = c.magenta })
  hl("WhichKeyDesc", { fg = c.fg })
  hl("WhichKeySeparator", { fg = c.comment })

  -- Lazy
  hl("LazyH1", { fg = c.bg, bg = c.blue, bold = true })
  hl("LazyButton", { fg = c.fg, bg = c.bg_float })
  hl("LazyButtonActive", { fg = c.bg, bg = c.blue })

  -- Cmp
  hl("CmpItemAbbr", { fg = c.fg })
  hl("CmpItemAbbrMatch", { fg = c.yellow, bold = true })
  hl("CmpItemAbbrMatchFuzzy", { fg = c.yellow })
  hl("CmpItemKind", { fg = c.magenta })
  hl("CmpItemMenu", { fg = c.comment })

  -- Notify
  hl("NotifyERRORBorder", { fg = c.error })
  hl("NotifyWARNBorder", { fg = c.warning })
  hl("NotifyINFOBorder", { fg = c.info })
  hl("NotifyDEBUGBorder", { fg = c.comment })
  hl("NotifyTRACEBorder", { fg = c.magenta })
  hl("NotifyERRORTitle", { fg = c.error })
  hl("NotifyWARNTitle", { fg = c.warning })
  hl("NotifyINFOTitle", { fg = c.info })
  hl("NotifyDEBUGTitle", { fg = c.comment })
  hl("NotifyTRACETitle", { fg = c.magenta })

  -- Mini
  hl("MiniStatuslineModeNormal", { fg = c.bg, bg = c.blue, bold = true })
  hl("MiniStatuslineModeInsert", { fg = c.bg, bg = c.green, bold = true })
  hl("MiniStatuslineModeVisual", { fg = c.bg, bg = c.magenta, bold = true })
  hl("MiniStatuslineModeReplace", { fg = c.bg, bg = c.red, bold = true })
  hl("MiniStatuslineModeCommand", { fg = c.bg, bg = c.orange, bold = true })

  -- Lualine (set via lualine config, but these help)
  hl("lualine_a_normal", { fg = c.bg, bg = c.blue, bold = true })
  hl("lualine_a_insert", { fg = c.bg, bg = c.green, bold = true })
  hl("lualine_a_visual", { fg = c.bg, bg = c.magenta, bold = true })
  hl("lualine_a_replace", { fg = c.bg, bg = c.red, bold = true })
  hl("lualine_a_command", { fg = c.bg, bg = c.orange, bold = true })
  hl("lualine_b_normal", { fg = c.fg, bg = c.bg_float })
  hl("lualine_c_normal", { fg = c.comment, bg = c.bg })

  -- FZF
  hl("FzfLuaNormal", { fg = c.fg, bg = c.bg_popup })
  hl("FzfLuaBorder", { fg = c.border, bg = c.bg_popup })
  hl("FzfLuaTitle", { fg = c.yellow, bg = c.bg_popup, bold = true })
  hl("FzfLuaPreviewNormal", { fg = c.fg, bg = c.bg })
  hl("FzfLuaPreviewBorder", { fg = c.border, bg = c.bg })
  hl("FzfLuaCursor", { fg = c.bg, bg = c.fg })
  hl("FzfLuaCursorLine", { bg = c.selection })
  hl("FzfLuaSearch", { fg = c.yellow, bold = true })
  hl("FzfLuaHeaderText", { fg = c.comment })
  hl("FzfLuaHeaderBind", { fg = c.blue })
end

-- Lualine theme (export for use in lualine config)
M.lualine = {
  normal = {
    a = { fg = c.bg, bg = c.blue, gui = "bold" },
    b = { fg = c.fg, bg = c.bg_float },
    c = { fg = c.comment, bg = c.bg },
  },
  insert = {
    a = { fg = c.bg, bg = c.green, gui = "bold" },
  },
  visual = {
    a = { fg = c.bg, bg = c.magenta, gui = "bold" },
  },
  replace = {
    a = { fg = c.bg, bg = c.red, gui = "bold" },
  },
  command = {
    a = { fg = c.bg, bg = c.orange, gui = "bold" },
  },
  inactive = {
    a = { fg = c.comment, bg = c.bg_float },
    b = { fg = c.comment, bg = c.bg_float },
    c = { fg = c.comment, bg = c.bg },
  },
}

M.setup()

return M
