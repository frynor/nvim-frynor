return {
	{ "neanias/everforest-nvim",
	   version = false,
	   lazy = false, 
	   priority = 1000 },
	{ "nvim-telescope/telescope.nvim", 
	   dependencies = "tsakirist/telescope-lazy.nvim" },
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{
    	  "nvim-neo-tree/neo-tree.nvim",
    	  branch = "v3.x",
    	  dependencies = {
      	  "nvim-lua/plenary.nvim",
      	  "nvim-tree/nvim-web-devicons", 
      	  "MunifTanjim/nui.nvim",
    },
}
}
