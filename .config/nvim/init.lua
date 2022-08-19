vim.opt.runtimepath:append('~/.vim runtimepath', '~/.vim/after')
-- highlight WinSep..: Just for now until gruvbox supports lastatatus=3
vim.cmd([[
let &packpath = &runtimepath
source ~/.vimrc
highlight WinSeparator guibg=None
]])

-- For plugin development
-- Add current root directory to the runtimepath
vim.api.nvim_command [[
autocmd VimEnter * let &rtp.=','.FindRootDirectory()
]]

require('config').setup()
