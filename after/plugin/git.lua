local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
  keymaps = {
    -- Open blame window
    blame = "<leader>gb",
    -- Open file/folder in git repository
    browse = "<leader>go",
    -- Opens a new diff that compares against the current index
    diff = "<leader>gd",
    -- Close git diff
    diff_close = "<leader>gD",
  },
})
