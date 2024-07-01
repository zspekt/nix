-- Define on_attach function
local on_attach = function(client, bufnr)
  -- Key mappings and other buffer-specific settings go here
  -- Example key mappings for LSP features
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  -- Key mappings
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>lsp', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('v', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>fm', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
end

-- Define capabilities with cmp_nvim_lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

-- Configure borders for LSP hover and other handlers
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded"
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded"
  }),
}

-- Plugin configuration
return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")

      -- TSServer setup
      local function organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
        }
        vim.lsp.buf.execute_command(params)
      end

      lspconfig.tsserver.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
        commands = {
          OrganizeImports = {
            organize_imports,
            description = "Organize imports",
          },
        },
      }

      -- Pyright setup
      lspconfig.pyright.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
        filetypes = { "python" },
      }

      -- BashLS setup
      lspconfig.bashls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
        filetypes = { "shell", "bash", "zsh", "sh" },
      }

      -- Gopls setup
      lspconfig.gopls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        cmd = { "gopls" },
        root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      }

      -- DockerLS setup
      lspconfig.dockerls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
        cmd = { "docker-langserver", "--stdio" },
        filetypes = { "dockerfile" },
        root_dir = require("lspconfig/util").root_pattern "Dockerfile",
        single_file_support = true,
      }

      -- Docker Compose Language Service setup
      lspconfig.docker_compose_language_service.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
        cmd = { "docker-compose-langserver", "--stdio" },
        filetypes = { "yaml.docker-compose" },
        root_dir = require("lspconfig/util").root_pattern("docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml"),
        single_file_support = true,
      }

      -- SQL Language Server setup
      lspconfig.sqlls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
        filetypes = { "sql", "pgsql", "mysql" },
        root_dir = function(_)
          return vim.loop.cwd()
        end,
      }

      -- HTML setup
      lspconfig.html.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
      }

      -- CSS Language Server setup
      lspconfig.cssls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
      }

      -- CCLS setup
      lspconfig.ccls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
        init_options = {
          compilationDatabaseDirectory = "build",
          index = {
            threads = 0,
          },
          clang = {
            excludeArgs = { "-frounding-math" },
          },
        },
      }

      -- nix
      lspconfig.nil_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
      }

      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
              disable = { "different-requires" },
            },
          },
        },
      })
    end,
  },
}
