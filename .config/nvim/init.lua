-- TODO: Enable if packer supports it. Added in 0.9
--vim.loader.enable()

--vim.opt.runtimepath:append('~/.vim runtimepath', '~/.vim/after')
-- highlight WinSep..: Just for now until gruvbox supports lastatatus=3
vim.cmd([[
let &packpath = &runtimepath
source ~/.vimrc
]])
--highlight WinSeparator guibg=None

-- For plugin development
-- Add current root directory to the runtimepath
vim.api.nvim_command([[
autocmd VimEnter * let &rtp.=','.FindRootDirectory()
]])

-- See https://github.com/neovim/neovim/pull/14537
vim.opt.diffopt:append("linematch:50")

require("config").setup()
