local function init()
        require("dapui").setup()
        require("neodev").setup({ library = { plugins = { "nvim-dap-ui" }, types = true } })
        require("nvim-dap-virtual-text").setup()

        require("dap-python").setup()
        require("dap-python").tests_runner = "pytest"

        -- Map k to hover while session is active
        local dap = require("dap")
        local api = vim.api
        local keymap_restore = {}
        dap.listeners.after["event_initialized"]["me"] = function()
                for _, buf in pairs(api.nvim_list_bufs()) do
                        local keymaps = api.nvim_buf_get_keymap(buf, "n")
                        for _, keymap in pairs(keymaps) do
                                if keymap.lhs == "K" then
                                        table.insert(keymap_restore, keymap)
                                        api.nvim_buf_del_keymap(buf, "n", "K")
                                end
                        end
                end
                api.nvim_set_keymap("n", "K", '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
        end

        dap.listeners.after["event_terminated"]["me"] = function()
                for _, keymap in pairs(keymap_restore) do
                        api.nvim_buf_set_keymap(keymap.buffer, keymap.mode, keymap.lhs, keymap.rhs, { silent = keymap.silent == 1 })
                end
                keymap_restore = {}
        end

        -- rest of keymaps
        --vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
        vim.keymap.set("n", "<F5>", ':lua require("dap").continue()<CR>')
        vim.keymap.set("n", "<F4>", ':lua require("dapui").toggle()<CR>')
        vim.keymap.set("n", "<F10>", ':lua require("dap").step_over()<CR>')
        vim.keymap.set("n", "<F11>", ':lua require("dap").step_into()<CR>')
        vim.keymap.set("n", "<F12>", ':lua require("dap").step_out()<CR>')
        vim.keymap.set("n", "<leader>db", ':lua require("dap").toggle_breakpoint()<CR>')
        vim.keymap.set("n", "<leader>dB", ':lua require("dap").set_breakpoint(vim.fn.input("Condition: "))<CR>')
        vim.keymap.set("n", "<leader>dr", ':lua require("dap").repl.open()<CR>')
        vim.keymap.set("n", "<leader>dl", ':lua require("dap").run_last.open()<CR>')
        vim.keymap.set({ "n", "v" }, "<leader>dh", ':lua require("dap.ui.widgets").hover()<CR>')
        vim.keymap.set({ "n", "v" }, "<leader>dp", ':lua require("dap.ui.widgets").preview()<CR>')
        vim.keymap.set("n", "<leader>dt", ':lua require("dap").terminate()<CR>')
end

return {
        init = init,
}
