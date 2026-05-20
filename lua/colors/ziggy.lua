local M = {}

local vim = vim
local g = vim.g
local highlight = vim.api.nvim_set_hl

vim.cmd.highlight 'clear'
if vim.fn.exists 'syntax_on' then vim.cmd.syntax 'reset' end

vim.o.termguicolors = true

local is_dark = vim.o.background == 'dark'

function ToggleTheme()
  is_dark = not is_dark

  if is_dark then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end

  M.load()
end


-- Dark palette
local dark_palette = {
  none = 'NONE',
  bg = '#1e1e2e',
  white = '#cdd6f4',
  grey0 = '#313244',
  grey1 = '#45475a',
  grey89 = '#cdd6f4',
  grey70 = '#bac2de',
  grey62 = '#a6adc8',
  grey58 = '#9399b2',
  grey50 = '#888888',
  grey39 = '#6c7086',
  grey30 = '#585b70',
  grey27 = '#45475a',
  grey23 = '#313244',
  grey18 = '#282838',
  grey15 = '#1e1e2e',
  grey11 = '#181825',
  grey7 = '#11111b',
  red = '#f38ba8',
  dark_red = '#f38ba8',
  green = '#a6e3a1',
  dark_green = '#a6e3a1',
  yellow = '#f9e2af',
  dark_yellow = '#f9e2af',
  blue = '#89b4fa',
  dark_blue = '#89b4fa',
  magenta = '#f5c2e7',
  dark_magenta = '#f5c2e7',
  cyan = '#94e2d5',
  dark_cyan = '#94e2d5',
  orange = '#fab387',
}

-- Light palette
local light_palette = {
  none = 'NONE',
  bg = '#f5f5f5',
  white = '#1e1e2e',
  grey0 = '#e0e0e0',
  grey1 = '#d0d0d0',
  grey89 = '#1e1e2e',
  grey70 = '#2a2a3a',
  grey62 = '#3a3a4a',
  grey58 = '#4a4a5a',
  grey50 = '#5a5a6a',
  grey39 = '#7a7a8a',
  grey30 = '#8a8a9a',
  grey27 = '#9a9aa0',
  grey23 = '#a0a0a8',
  grey18 = '#b0b0b8',
  grey15 = '#c0c0c8',
  grey11 = '#d0d0d8',
  grey7 = '#e0e0e8',
  red = '#f38ba8',
  dark_red = '#e06c75',
  green = '#a6e3a1',
  dark_green = '#58a668',
  yellow = '#f9e2af',
  dark_yellow = '#d19a66',
  blue = '#89b4fa',
  dark_blue = '#61afef',
  magenta = '#f5c2e7',
  dark_magenta = '#c678dd',
  cyan = '#94e2d5',
  dark_cyan = '#569cd6',
  orange = '#fab387',
}

