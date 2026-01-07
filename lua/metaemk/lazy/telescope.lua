return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {
                    "_test%.%w+$",
                    "_mock%.%w+$"
                }
            }
        })


        vim.api.nvim_create_user_command("FindAll", function ()
            require("telescope.builtin").find_files({
                file_ignore_patterns = {}
            })
        end, {})
        vim.api.nvim_create_user_command("GrepAll", function ()
            require("telescope.builtin").grep_string({
                file_ignore_patterns = {}
            })
        end, {})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pt', ':FindAll<CR>', { noremap = true, silent = true})
        vim.keymap.set('n', '<leader>pst', ':GrepAll<CR>', { noremap = true, silent = true})
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pss', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}

