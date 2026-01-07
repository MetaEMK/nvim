local function lsp_references_without_test()
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request(0, "textDocument/references", params, function (err, result, ctx, config)
        if err or not result then
            return
        end

        local filtered_results = {}

        for _, ref in ipairs(result) do
            local fname = vim.uri_to_fname(ref.uri)
            if not fname:match("_test%.%w+$") then
                table.insert(filtered_results, ref)
            end
        end
            vim.lsp.handlers["textDocument/references"](nil, filtered_results, ctx, config)
    end)
end

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>as", vim.cmd.SymbolsOutline)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("i", "<C-c>", "<Esc>")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>O")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>vrr", function() lsp_references_without_test() end)
vim.keymap.set("n", "<leader>vrt", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set('n', '<leader>aa', '<cmd>AerialToggle!<CR>')

vim.keymap.set('n', '<leader>ad', '<cmd>DBUIToggle<CR>')

vim.keymap.set('n', '<leader>acd', '<cmd>Copilot disable<CR>')
vim.keymap.set('n', '<leader>ace', '<cmd>Copilot enable<CR>')
