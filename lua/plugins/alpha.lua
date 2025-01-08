return {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require("alpha")
        local startify = require("alpha.themes.startify")
        
        -- Header
        startify.section.header.val = {
            [[                                   ]],
            [[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆         ]],
            [[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
            [[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
            [[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
            [[          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
            [[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
            [[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
            [[ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
            [[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
            [[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
            [[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
            [[                                   ]],
        }

        -- Set up the highlights
        vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = '#ebbcba' })  -- Rose
        vim.api.nvim_set_hl(0, 'AlphaButtons', { fg = '#9ccfd8' }) -- Foam
        vim.api.nvim_set_hl(0, 'AlphaFooter', { fg = '#c4a7e7' })  -- Iris

        -- Apply highlights to sections
        startify.section.header.opts = { hl = "AlphaHeader" }
        
        -- Handle buttons highlights
        if startify.section.top_buttons then
            startify.section.top_buttons.opts = { hl = "AlphaButtons" }
        end
        if startify.section.bottom_buttons then
            startify.section.bottom_buttons.opts = { hl = "AlphaButtons" }
        end
        
        -- Handle footer highlight
        if startify.section.footer then
            startify.section.footer.opts = { hl = "AlphaFooter" }
        end

        -- Configure file icons if the section exists
        if startify.file_icons then
            startify.file_icons.provider = "devicons"
            startify.file_icons.enable = true
        end

        -- Set up alpha-nvim with startify configuration
        alpha.setup(startify.config)

        -- Map the <Leader>h key to open Alpha
        vim.api.nvim_set_keymap('n', '<Leader>h', ':Alpha<CR>', { noremap = true, silent = true })
    end,
}
