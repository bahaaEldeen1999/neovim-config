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
material_fn.change_style("deep ocean")


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
