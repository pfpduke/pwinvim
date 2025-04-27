return {
    "neoclide/coc.nvim",
    branch = "release",
    build = "npm ci",
    config = function()
        --Keymap helper
        local mapKey = function(mode, lhs, rhs, opts)
            vim.api.nvim_set_keymap(mode, lhs, rhs, opts or {})
        end

        --Smart tab completion
        local function check_back_space()
            local col = vim.fn.col('.') - 1
            return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
        end

        --Key maps (Defer mappings until Coc fully initialized)
        vim.api.nvim_create_autocmd("User", {
            pattern = "CocNvimInit",
            once = true,
            callback = function()
                mapKey("i", "<Tab>", --Press tab while in insert mode for autocomplete
                    [[coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"]],
                    { noremap = true, silent = true, expr = true })

                --LSP features
                mapKey("n", "gd", "<Plug>(coc-definition)", {})                            --In normal mode press (g+d) to go to definition
                mapKey("n", "gr", "<Plug>(coc-references)", {})                            --In normal mode press (g+r) to go to refrence, navigate and move to refrence with enter
                mapKey("n", "K", ":call CocActionAsync('doHover')<CR>", { silent = true }) --In normal mode press (shift+k) Show documentation of the current symbol

                --Formatting
                mapKey("n", "<leader>f", ":call CocAction('format')<CR>", { silent = true }) --In normal mode press (leader+f) to format entire buffer

                --TODO FIX Diagnostic navigation
                mapKey('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true, noremap = true }) --In normal mode press ([+g) to jump to previous error, warning or hint
                mapKey('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true, noremap = true }) --In normal mode press (]+g) to jump to previous error, warning or hint
            end,
        })

        --Clear highlights when starting to type
        vim.api.nvim_create_autocmd("InsertEnter", {
            callback = function()
                vim.fn.CocActionAsync('highlight')
            end,
        })

        --Set .ps1 files to powershell filetype (important for coc-powershell)
        vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
            pattern = "*.ps1",
            callback = function()
                vim.bo.filetype = "powershell"
            end,
        })
    end,
}

--TODO update formatting settings in coc-settings.json
--   {
--     "powershell": {
--       "codeFormatting": {
--         "openBraceOnSameLine": false,
--         "newLineAfterOpenBrace": true,
--         "newLineAfterCloseBrace": true,
--         "preserveFormat": false,
--         "autoCorrectAliases": true,
--         "useCorrectCasing": true,
--         "indentationSize": 4
--       }
--     }
--   }
