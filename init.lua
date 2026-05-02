-- data: /home/bahaa/.local/share/nvim   

-- require("telescope.nvim")

require("nnn").setup()

-- require("one-nvim")

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        -- ["<C-p>"] = "find_files"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

-- vim.cmd[[packadd! one-nvim]]
-- vim.cmd[[packadd! tokyonight]]

require("material").setup()
-- require("barbar").setup()
-- require("one-nvim").setup()
-- vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme palenight]]

vim.cmd 'colorscheme material'
-- vim.g.material_style = "deep ocean"


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<S-F>', builtin.live_grep, { desc = 'Telescope global live grep' })
-- vim.keymap.set('n', '<C-F>', builtin.live_grep, { desc = 'Telescope open buffers live grep' })
vim.keymap.set('n', '<C-f>', "<cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>")
vim.keymap.set('n', '<C-o>', builtin.buffers, {})

local material_fn = require('material.functions')
vim.keymap.set('n', '<C-S-m>', material_fn.find_style, { desc = 'Material style switcher' })
material_fn.change_style("palenight")


local builtin = require("nnn").builtin
  mappings = {
    -- { "<C-s>", builtin.open_in_tab },       -- open file(s) in tab
    -- { "<C-s>", builtin.open_in_split },     -- open file(s) in split
    -- { "<C-v>", builtin.open_in_vsplit },    -- open file(s) in vertical split
    -- { "<C-p>", builtin.open_in_preview },   -- open file in preview split keeping nnn focused
    -- { "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
    -- { "<C-w>", builtin.cd_to_path },        -- cd to file directory
    -- { "<C-e>", builtin.populate_cmdline },  -- populate cmdline (:) with file(s)
  }
-- colorscheme one-nvim

-- vim.opt.number = true
-- Ctrl + w, h/j/k/l: Move focus Left, Down, Up, or Right.
-- Ctrl + w, w: Cycle through all open windows in a "Z" pattern.

vim.api.nvim_set_option("clipboard","unnamed")

require('nvim-web-devicons').setup() 
require('galaxyline')
require("galaxyline.themes.eviline") -- status line
require("illuminate") -- cursor word highlighting
require("milli").vimenter({ splash = "skeleton", loop = true })
require("toggleterm").setup()
-- require("nvim-cmp").setup()

-- local opts = { noremap = true, silent = true }

-- Go to definition (like F12 in VSCode)
-- vim.keymap.set("n", "gd", ":YcmCompleter GoToDefinition<CR>", opts)

-- -- Go to declaration
-- vim.keymap.set("n", "gD", ":YcmCompleter GoToDeclaration<CR>", opts)

-- -- Go to implementation
-- vim.keymap.set("n", "gi", ":YcmCompleter GoToImplementation<CR>", opts)

-- -- Go to references (like Shift+F12)
-- vim.keymap.set("n", "gr", ":YcmCompleter GoToReferences<CR>", opts)

-- -- Hover docs (like hover in VSCode)
-- vim.keymap.set("n", "K", ":YcmCompleter GetDoc<CR>", opts)

-- -- Rename symbol
-- vim.keymap.set("n", "<leader>rn", ":YcmCompleter RefactorRename<CR>", opts)

-- -- Format code
-- vim.keymap.set("n", "<leader>f", ":YcmCompleter Format<CR>", opts)

-- vim.lsp.enable('clangd')
-- LSP setup
local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.clangd.setup({
  capabilities = capabilities,
  cmd = { "clangd-20" }
})

-- Autocomplete (nvim-cmp)
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

-- vim.keymap.set("n", "<C-d>", function()
--   if not vim.lsp.buf.hover then return end
--   vim.cmd("normal! <C-d>")
-- end)

-- vim.keymap.set("n", "<C-u>", function()
--   if not vim.lsp.buf.hover then return end
--   vim.cmd("normal! <C-u>")
-- end)

