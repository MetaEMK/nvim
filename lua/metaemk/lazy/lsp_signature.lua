return {
    "ray-x/lsp_signature.nvim",
    opts = { },

    config = function()
        vim.keymap.set({ 'n' }, '<C-k>', function()
            require('lsp_signature').toggle_float_win()
        end, {silent = true, noremap = true, desc = 'toggle signature'})
        vim.keymap.set({ 'n' }, '<Leader>k', function()
            vim.lsp.buf.signature_help()
        end, {silent = true, noremap = true, desc = 'toggle signature_help'})
    end
}
