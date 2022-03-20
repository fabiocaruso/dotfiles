vim.opt.runtimepath:append('~/.vim runtimepath', '~/.vim/after')
-- highlight WinSep..: Just for now until gruvbox supports lastatatus=3
vim.cmd([[
let &packpath = &runtimepath
source ~/.vimrc
set laststatus=3
highlight WinSeparator guibg=None
]])

-- For plugin development
-- Add current root directory to the runtimepath
print(vim.api.nvim_command [[
autocmd VimEnter * let &rtp.=','.FindRootDirectory()
]])

require('config').setup()
