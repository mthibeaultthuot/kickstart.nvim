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


-- GitHub dark / Primer-inspired palette.
local dark_palette = {
  none = 'NONE',
  bg = '#202124',
  white = '#f5efc4',
  grey0 = '#34363a',
  grey1 = '#45474c',
  grey89 = '#f5efc4',
  grey70 = '#d7cfaa',
  grey62 = '#aaa38f',
  grey58 = '#858585',
  grey50 = '#777777',
  grey39 = '#666666',
  grey30 = '#555555',
  grey27 = '#414347',
  grey23 = '#303236',
  grey18 = '#282a2e',
  grey15 = '#202124',
  grey11 = '#1a1b1e',
  grey7 = '#141518',
  red = '#ff4d00',
  dark_red = '#ff3300',
  green = '#f5efc4',
  dark_green = '#ded79f',
  yellow = '#ffd24a',
  dark_yellow = '#ffb000',
  blue = '#ff9f43',
  dark_blue = '#ff8a3d',
  magenta = '#ff8a00',
  dark_magenta = '#ff6a00',
  cyan = '#ffe78a',
  dark_cyan = '#ffd24a',
  orange = '#ff4d00',
}

-- GitHub light / Primer-inspired palette.
local light_palette = {
  none = 'NONE',
  bg = '#ffffff',
  white = '#24292f',
  grey0 = '#d0d7de',
  grey1 = '#afb8c1',
  grey89 = '#24292f',
  grey70 = '#57606a',
  grey62 = '#6e7781',
  grey58 = '#6e7781',
  grey50 = '#8c959f',
  grey39 = '#8c959f',
  grey30 = '#afb8c1',
  grey27 = '#d0d7de',
  grey23 = '#eaeef2',
  grey18 = '#f6f8fa',
  grey15 = '#ffffff',
  grey11 = '#f6f8fa',
  grey7 = '#eaeef2',
  red = '#cf222e',
  dark_red = '#a40e26',
  green = '#116329',
  dark_green = '#1a7f37',
  yellow = '#b45309',
  dark_yellow = '#d97706',
  blue = '#0550ae',
  dark_blue = '#0969da',
  magenta = '#8250df',
  dark_magenta = '#6639ba',
  cyan = '#0a3069',
  dark_cyan = '#0969da',
  orange = '#f97316',
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
    Function = { fg = p.magenta },
    String = { fg = p.yellow },
    Boolean = { fg = p.yellow },
    Identifier = { fg = p.grey89 },
    Title = { fg = p.magenta },
    StorageClass = { fg = p.orange },
    Type = { fg = p.orange },
    Constant = { fg = p.yellow },
    Number = { fg = p.yellow },
    Character = { fg = p.yellow },
    Exception = { fg = p.orange },
    PreProc = { fg = p.orange },
    Define = { link = 'PreProc' },
    Label = { fg = p.grey89 },
    NonText = { fg = p.orange },
    Operator = { fg = p.grey89 },
    Conditional = { fg = p.orange },
    Keyword = { fg = p.orange },
    Repeat = { fg = p.orange },
    Search = { bg = p.grey1, fg = p.grey89 },
    CurSearch = { bg = p.orange, fg = p.bg },
    IncSearch = { bg = p.grey62, fg = p.bg },
    Special = { fg = p.yellow },
    Statement = { fg = p.orange },
    Structure = { fg = p.orange },
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
    ['@attribute.zig'] = 'ZiggyYellow',
    ['@boolean.zig'] = 'ZiggyYellow',
    ['@constant.builtin.zig'] = 'ZiggyYellow',
    ['@constant.zig'] = 'ZiggyYellow',
    ['@constructor.zig'] = 'ZiggyWhite',
    ['@function.zig'] = 'ZiggyWhite',
    ['@function.builtin.zig'] = 'ZiggyOrange',
    ['@function.call.zig'] = 'ZiggyWhite',
    ['@function.method.call.zig'] = 'ZiggyWhite',
    ['@keyword.conditional.zig'] = 'ZiggyOrange',
    ['@keyword.exception.zig'] = 'ZiggyOrange',
    ['@keyword.function.zig'] = 'ZiggyOrange',
    ['@keyword.import.zig'] = 'ZiggyOrange',
    ['@keyword.operator.zig'] = 'ZiggyOrange',
    ['@keyword.repeat.zig'] = 'ZiggyOrange',
    ['@keyword.return.zig'] = 'ZiggyOrange',
    ['@keyword.storage.zig'] = 'ZiggyOrange',
    ['@keyword.zig'] = 'ZiggyOrange',
    ['@module.builtin.zig'] = 'ZiggyYellow',
    ['@module.zig'] = 'ZiggyWhite',
    ['@number.float.zig'] = 'ZiggyYellow',
    ['@number.zig'] = 'ZiggyYellow',
    ['@operator.zig'] = 'ZiggyOrange',
    ['@property.zig'] = 'ZiggyGrey89',
    ['@punctuation.bracket.zig'] = 'ZiggyGrey70',
    ['@punctuation.delimiter.zig'] = 'ZiggyGrey70',
    ['@string.escape.zig'] = 'ZiggyYellow',
    ['@string.special.zig'] = 'ZiggyYellow',
    ['@string.zig'] = 'ZiggyYellow',
    ['@type.builtin.zig'] = 'ZiggyOrange',
    ['@type.zig'] = 'ZiggyWhite',
    ['@variable.builtin.zig'] = 'ZiggyOrange',
    ['@variable.member.zig'] = 'ZiggyGrey89',
    ['@variable.parameter.zig'] = 'ZiggyGrey89',
    ['@variable.zig'] = 'ZiggyGrey89',
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
    ['@function'] = { fg = p.magenta },
    ['@keyword'] = { fg = p.orange },
    ['@keyword.exception'] = { fg = p.orange },
    ['@markup.heading.marker'] = { fg = p.orange, bold = true },
    ['@markup.heading'] = { fg = p.orange, bold = true },
    ['@markup.bold'] = { fg = p.orange, bold = true },
    ['@markup.italic'] = { fg = p.orange, italic = true },
    ['@markup.link.url'] = { fg = p.orange, underline = true, sp = p.grey50 },
    ['@markup.strikethrough'] = { fg = p.red, strikethrough = true },
    ['@markup.underline'] = { underline = true },
    ['@none'] = {},
    ['@type.builtin'] = { fg = p.blue },
    ['@type.qualifier'] = { fg = p.blue },
    ['@markup.link.markdown_inline'] = {},
    ['@markup.link.url.astro'] = { fg = p.dark_magenta, italic = true },
    ['@markup.link.url.html'] = { fg = p.dark_magenta, italic = true },
    ['@markup.link.url.svelte'] = { fg = p.dark_magenta, italic = true },
    ['@markup.link.url.vue'] = { fg = p.dark_magenta, italic = true },
    ['@lsp.type.macro'] = {},
    ['@lsp.type.operator'] = {},
    ['@lsp.type.enum.zig'] = { fg = p.white },
    ['@lsp.type.enumMember.zig'] = { fg = p.white },
    ['@lsp.type.function.zig'] = { fg = p.white },
    ['@lsp.type.method.zig'] = { fg = p.white },
    ['@lsp.type.namespace.zig'] = { fg = p.white },
    ['@lsp.type.parameter.zig'] = { fg = p.white },
    ['@lsp.type.property.zig'] = { fg = p.white },
    ['@lsp.type.struct.zig'] = { fg = p.white },
    ['@lsp.type.type.zig'] = { fg = p.white },
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
    g.colors_name = "ziggy_dark"
  else
    g.colors_name = "ziggy_light"
  end

  ApplyTheme()
end


vim.api.nvim_create_user_command("ZigToggleTheme", ToggleTheme, {})

M.load()

return M
