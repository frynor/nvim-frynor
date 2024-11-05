return {
    "andweeb/presence.nvim",
    config = function()
        require("presence").setup({
            -- Optional settings; add these based on what you want to customize
            auto_update         = true,              -- Update Discord status automatically
            neovim_image_text   = "Working in Neovim",      -- Custom message for the Neovim image
	    editing_text        = "Editing %s",
            main_image          = "file",          -- Set the main image ("file" or "neovim")
            log_level           = nil,               -- Log level: nil, "debug", "info", "warn", "error"
            debounce_timeout    = 10,                -- Number of seconds to wait before sending an update
            enable_line_number  = false,             -- Display the current line number
	    buttons = true,
            show_time = true,

	    file_explorer_text = "Browsing %s",
            git_commit_text = "Commiting changes",
	    plugin_manager_text = "Managing plugins",
            reading_text = "Reading &s",
            workspace_text = "Working on %s",
            line_number_text = "Line %s out of %s",
        })
    end,
}

