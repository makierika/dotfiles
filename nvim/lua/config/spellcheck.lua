vim.api.nvim_create_autocmd("FileType", {
    pattern = {"cpp", "c", "h", "go"},
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_us"
    end
})
