---@module 'lazy'
---@type LazySpec
return {
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false,
    ft = { 'rust' },
    init = function()
      local function find_root()
        local path = vim.api.nvim_buf_get_name(0)
        local start = path ~= '' and path or vim.uv.cwd()

        return vim.fs.root(start, {
          'Cargo.toml',
          'rust-project.json',
          '.git',
        }) or vim.uv.cwd()
      end

      local function cargo_picker()
        local root = find_root()
        local choices = {
          'cargo check',
          'cargo check --workspace',
          'cargo build',
          'cargo build --workspace',
          'cargo test',
          'cargo test --workspace',
          'cargo clippy --workspace --all-targets',
          'cargo fmt',
          'cargo doc --open',
        }

        vim.ui.select(choices, { prompt = 'Rust command' }, function(choice)
          if not choice then return end
          vim.cmd.tabnew()
          vim.cmd.terminal('cd ' .. vim.fn.shellescape(root) .. ' && ' .. choice)
          vim.cmd.startinsert()
        end)
      end

      vim.g.rustaceanvim = {
        server = {
          default_settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
                buildScripts = { enable = true },
              },
              check = {
                command = 'clippy',
                allTargets = true,
              },
              diagnostics = {
                enable = true,
              },
              inlayHints = {
                bindingModeHints = { enable = true },
                closureReturnTypeHints = { enable = 'with_block' },
                lifetimeElisionHints = { enable = 'skip_trivial' },
                typeHints = { enable = true },
              },
              procMacro = {
                enable = true,
              },
            },
          },
          on_attach = function(_, bufnr)
            local map = function(keys, func, desc)
              vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'Rust: ' .. desc })
            end

            local telescope_ok, builtin = pcall(require, 'telescope.builtin')
            local which_key_ok, which_key = pcall(require, 'which-key')
            if which_key_ok then which_key.add { { '<leader>r', group = 'Rust', buffer = bufnr } } end

            local function implementations()
              if telescope_ok then
                builtin.lsp_implementations()
              else
                vim.lsp.buf.implementation()
              end
            end

            local function format()
              local conform_ok, conform = pcall(require, 'conform')
              if conform_ok then
                conform.format {
                  async = true,
                  lsp_format = 'fallback',
                  timeout_ms = 3000,
                }
              else
                vim.lsp.buf.format { async = true, timeout_ms = 3000 }
              end
            end

            map('gd', function()
              if telescope_ok then
                builtin.lsp_definitions()
              else
                vim.lsp.buf.definition()
              end
            end, 'go to definition')

            map('gD', vim.lsp.buf.declaration, 'go to declaration')

            map('gi', implementations, 'go to implementation')

            map('gr', function()
              if telescope_ok then
                builtin.lsp_references()
              else
                vim.lsp.buf.references()
              end
            end, 'references')

            map('gy', function()
              if telescope_ok then
                builtin.lsp_type_definitions()
              else
                vim.lsp.buf.type_definition()
              end
            end, 'type definition')

            map('<leader>rs', function()
              if telescope_ok then
                builtin.lsp_document_symbols()
              else
                vim.lsp.buf.document_symbol()
              end
            end, 'document symbols')

            map('<leader>rS', function()
              if telescope_ok then
                builtin.lsp_dynamic_workspace_symbols()
              else
                vim.lsp.buf.workspace_symbol()
              end
            end, 'workspace symbols')

            map('<leader>ri', implementations, 'all implementations')
            map('<leader>rr', function() vim.cmd.RustLsp 'runnables' end, 'runnables')
            map('<leader>rt', function() vim.cmd.RustLsp 'testables' end, 'testables')
            map('<leader>rd', function() vim.cmd.RustLsp 'debuggables' end, 'debuggables')
            map('<leader>re', function() vim.cmd.RustLsp 'explainError' end, 'explain error')
            map('<leader>rE', function() vim.cmd.RustLsp 'renderDiagnostic' end, 'render diagnostic')
            map('<leader>rc', function() vim.cmd.RustLsp 'openCargo' end, 'open Cargo.toml')
            map('<leader>ro', function() vim.cmd.RustLsp 'openDocs' end, 'open docs.rs')
            map('<leader>rp', function() vim.cmd.RustLsp 'parentModule' end, 'parent module')
            map('<leader>rm', function() vim.cmd.RustLsp 'expandMacro' end, 'expand macro')
            map('<leader>rk', function() vim.cmd.RustLsp 'flyCheck' end, 'fly check')
            map('<leader>rg', function() vim.cmd.RustLsp 'crateGraph' end, 'crate graph')
            map('<leader>rx', function() vim.cmd.RustLsp 'syntaxTree' end, 'syntax tree')
            map('<leader>rj', function() vim.cmd.RustLsp 'joinLines' end, 'join lines')
            map('<leader>rh', function() vim.cmd.RustLsp { 'hover', 'actions' } end, 'hover actions')
            map('<leader>ra', function() vim.cmd.RustLsp 'codeAction' end, 'code action')
            map('<leader>rn', vim.lsp.buf.rename, 'rename')
            map('<leader>rf', format, 'format')
            map('<leader>rb', cargo_picker, 'cargo command')
          end,
        },
      }
    end,
  },
}