function ApplyTheme()
  local p = is_dark and dark_palette or light_palette

  if g.ziggy_terminal_colors ~= false and g.starlightTerminalColors ~= false then
    g.terminal_color_0 = p.grey0
    g.terminal_color_1 = p.red
    g.terminal_color_2 = p.green
    g.terminal_color_3 = p.yellow
    g.terminal_color_4 = p.blue
    g.terminal_color_5 = p.magenta
    g.terminal_color_6 = p.cyan
    g.terminal_color_7 = p.white
    g.terminal_color_8 = p.grey58
    g.terminal_color_9 = p.dark_red
    g.terminal_color_10 = p.dark_cyan
    g.terminal_color_11 = p.dark_yellow
    g.terminal_color_12 = p.dark_blue
    g.terminal_color_13 = p.dark_magenta
    g.terminal_color_14 = p.green
    g.terminal_color_15 = p.grey89
  end

  local groups = {
    Normal = { bg = p.bg, fg = p.white },
    NormalNC = { bg = p.bg, fg = p.grey70 },
    ModeMsg = { fg = p.grey62 },
    Comment = { fg = p.grey58, italic = true },
    Function = { fg = p.magenta, bold = true },
    String = { fg = p.green },
    Boolean = { fg = p.red },
    Identifier = { fg = p.grey89 },
    Title = { fg = p.cyan },
    StorageClass = { fg = p.white, bold = true },
    Type = { fg = p.cyan },
    Constant = { fg = p.red },
    Number = { fg = p.red },
    Character = { fg = p.cyan },
    Exception = { fg = p.white, bold = true },
    PreProc = { fg = p.orange },
    Define = { link = 'PreProc' },
    Label = { fg = p.grey89 },
    NonText = { fg = p.magenta },
    Operator = { fg = p.grey89 },
    Conditional = { fg = p.white, bold = true },
    Keyword = { fg = p.white, bold = true },
    Repeat = { fg = p.white, bold = true },
    Search = { bg = p.grey1, fg = p.grey89 },
    CurSearch = { bg = p.magenta, fg = p.bg },
    IncSearch = { bg = p.grey62, fg = p.bg },
    Special = { fg = p.cyan },
    Statement = { fg = p.white, bold = true },
    Structure = { fg = p.white, bold = true },
    StatusLine = { bg = p.grey23, fg = p.grey89 },
    StatusLineNC = { bg = p.grey23, fg = p.grey58 },
    TabLine = { bg = p.grey18, fg = p.grey62 },
    TabLineSel = { bg = p.grey15, fg = p.yellow },
    TabLineFill = { bg = p.grey18, fg = p.grey18 },
    VertSplit = { bg = p.bg, fg = p.grey23 },
    Visual = { bg = p.grey1, fg = p.bg },
    VisualNOS = { bg = p.grey0, fg = p.white },
    Error = { fg = p.red },
    ErrorMsg = { fg = p.red },
    WarningMsg = { fg = p.yellow },
    Pmenu = { bg = p.grey23, fg = p.grey89 },
    PmenuSel = { bg = p.dark_green, fg = p.bg },
    PmenuSbar = { bg = p.grey15 },
    PmenuThumb = { bg = p.grey50 },
    WildMenu = { bg = p.dark_green, fg = p.grey89 },
    SpellBad = { undercurl = true, sp = p.red },
    SpellCap = { undercurl = true, sp = p.yellow },
    SpellRare = { undercurl = true, sp = p.green },
    SpellLocal = { undercurl = true, sp = p.blue },
    Question = { fg = p.green },
    MoreMsg = { fg = p.red },
    LineNr = { fg = p.grey30 },
    Cursor = { fg = p.bg, bg = p.blue },
    lCursor = { fg = p.bg, bg = p.grey62 },
    CursorLineNr = { bg = p.grey11, fg = p.grey58 },
    CursorColumn = { bg = p.grey11 },
    CursorLine = { bg = p.grey11 },
    Folded = { bg = p.grey11, fg = p.green },
    FoldColumn = { bg = p.grey18, fg = p.green },
    SignColumn = { bg = p.bg, fg = p.green },
    Todo = { bg = p.grey15, fg = p.yellow },
    SpecialKey = { fg = p.cyan },
    MatchParen = { underline = true },
    Ignore = { fg = p.blue },
    Underlined = { fg = p.dark_cyan },
    QuickFixLine = { bg = p.grey11 },
    Delimiter = { fg = p.grey89 },
    qfFileName = { fg = p.dark_cyan },
    ColorColumn = { bg = p.grey7 },
    Conceal = { bg = p.none, fg = p.grey70 },
    DiffAdd = { fg = p.green },
    DiffChange = { fg = p.magenta },
    DiffDelete = { fg = p.red },
    DiffText = { bg = p.cyan, fg = p.bg },
    Whitespace = { fg = p.grey0 },
    TermCursor = { bg = p.grey62, fg = p.bg },
    NormalFloat = { bg = p.grey23, fg = p.grey89 },
    FloatBorder = { bg = p.bg, fg = p.grey70 },
    FloatTitle = { bg = p.grey23, fg = p.grey89 },
    WinBar = { bg = p.grey15, fg = p.white },
    WinBarNC = { bg = p.grey15, fg = p.grey62 },
    WinSeparator = { link = 'VertSplit' },
  }

  local ziggy_groups = {
    ZiggyVisual = { bg = p.grey0 },
    ZiggyWhite = { fg = p.white },
    ZiggyGrey0 = { fg = p.grey0 },
    ZiggyGrey1 = { fg = p.grey1 },
    ZiggyGrey89 = { fg = p.grey89 },
    ZiggyGrey70 = { fg = p.grey70 },
    ZiggyGrey62 = { fg = p.grey62 },
    ZiggyGrey58 = { fg = p.grey58 },
    ZiggyGrey50 = { fg = p.grey50 },
    ZiggyGrey39 = { fg = p.grey39 },
    ZiggyGrey30 = { fg = p.grey30 },
    ZiggyGrey27 = { fg = p.grey27 },
    ZiggyGrey23 = { fg = p.grey23 },
    ZiggyGrey18 = { fg = p.grey18 },
    ZiggyGrey15 = { fg = p.grey15 },
    ZiggyGrey11 = { fg = p.grey11 },
    ZiggyGrey7 = { fg = p.grey7 },
    ZiggyDarkYellow = { fg = p.dark_yellow },
    ZiggyYellow = { fg = p.yellow },
    ZiggyRed = { fg = p.red },
    ZiggyDarkRed = { fg = p.dark_red },
    ZiggyGreen = { fg = p.green },
    ZiggyDarkGreen = { fg = p.dark_green },
    ZiggyDarkCyan = { fg = p.dark_cyan },
    ZiggyCyan = { fg = p.cyan },
    ZiggyBlue = { fg = p.blue },
    ZiggyDarkBlue = { fg = p.dark_blue },
    ZiggyDarkMagenta = { fg = p.dark_magenta },
    ZiggyMagenta = { fg = p.magenta },
    ZiggyOrange = { fg = p.orange },
    ZiggyUnderline = { underline = true },
    ZiggyNoCombine = { nocombine = true },
    ZiggyStatusLineMode = { bg = p.grey23, fg = p.grey89 },
    ZiggyBlueMode = { bg = p.blue, fg = p.grey11 },
    ZiggyDarkCyanMode = { bg = p.dark_cyan, fg = p.grey11 },
    ZiggyMagentaMode = { bg = p.magenta, fg = p.grey11 },
    ZiggyDarkRedMode = { bg = p.dark_red, fg = p.grey11 },
    ZiggyYellowMode = { bg = p.yellow, fg = p.grey11 },
    ZiggyCyanMode = { bg = p.cyan, fg = p.grey11 },
    ZiggyCurrentLine = { bg = p.grey15 },
    ZiggyDarkRedLine = { bg = p.grey18, fg = p.dark_red },
    ZiggyDarkCyanLine = { bg = p.grey18, fg = p.dark_cyan },
    ZiggyGrey58Line = { bg = p.grey11, fg = p.grey58 },
    ZiggyYellowLine = { bg = p.grey11, fg = p.yellow },
    ZiggyBlueLineActive = { bg = p.grey27, fg = p.blue },
    ZiggyRedLineActive = { bg = p.grey27, fg = p.red },
    ZiggyCyanLineActive = { bg = p.grey27, fg = p.cyan },
    ZiggyWhiteLineActive = { bg = p.grey27, fg = p.grey89 },
    ZiggyYellowLineActive = { bg = p.grey27, fg = p.yellow },
  }

  for name, spec in pairs(ziggy_groups) do
    highlight(0, name, spec)
  end
  for name, spec in pairs(groups) do
    highlight(0, name, spec)
  end

  local links = {
    healthSuccess = 'DiffAdd',
    healthHeadingChar = 'ZiggyBlue',
    helpHeader = 'ZiggyCyan',
    ['@boolean'] = 'Boolean',
    ['@attribute'] = 'ZiggyGrey89',
    ['@comment.error'] = 'ZiggyRed',
    ['@comment.note'] = 'ZiggyGrey58',
    ['@comment.ok'] = 'ZiggyGreen',
    ['@comment.todo'] = 'Todo',
    ['@comment.warning'] = 'ZiggyYellow',
    ['@constant'] = 'Constant',
    ['@constant.builtin'] = 'Constant',
    ['@constant.macro'] = 'ZiggyDarkMagenta',
    ['@constructor'] = 'ZiggyGreen',
    ['@diff.delta'] = 'DiffChange',
    ['@diff.minus'] = 'DiffDelete',
    ['@diff.plus'] = 'DiffAdd',
    ['@function.builtin'] = 'ZiggyOrange',
    ['@function.call'] = 'ZiggyGrey89',
    ['@function.macro'] = 'ZiggyGrey89',
    ['@function.method'] = 'ZiggyGrey89',
    ['@function.method.call'] = 'ZiggyGrey89',
    ['@keyword.conditional'] = 'Conditional',
    ['@keyword.directive'] = 'PreProc',
    ['@keyword.directive.define'] = 'Define',
    ['@keyword.import'] = 'ZiggyOrange',
    ['@keyword.operator'] = 'ZiggyGrey89',
    ['@keyword.repeat'] = 'Repeat',
    ['@keyword.storage'] = 'StorageClass',
    ['@markup.environment'] = 'ZiggyDarkMagenta',
    ['@markup.environment.name'] = 'ZiggyDarkCyan',
    ['@markup.link'] = 'ZiggyCyan',
    ['@markup.link.text'] = 'ZiggyYellow',
    ['@markup.link.label'] = 'ZiggyGreen',
    ['@markup.list'] = 'ZiggyBlue',
    ['@markup.list.checked'] = 'ZiggyCyan',
    ['@markup.list.unchecked'] = 'ZiggyBlue',
    ['@markup.math'] = 'ZiggyBlue',
    ['@markup.quote'] = 'ZiggyMagenta',
    ['@markup.raw'] = 'ZiggyGreen',
    ['@markup.strong'] = 'ZiggyRed',
    ['@module'] = 'ZiggyWhite',
    ['@module.builtin'] = 'ZiggyGreen',
    ['@parameter.builtin'] = 'ZiggyRed',
    ['@property'] = 'ZiggyGrey89',
    ['@string.documentation'] = 'ZiggyGreen',
    ['@string.regexp'] = 'ZiggyGreen',
    ['@string.special.path'] = 'ZiggyGreen',
    ['@string.special.symbol'] = 'ZiggyGreen',
    ['@string.special.url'] = 'ZiggyGreen',
    ['@tag'] = 'ZiggyOrange',
    ['@tag.attribute'] = 'ZiggyOrange',
    ['@tag.builtin'] = 'ZiggyOrange',
    ['@tag.delimiter'] = 'ZiggyOrange',
    ['@variable'] = 'ZiggyGrey89',
    ['@variable.builtin'] = 'ZiggyGrey89',
    ['@variable.member'] = 'ZiggyGrey89',
    ['@variable.parameter'] = 'ZiggyGrey89',
    ['@attribute.zig'] = 'ZiggyDarkMagenta',
    ['@character.special.vim'] = 'ZiggyBlue',
    ['@function.macro.vim'] = 'ZiggyBlue',
    ['@keyword.gitcommit'] = 'ZiggyBlue',
    ['@keyword.import.bash'] = '@keyword',
    ['@keyword.import.rust'] = '@keyword',
    ['@keyword.storage.rust'] = 'ZiggyDarkMagenta',
    ['@markup.heading.1.markdown'] = 'ZiggyDarkCyan',
    ['@markup.heading.1.vimdoc'] = 'ZiggyBlue',
    ['@markup.heading.2.markdown'] = 'ZiggyDarkMagenta',
    ['@markup.heading.2.vimdoc'] = 'ZiggyBlue',
    ['@markup.heading.3.markdown'] = 'ZiggyCyan',
    ['@markup.heading.4.markdown'] = 'ZiggyYellow',
    ['@markup.heading.5.markdown'] = 'ZiggyBlue',
    ['@markup.heading.6.markdown'] = 'ZiggyDarkMagenta',
    ['@markup.heading.help'] = 'ZiggyBlue',
    ['@markup.heading.markdown'] = 'ZiggyBlue',
    ['@markup.link.gitcommit'] = 'ZiggyBlue',
    ['@markup.link.url.gitcommit'] = 'ZiggyDarkCyan',
    ['@markup.list.latex'] = 'ZiggyMagenta',
    ['@markup.raw.vimdoc'] = 'ZiggyRed',
    ['@namespace.latex'] = 'ZiggyDarkMagenta',
    ['@punctuation.delimiter.astro'] = 'ZiggyGrey89',
    ['@punctuation.delimiter.css'] = 'ZiggyGrey89',
    ['@punctuation.delimiter.rust'] = 'ZiggyGrey89',
    ['@punctuation.delimiter.scss'] = 'ZiggyGrey89',
    ['@punctuation.delimiter.yaml'] = 'ZiggyGrey89',
    ['@variable.builtin.vim'] = 'ZiggyDarkCyan',
    ['@variable.member.yaml'] = 'ZiggyBlue',
    ['@variable.parameter.bash'] = 'ZiggyWhite',
    ['@variable.scss'] = 'ZiggyCyan',
    ['@variable.vim'] = 'ZiggyCyan',
    DiagnosticError = 'ZiggyRed',
    DiagnosticWarn = 'ZiggyYellow',
    DiagnosticInfo = 'ZiggyBlue',
    DiagnosticHint = 'ZiggyCyan',
    DiagnosticOk = 'ZiggyDarkCyan',
    DiagnosticSignError = 'ZiggyRed',
    DiagnosticSignWarn = 'ZiggyYellow',
    DiagnosticSignInfo = 'ZiggyBlue',
    DiagnosticSignHint = 'ZiggyCyan',
    DiagnosticSignOk = 'ZiggyDarkCyan',
    LspCodeLens = 'ZiggyGrey39',
    LspCodeLensSeparator = 'ZiggyGrey39',
    LspInfoBorder = 'FloatBorder',
    LspReferenceText = 'Visual',
    LspReferenceRead = 'Visual',
    LspReferenceWrite = 'Visual',
  }

  for name, link in pairs(links) do
    highlight(0, name, { link = link })
  end

  local extra = {
    ['@function'] = { fg = p.magenta, bold = true },
    ['@keyword'] = { fg = p.white, bold = true },
    ['@keyword.exception'] = { fg = p.white, bold = true },
    ['@markup.heading.marker'] = { fg = p.blue, bold = true },
    ['@markup.heading'] = { fg = p.white, bold = true },
    ['@markup.bold'] = { fg = p.magenta, bold = true },
    ['@markup.italic'] = { fg = p.magenta, italic = true },
    ['@markup.link.url'] = { fg = p.magenta, underline = true, sp = p.grey50 },
    ['@markup.strikethrough'] = { fg = p.red, strikethrough = true },
    ['@markup.underline'] = { underline = true },
    ['@none'] = {},
    ['@type.builtin'] = { fg = p.blue, bold = true },
    ['@type.qualifier'] = { fg = p.blue, bold = true },
    ['@markup.link.markdown_inline'] = {},
    ['@markup.link.url.astro'] = { fg = p.dark_magenta, italic = true },
    ['@markup.link.url.html'] = { fg = p.dark_magenta, italic = true },
    ['@markup.link.url.svelte'] = { fg = p.dark_magenta, italic = true },
    ['@markup.link.url.vue'] = { fg = p.dark_magenta, italic = true },
    ['@lsp.type.macro'] = {},
    ['@lsp.type.operator'] = {},
    ['@lsp.type.unresolvedReference'] = { undercurl = true, sp = p.red },
    ['@lsp.type.variable'] = {},
    ['@lsp.type.namespace.ruby'] = {},
    DiagnosticUnderlineError = { undercurl = true, sp = p.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = p.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = p.blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = p.cyan },
    DiagnosticUnderlineOk = { undercurl = true, sp = p.dark_cyan },
    DiagnosticVirtualTextError = { bg = p.grey23, fg = p.red },
    DiagnosticVirtualTextWarn = { bg = p.grey23, fg = p.grey50 },
    DiagnosticVirtualTextInfo = { bg = p.grey23, fg = p.grey62 },
    DiagnosticVirtualTextHint = { bg = p.grey23, fg = p.cyan },
    DiagnosticVirtualTextOk = { bg = p.grey23, fg = p.dark_cyan },
    LspInlayHint = { bg = p.grey11, fg = p.grey58 },
    LspSignatureActiveParameter = { bg = p.grey18 },
  }

  for name, spec in pairs(extra) do
    highlight(0, name, spec)
  end
end



function M.load()
  vim.cmd.highlight("clear")

  if vim.fn.exists("syntax_on") then
    vim.cmd.syntax("reset")
  end

  vim.o.termguicolors = true

  is_dark = vim.o.background == "dark"

  if is_dark then
    g.colors_name = "zig_dark"
  else
    g.colors_name = "zig_light"
  end

  ApplyTheme()
end


vim.api.nvim_create_user_command("ZigToggleTheme", ToggleTheme, {})

M.load()

return M

