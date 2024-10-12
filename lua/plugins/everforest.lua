return {
    "morhetz/gruvbox",
    config = function()
        -- Set options before loading the colorscheme
        vim.o.background = "dark"
        vim.cmd([[
		let g:gruvbox_transparent_bg = 1
        ]])
        
        -- Load the colorscheme
        vim.cmd.colorscheme("gruvbox")
        
        -- Apply any additional settings after loading
        vim.cmd([[
            if exists('g:gruvbox_transparent_bg') && g:gruvbox_transparent_bg == 1
                highlight Normal guibg=NONE ctermbg=NONE
            endif
        ]])
    end
}
