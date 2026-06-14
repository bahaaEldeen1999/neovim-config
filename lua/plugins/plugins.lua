return {

		{
		'luukvbaal/nnn.nvim'
	},

	{
    'nvim-telescope/telescope.nvim', 
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
},
{'marko-cerovac/material.nvim', lazy=false},

{ "nvim-tree/nvim-web-devicons", lazy=false, opts = {} },

{'nvimdev/galaxyline.nvim', lazy=false},

{'RRethy/vim-illuminate'},

{ "amansingh-afk/milli.nvim", lazy = false },

}
