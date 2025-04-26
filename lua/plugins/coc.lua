return {
    "neoclide/coc.nvim",
    branch = "release",
    build = "npm ci",
    config = function ()
    
    local mapKey = vim.api.nvim_set_keymap
        
    -- Refresh completion manually
    mapKey("i", "<C-Space>", "coc#refresh()", { expr = true, noremap = true })

    -- Go to definition
    mapKey("n", "gd", "<Plug>(coc-definition)", {})

    -- Find references
    mapKey("n", "gr", "<Plug>(coc-references)", {})

    -- Show hover documentation
    mapKey("n", "K", ":call CocActionAsync('doHover')<CR>", { silent = true })

    -- Format document
    mapKey("n", "<leader>f", ":call CocAction('format')<CR>", { silent = true })

    -- Diagnostics navigation
    mapKey("n", "[g", "<Plug>(coc-diagnostic-prev)", {})
    mapKey("n", "]g", "<Plug>(coc-diagnostic-next)", {})
        
    end,
  }