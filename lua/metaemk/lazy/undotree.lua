return {
    "mbbill/undotree",

    config = function()
        vim.keymap.set("n", "<leader>au", vim.cmd.UndotreeToggle)
    end
}

