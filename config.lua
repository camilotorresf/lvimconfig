--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- spell check
vim.opt.spell = true

-- line breaks
vim.opt.wrap = true
vim.opt.linebreak = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping

lvim.keys.normal_mode["<C-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-h>"] = ":BufferLineCyclePrev<CR>"

-- Close buffers
lvim.keys.normal_mode["<S-q>"] = "<cmd>bdelete!<CR>"

-- Telescope
lvim.builtin.which_key.mappings["f"] = {}
lvim.builtin.which_key.mappings["ff"] = { ":Telescope find_files<CR>", "Find Files" }
lvim.builtin.which_key.mappings["ft"] = { ":Telescope live_grep<CR>", "Find Grep" }
lvim.builtin.which_key.mappings["fp"] = { ":Telescope projects<CR>", "Find Projects" }
lvim.builtin.which_key.mappings["fb"] = { ":Telescope buffers<CR>", "Find Buffers" }
lvim.builtin.which_key.mappings["fh"] = { ":Telescope grep_string<CR>", "Find Text" }
lvim.builtin.which_key.mappings["fr"] = { ":Telescope resume<CR>", "Repeat Find" }
-- To Do
lvim.builtin.which_key.mappings["tt"] = {
  "<cmd>lua require('telescope.builtin').grep_string({search=\"TODO camilo\"})<CR>", "My To Do list" }
-- Trouble Toggle
lvim.builtin.which_key.mappings["tr"] = { ":TroubleToggle<CR>", "Trouble" }

-- Harpoon
lvim.builtin.which_key.mappings["ha"] = { "<cmd>lua require'harpoon.mark'.add_file()<cr>", "Add File to Harpoon" }
lvim.builtin.which_key.mappings["hh"] = { "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<cr>", "Show Harpoon" }
lvim.builtin.which_key.mappings["h1"] = { "<cmd>lua require'harpoon.ui'.nav_file(1)<cr>", "Harpoon 1" }
lvim.builtin.which_key.mappings["h2"] = { "<cmd>lua require'harpoon.ui'.nav_file(2)<cr>", "Harpoon 2" }
lvim.builtin.which_key.mappings["h3"] = { "<cmd>lua require'harpoon.ui'.nav_file(3)<cr>", "Harpoon 3" }
lvim.builtin.which_key.mappings["h4"] = { "<cmd>lua require'harpoon.ui'.nav_file(4)<cr>", "Harpoon 4" }
lvim.builtin.which_key.mappings["h5"] = { "<cmd>lua require'harpoon.ui'.nav_file(5)<cr>", "Harpoon 5" }
lvim.builtin.which_key.mappings["h6"] = { "<cmd>lua require'harpoon.ui'.nav_file(6)<cr>", "Harpoon 6" }

-- -- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pylyzer" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters, formatters and code actions <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue", "css", "scss", "less", "html",
--       "json", "jsonc", "yaml", "graphql", "handlebars" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
--   { command = "eslint", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" } }
-- }
-- local code_actions = require "lvim.lsp.null-ls.code_actions"
-- code_actions.setup {
--   {
--     exe = "eslint",
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  {
    "folke/trouble.nvim",
    --       cmd = "TroubleToggle",
  },
  { "ThePrimeagen/harpoon" },
  {
    "stevearc/oil.nvim",
    config = true,
  },
  { "dhruvasagar/vim-table-mode" },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
