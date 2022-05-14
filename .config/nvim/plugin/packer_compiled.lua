-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/fabiocaruso/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/fabiocaruso/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/fabiocaruso/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/fabiocaruso/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/fabiocaruso/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["DAPInstall.nvim"] = {
    config = { "\27LJ\2\2ì\1\0\0\5\0\n\0\0156\0\0\0'\1\1\0B\0\2\0029\1\2\0005\2\b\0006\3\3\0009\3\4\0039\3\5\3'\4\6\0B\3\2\2'\4\a\0&\3\4\3=\3\t\2B\1\2\1K\0\1\0\22installation_path\1\0\0\17/dapinstall/\tdata\fstdpath\afn\bvim\nsetup\16dap-install\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim",
    url = "https://github.com/Pocco81/DAPInstall.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\2M\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\2ù\1\0\4\14\1\6\0\30'\4\0\0006\5\1\0\18\6\2\0B\5\2\4H\b\22Ä\a\b\2\0X\n\6Ä-\n\0\0009\n\2\n'\v\3\0&\n\v\n\14\0\n\0X\v\nÄ\a\b\4\0X\n\6Ä-\n\0\0009\n\4\n'\v\3\0&\n\v\n\14\0\n\0X\v\2Ä-\n\0\0009\n\5\n\18\v\4\0\18\f\t\0\18\r\n\0&\4\r\vF\b\3\3R\bË\127L\4\2\0\1¿\thint\fwarning\6 \nerror\npairs\5‘\1\1\0\6\0\r\0\0176\0\0\0009\0\1\0009\1\2\0009\1\3\0019\1\4\0016\2\5\0'\3\6\0B\2\2\0029\2\a\0025\3\v\0005\4\b\0003\5\t\0=\5\n\4=\4\f\3B\2\2\0012\0\0ÄK\0\1\0\foptions\1\0\0\26diagnostics_indicator\0\1\0\2\16diagnostics\rnvim_lsp\20separator_style\nslant\nsetup\15bufferline\frequire\nsigns\15appearance\blsp\f_config\a_G\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codicons.nvim"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/codicons.nvim",
    url = "https://github.com/mortepau/codicons.nvim"
  },
  ["copilot.vim"] = {
    config = { "\27LJ\2\2\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["crates.nvim"] = {
    config = { "\27LJ\2\0024\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["cutlass.nvim"] = {
    config = { "\27LJ\2\0029\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\fcutlass\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/cutlass.nvim",
    url = "https://github.com/gbprod/cutlass.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\2Ñ\2\0\0\6\0\15\0\0186\0\0\0009\0\1\0009\1\2\0009\1\3\0019\1\4\0016\2\5\0'\3\6\0B\2\2\0029\2\a\0025\3\v\0005\4\b\0009\5\t\1=\5\n\4=\4\f\0035\4\r\0=\4\14\3B\2\2\1K\0\1\0\ntimer\1\0\3\15task_decay\3Ë\a\17spinner_rate\0032\17fidget_decay\3–\15\ttext\1\0\0\tdone\fsuccess\1\0\3\14commenced\fStarted\14completed\14Completed\fspinner\barc\nsetup\vfidget\frequire\nsigns\15appearance\blsp\f_config\a_G\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  firenvim = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\2:\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2≠\1\0\0\2\0\b\0\v6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\4\0'\1\5\0B\0\2\0029\0\6\0005\1\a\0B\0\2\1K\0\1\0\1\0\1\25show_current_context\2\nsetup\21indent_blankline\frequire\1\2\0\0\27neo-tree filesystem .*%indent_blankline_bufname_exclude\6g\bvim\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["legendary.nvim"] = {
    config = { "\27LJ\2\2≠\2\0\0\f\0\15\0%4\0\0\0006\1\0\0009\1\1\0019\1\2\0016\2\3\0\18\3\1\0B\2\2\4X\5\15Ä6\a\4\0009\a\5\a\18\b\0\0005\t\a\0:\n\2\6>\n\1\t:\n\3\6>\n\2\t9\n\6\6=\n\6\t4\n\3\0:\v\1\6>\v\1\n=\n\b\tB\a\3\1E\5\3\3R\5Ô\1276\2\t\0'\3\n\0B\2\2\0029\2\v\0025\3\f\0=\0\2\0034\4\0\0=\4\r\0034\4\0\0=\4\14\3B\2\2\1K\0\1\0\rautocmds\rcommands\1\0\2\28most_recent_item_at_top\2\20include_builtin\2\nsetup\14legendary\frequire\tmode\1\0\0\16description\vinsert\ntable\vipairs\fkeymaps\f_config\a_G\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/legendary.nvim",
    url = "https://github.com/mrjones2014/legendary.nvim"
  },
  ["litee-calltree.nvim"] = {
    config = { "\27LJ\2\2_\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2\fon_open\npanel\ricon_set\tnerd\nsetup\19litee.calltree\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/litee-calltree.nvim",
    url = "https://github.com/ldelossa/litee-calltree.nvim"
  },
  ["litee-symboltree.nvim"] = {
    config = { "\27LJ\2\2a\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2\fon_open\npanel\ricon_set\tnerd\nsetup\21litee.symboltree\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/litee-symboltree.nvim",
    url = "https://github.com/ldelossa/litee-symboltree.nvim"
  },
  ["litee.nvim"] = {
    config = { "\27LJ\2\2œ\1\0\0\5\0\f\0\0226\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\0\0'\1\3\0B\0\2\0029\0\2\0005\1\b\0005\2\6\0006\3\0\0'\4\4\0B\3\2\0029\3\5\3=\3\a\2=\2\t\0015\2\n\0=\2\v\1B\0\2\1K\0\1\0\npanel\1\0\1\16orientation\nright\ttree\1\0\0\nicons\1\0\1\ricon_set\tnerd\tnerd\20litee.lib.icons\14litee.lib\nsetup\rcodicons\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/litee.nvim",
    url = "https://github.com/ldelossa/litee.nvim"
  },
  ["lsp-format.nvim"] = {
    config = { "\27LJ\2\2~\0\0\5\0\t\0\0146\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0029\2\4\1B\2\1\0016\2\5\0009\2\6\0029\3\a\0009\3\b\0039\4\b\1B\2\3\1K\0\1\0\14on_attach\blsp\vinsert\ntable\nsetup\15lsp-format\frequire\f_config\a_G\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/lsp-format.nvim",
    url = "https://github.com/lukas-reineke/lsp-format.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\2l\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\tnone\1\0\1\tbind\2\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\2f\0\0\3\1\a\0\t6\0\0\0009\0\1\0009\0\2\0-\1\0\0009\1\3\0019\1\4\0019\1\5\1'\2\6\0D\0\3\0\0¿\5\18session_store\15appearance\fgeneral\20ObsessionStatus\afn\bvimà\4\1\0\n\0 \0/6\0\0\0009\0\1\0009\1\2\0009\1\3\0019\1\4\0016\2\5\0'\3\6\0B\2\2\0029\2\a\0025\3\26\0005\4\19\0005\5\b\0005\6\t\0005\a\f\0009\b\n\1'\t\v\0&\b\t\b=\b\n\a9\b\r\1'\t\v\0&\b\t\b=\b\14\a9\b\15\1'\t\v\0&\b\t\b=\b\16\a9\b\17\1'\t\v\0&\b\t\b=\b\17\a=\a\18\6>\6\3\5=\5\20\0045\5\21\0=\5\22\0045\5\24\0003\6\23\0>\6\1\5=\5\25\4=\4\27\0035\4\28\0=\4\29\0035\4\30\0=\4\31\3B\2\2\0012\0\0ÄK\0\1\0\foptions\1\0\1\17globalstatus\2\15extensions\1\4\0\0\14nvim-tree\rfugitive\rquickfix\rsections\1\0\0\14lualine_z\1\3\0\0\0\rlocation\0\14lualine_c\1\4\0\0\rfilename\17g:coc_status#require(\"lsp-status\").status()\14lualine_b\1\0\0\fsymbols\thint\tinfo\16information\twarn\fwarning\1\0\0\6 \nerror\1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\nsetup\flualine\frequire\nsigns\15appearance\blsp\f_config\a_G\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\2∆\4\0\0\4\0\21\0%6\0\0\0009\0\1\0009\0\2\0'\1\3\0005\2\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\1\5\0005\2\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\1\a\0005\2\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\1\t\0005\2\n\0B\0\3\0016\0\v\0'\1\f\0B\0\2\0029\0\r\0005\1\14\0005\2\15\0=\2\16\0015\2\18\0005\3\17\0=\3\19\2=\2\20\1B\0\2\1K\0\1\0\15filesystem\19filtered_items\1\0\2\24follow_current_file\2\27use_libuv_file_watcher\2\1\0\2\20hide_gitignored\1\18hide_dotfiles\1\vwindow\1\0\1\nwidth\3\30\1\0\1\25close_if_last_window\2\nsetup\rneo-tree\frequire\1\0\2\ttext\bÔ†¥\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\tÔÅö \vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\tÔÅ± \vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\tÔÅó \vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn\bvim\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nice-reference.nvim"] = {
    config = { "\27LJ\2\2}\0\0\3\0\a\0\t6\0\0\0009\0\1\0009\0\2\0006\1\4\0'\2\5\0B\1\2\0029\1\6\1=\1\3\0K\0\1\0\22reference_handler\19nice-reference\frequire\28textDocument/references\rhandlers\blsp\bvim\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nice-reference.nvim",
    url = "https://github.com/wiliamks/nice-reference.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\2µ\5\0\0\5\0 \0i6\0\0\0'\1\1\0B\0\2\0029\1\2\0005\2\30\0004\3\25\0009\4\3\0009\4\4\0049\4\5\4>\4\1\0039\4\3\0009\4\6\0049\4\a\4>\4\2\0039\4\3\0009\4\b\0049\4\t\4>\4\3\0039\4\3\0009\4\6\0049\4\n\4>\4\4\0039\4\3\0009\4\v\0049\4\f\4>\4\5\0039\4\3\0009\4\v\0049\4\r\4>\4\6\0039\4\3\0009\4\v\0049\4\14\4>\4\a\0039\4\3\0009\4\v\0049\4\15\4>\4\b\0039\4\3\0009\4\v\0049\4\16\4>\4\t\0039\4\3\0009\4\v\0049\4\17\4>\4\n\0039\4\3\0009\4\v\0049\4\18\4>\4\v\0039\4\3\0009\4\v\0049\4\19\4>\4\f\0039\4\3\0009\4\v\0049\4\20\4>\4\r\0039\4\3\0009\4\v\0049\4\21\4>\4\14\0039\4\3\0009\4\4\0049\4\22\4>\4\15\0039\4\3\0009\4\4\0049\4\14\4>\4\16\0039\4\3\0009\4\4\0049\4\23\4>\4\17\0039\4\3\0009\4\4\0049\4\24\4>\4\18\0039\4\3\0009\4\4\0049\4\25\4>\4\19\0039\4\3\0009\4\4\0049\4\26\4>\4\20\0039\4\3\0009\4\4\0049\4\26\4>\4\21\0039\4\3\0009\4\4\0049\4\27\4>\4\22\0039\4\3\0009\4\4\0049\4\28\4>\4\23\0039\4\3\0009\4\4\0049\4\29\4>\4\24\3=\3\31\2B\1\2\1K\0\1\0\fsources\1\0\0\fxmllint\ttidy\ntaplo\15lua_format\16latexindent\ffixjson\vdjlint\vasmfmt\ryamllint\tvint\rsqlfluff\vselene\17markdownlint\rjsonlint\rhadolint\fcue_fmt\vchktex\14checkmake\16diagnostics\ttags\rgitsigns\17code_actions\nspell\15completion\vstylua\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2M\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\2-\0\1\3\1\2\0\5-\1\0\0009\1\0\0019\2\1\0B\1\2\1K\0\1\0\3¿\tbody\15lsp_expandÜ\1\0\1\3\2\4\0\23-\1\0\0009\1\0\1)\2ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\0\0009\1\1\1)\2ˇˇB\1\2\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\v\1\1\0X\1\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\1¿\rcomplete\fvisible\tjump\rjumpable—\1\0\1\4\2\b\0\26-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\tÄ-\1\0\0009\1\1\0015\2\4\0-\3\0\0009\3\2\0039\3\3\3=\3\5\2B\1\2\1X\1\vÄ-\1\1\0009\1\6\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\a\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\19expand_or_jump\23expand_or_jumpable\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\fvisible—\1\0\1\4\2\b\0\26-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\tÄ-\1\0\0009\1\1\0015\2\4\0-\3\0\0009\3\2\0039\3\3\3=\3\5\2B\1\2\1X\1\vÄ-\1\1\0009\1\6\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\a\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\19expand_or_jump\23expand_or_jumpable\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\fvisibleŸ\b\1\0\v\0A\0w6\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0026\2\2\0'\3\4\0B\2\2\0026\3\2\0'\4\5\0B\3\2\0029\4\6\0015\5\n\0005\6\b\0003\a\a\0=\a\t\6=\6\v\0055\6\15\0009\a\f\0019\b\f\0019\b\r\bB\b\1\0025\t\14\0B\a\3\2=\a\16\0069\a\f\0019\b\f\0019\b\17\bB\b\1\0025\t\18\0B\a\3\2=\a\19\0069\a\20\0019\a\21\a=\a\22\0069\a\f\0013\b\23\0005\t\24\0B\a\3\2=\a\25\0069\a\f\0015\b\27\0003\t\26\0=\t\28\b3\t\29\0=\t\30\bB\a\2\2=\a\31\0069\a\f\0019\a \a5\b#\0009\t!\0019\t\"\t=\t$\bB\a\2\2=\a%\6=\6\f\0059\6\20\0019\6&\0064\a\5\0005\b'\0>\b\1\a5\b(\0>\b\2\a5\b)\0>\b\3\a5\b*\0>\b\4\a4\b\3\0005\t+\0>\t\1\bB\6\3\2=\6&\0055\0060\0009\a,\0025\b-\0005\t.\0=\t/\bB\a\2\2=\a1\6=\0062\0055\0063\0=\0064\5B\4\2\0019\4\6\0019\0045\4'\0056\0005\0068\0004\a\3\0005\b7\0>\b\1\a=\a&\6B\4\3\0019\4\6\0019\0045\4'\0059\0005\6<\0009\a\20\0019\a&\a4\b\3\0005\t:\0>\t\1\b4\t\3\0005\n;\0>\n\1\tB\a\3\2=\a&\6B\4\3\0019\4=\0006\5\2\0'\6?\0B\5\2\0029\5@\0059\6=\0009\6>\6B\5\2\2=\5>\0042\0\0ÄK\0\1\0\24update_capabilities\17cmp_nvim_lsp\17capabilities\blsp\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\17experimental\1\0\1\15ghost_text\2\15formatting\vformat\1\0\0\tmenu\1\0\6\fcmdline\14[CmdLine]\rnvim_lua\n[Lua]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\vcrates\r[Crates]\fluasnip\14[LuaSnip]\1\0\1\14with_text\2\15cmp_format\1\0\1\tname\vbuffer\1\0\1\tname\vcrates\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\fsources\t<CR>\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\n<Tab>\6c\0\6i\1\0\0\0\f<S-Tab>\1\3\0\0\6i\6c\0\n<C-y>\fdisable\vconfig\n<C-k>\1\3\0\0\6i\6c\21select_prev_item\n<C-j>\1\0\0\1\3\0\0\6i\6c\21select_next_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\flspkind\bcmp\frequire\f_config\a_G\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\2\30\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\topen\31\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclose\31\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclose⁄\1\1\0\4\0\14\0\0256\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\1B\2\1\0019\2\4\0009\2\5\0029\2\6\0023\3\b\0=\3\a\0029\2\4\0009\2\t\0029\2\n\0023\3\v\0=\3\a\0029\2\4\0009\2\t\0029\2\f\0023\3\r\0=\3\a\0022\0\0ÄK\0\1\0\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\nsetup\ndapui\bdap\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\2\20\0\1\2\0\1\0\0029\1\0\0L\1\2\0\tnameJ\0\2\4\1\4\0\t\18\3\0\0009\2\0\0B\2\2\1-\2\0\0009\2\1\0029\2\2\0029\3\3\0B\2\2\1K\0\1\0\3\0\tname\16init_server\blsp\finstallï\3\1\0\r\4\17\0<-\0\0\0009\0\0\0B\0\1\0024\1\0\0004\2\0\0006\3\1\0\18\4\0\0B\3\2\4X\6\29Ä-\b\1\0009\b\2\b\18\n\a\0009\t\3\aB\t\2\0026\n\4\0009\n\5\n9\n\6\nB\b\3\2-\t\1\0009\t\2\t-\n\2\0\18\v\a\0B\t\3\2\15\0\b\0X\n\rÄ\15\0\t\0X\n\6Ä6\n\a\0009\n\b\n\18\v\2\0\18\f\a\0B\n\3\1X\n\5Ä6\n\a\0009\n\b\n\18\v\1\0\18\f\a\0B\n\3\1E\6\3\3R\6·\127\21\3\2\0)\4\1\0\1\3\4\0X\3\15Ä6\3\4\0009\3\t\0039\3\n\3\18\4\1\0005\5\f\0'\6\v\0006\a\4\0009\a\5\a9\a\6\a&\6\a\6=\6\r\0053\6\14\0=\6\15\0053\6\16\0B\3\4\1K\0\1\0\2¿\1¿\3¿\0¿\0\16format_item\0\vprompt\1\0\0\30Choose a ls for filetype \vselect\aui\vinsert\ntable\rfiletype\abo\bvim\28get_supported_filetypes\fin_list\vipairs\26get_available_serversÙ\1\0\0\v\3\t\0&-\0\0\0009\0\0\0009\0\1\0006\1\2\0-\2\1\0B\1\2\4X\4\28Ä-\6\2\0009\6\3\6\18\a\0\0009\b\4\5B\6\3\2-\a\2\0009\a\3\a-\b\0\0009\b\0\b9\b\5\b9\t\4\5B\a\3\2\14\0\6\0X\b\14Ä\14\0\a\0X\b\fÄ-\b\0\0009\b\0\b9\b\6\b9\t\4\5B\b\2\0016\b\a\0009\b\b\b-\t\0\0009\t\0\t9\t\5\t9\n\4\5B\b\3\1E\4\3\3R\4‚\127K\0\1\0\0¿\3¿\1¿\vinsert\ntable\16init_server\24initialized_servers\tname\fin_list\vipairs\14blacklist\blsp≥\2\1\0\b\0\18\0\0316\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0026\2\2\0'\3\4\0B\2\2\0029\3\5\0025\4\6\0B\3\2\0019\3\a\2B\3\1\0026\4\b\0009\4\t\0049\4\n\0045\5\v\0005\6\r\0003\a\f\0=\a\14\6B\4\3\0016\4\b\0009\4\t\0049\4\n\0045\5\15\0005\6\17\0003\a\16\0=\a\14\6B\4\3\0012\0\0ÄK\0\1\0\1\0\0\0\1\2\0\0\rBufEnter\rcallback\1\0\0\0\1\2\0\0\fBufRead\24nvim_create_autocmd\bapi\bvim\26get_installed_servers\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\17config.utils\frequire\f_config\a_G\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "nvim-lsp-installer" },
    loaded = true,
    only_config = true
  },
  ["nvim-lspupdate"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-lspupdate",
    url = "https://github.com/alexaandru/nvim-lspupdate"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\0022\0\0\3\0\3\0\0066\0\0\0006\1\2\0'\2\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-regexplainer"] = {
    config = { "\27LJ\2\2:\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17regexplainer\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-regexplainer",
    url = "https://github.com/bennypowers/nvim-regexplainer"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2‹\4\0\0\5\0\27\0\0316\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\5\0005\2\3\0004\3\0\0=\3\4\2=\2\6\0015\2\b\0005\3\a\0=\3\t\0025\3\n\0005\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\2=\2\26\1B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\14set_jumps\2\venable\2\tswap\18swap_previous\1\0\1\r<space><\21@parameter.inner\14swap_next\1\0\1\14<leader>>\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\1\0\3\15lookbehind\2\14lookahead\1\venable\2\15playground\1\0\0\fdisable\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\2C\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\2g\0\0\4\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\1\3\0006\2\0\0009\2\1\0029\2\4\2B\2\1\2'\3\5\0&\2\3\2'\3\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvimã\t\1\0\f\0005\0c6\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0026\2\4\0009\2\5\0029\2\6\2'\3\a\0B\2\2\2'\3\b\0&\2\3\2\18\3\2\0'\4\t\0&\3\4\3\18\4\2\0'\5\n\0&\4\5\0046\5\4\0009\5\5\0059\5\v\5'\6\f\0005\a\r\0B\5\3\0016\5\4\0009\5\5\0059\5\v\5'\6\14\0005\a\15\0B\5\3\0016\5\4\0009\5\5\0059\5\v\5'\6\16\0005\a\17\0B\5\3\0016\5\4\0009\5\5\0059\5\v\5'\6\18\0005\a\19\0B\5\3\0016\5\2\0'\6\20\0B\5\2\0029\5\21\0055\6\25\0005\a\22\0005\b\23\0=\b\24\a=\a\26\0065\a\28\0004\b\3\0006\t\4\0009\t\5\t9\t\6\t'\n\a\0B\t\2\2'\n\27\0&\t\n\t>\t\1\b=\b\29\a9\b\30\0019\t\31\0009\t \tB\b\2\2=\b \a9\b\31\0009\b!\b=\b!\a5\b%\0005\t#\0005\n\"\0=\n$\t=\t&\b=\b'\a=\a(\0065\a+\0006\b\2\0'\t)\0B\b\2\0029\b*\b\18\t\3\0\18\n\4\0B\b\3\2=\b,\a5\b1\0004\t\3\0005\n-\0003\v.\0=\v/\n4\v\0\0=\v0\n>\n\1\t=\t2\b=\b3\a=\a4\6B\5\2\1K\0\1\0\bdap\19configurations\trust\1\0\0\targs\fprogram\0\1\0\5\16stopOnEntry\1\tname\vLaunch\ttype\tlldb\frequest\vlaunch\bcwd\23${workspaceFolder}\fadapter\1\0\0\25get_codelldb_adapter\19rust-tools.dap\vserver\rsettings\18rust-analyzer\1\0\0\16checkOnSave\1\0\0\1\0\1\fcommand\vclippy\17capabilities\14on_attach\blsp\14merge_fns\bcmd\1\0\0$/lsp_servers/rust/rust-analyzer\ntools\1\0\0\18hover_actions\1\0\1\15auto_focus\2\1\0\2\23hover_with_actions\2\17autoSetHints\2\nsetup\15rust-tools\1\0\4\vtexthl\bred\ttext\bÔÅû\vlinehl\5\nnumhl\5\26DapBreakpointRejected\1\0\4\vtexthl\bred\ttext\vÔëÑ·∂´\vlinehl\5\nnumhl\5\16DapLogPoint\1\0\4\vtexthl\bred\ttext\vÔëÑ·∂ú\vlinehl\5\nnumhl\5\27DapBreakpointCondition\1\0\4\vtexthl\bred\ttext\bÔëÑ\vlinehl\5\nnumhl\5\18DapBreakpoint\16sign_define\24lldb/lib/liblldb.so\21adapter/codelldb$/dapinstall/codelldb/extension/\tdata\fstdpath\afn\bvim\17config.utils\frequire\f_config\a_G\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/Freyskeyd/rust-tools.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\2Û\4\0\0\a\0\30\00186\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\1\3\0015\2\20\0005\3\4\0006\4\0\0'\5\5\0B\4\2\0029\4\6\4=\4\a\0036\4\0\0'\5\b\0B\4\2\0029\4\t\0049\4\n\4=\4\v\0035\4\17\0005\5\f\0009\6\r\0=\6\14\0059\6\15\0=\6\16\5=\5\18\4=\4\19\3=\3\21\0025\3\23\0005\4\22\0=\4\24\0034\4\3\0006\5\0\0'\6\25\0B\5\2\0029\5\26\0054\6\0\0B\5\2\0?\5\0\0=\4\27\3=\3\28\2B\1\2\0016\1\0\0'\2\2\0B\1\2\0029\1\29\1'\2\24\0B\1\2\0016\1\0\0'\2\2\0B\1\2\0029\1\29\1'\2\27\0B\1\2\1K\0\1\0\19load_extension\15extensions\14ui-select\17get_dropdown\21telescope.themes\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\rmappings\6i\1\0\0\n<C-j>\24move_selection_next\n<C-k>\28move_selection_previous\1\0\2\n<C-n>\1\n<C-p>\1\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\16file_sorter\19get_fzy_sorter\22telescope.sorters\1\0\1\19color_devicons\2\nsetup\14telescope\22telescope.actions\frequire\3ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\2Ï\1\0\0\4\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\3\0005\3\4\0=\3\5\2=\2\a\1B\0\2\1K\0\1\0\vsearch\1\0\0\targs\1\b\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\25--glob=!node_modules\19--glob=!assets\1\0\2\fpattern\18\\b(KEYWORDS):\fcommand\arg\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\2è\2\0\0\6\0\18\0\0266\0\0\0009\0\1\0009\1\2\0009\1\3\0019\1\4\0016\2\5\0'\3\6\0B\2\2\0029\2\a\0025\3\b\0005\4\t\0=\4\n\0035\4\f\0009\5\v\1=\5\v\0049\5\r\1=\5\r\0049\5\14\1=\5\14\0049\5\15\1=\5\15\0049\5\16\1=\5\17\4=\4\4\3B\2\2\1K\0\1\0\nother\fsuccess\16information\thint\fwarning\1\0\0\nerror\16action_keys\1\0\1\nhover\6h\1\0\3\14auto_open\2\15auto_close\2\fpadding\1\nsetup\ftrouble\frequire\nsigns\15appearance\blsp\f_config\a_G\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\2l\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\tnone\1\0\1\tbind\2\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2‹\4\0\0\5\0\27\0\0316\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\5\0005\2\3\0004\3\0\0=\3\4\2=\2\6\0015\2\b\0005\3\a\0=\3\t\0025\3\n\0005\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\2=\2\26\1B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\14set_jumps\2\venable\2\tswap\18swap_previous\1\0\1\r<space><\21@parameter.inner\14swap_next\1\0\1\14<leader>>\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\1\0\3\15lookbehind\2\14lookahead\1\venable\2\15playground\1\0\0\fdisable\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\2-\0\1\3\1\2\0\5-\1\0\0009\1\0\0019\2\1\0B\1\2\1K\0\1\0\3¿\tbody\15lsp_expandÜ\1\0\1\3\2\4\0\23-\1\0\0009\1\0\1)\2ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\0\0009\1\1\1)\2ˇˇB\1\2\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\v\1\1\0X\1\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\1¿\rcomplete\fvisible\tjump\rjumpable—\1\0\1\4\2\b\0\26-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\tÄ-\1\0\0009\1\1\0015\2\4\0-\3\0\0009\3\2\0039\3\3\3=\3\5\2B\1\2\1X\1\vÄ-\1\1\0009\1\6\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\a\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\19expand_or_jump\23expand_or_jumpable\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\fvisible—\1\0\1\4\2\b\0\26-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\tÄ-\1\0\0009\1\1\0015\2\4\0-\3\0\0009\3\2\0039\3\3\3=\3\5\2B\1\2\1X\1\vÄ-\1\1\0009\1\6\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\a\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\19expand_or_jump\23expand_or_jumpable\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\fvisibleŸ\b\1\0\v\0A\0w6\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0026\2\2\0'\3\4\0B\2\2\0026\3\2\0'\4\5\0B\3\2\0029\4\6\0015\5\n\0005\6\b\0003\a\a\0=\a\t\6=\6\v\0055\6\15\0009\a\f\0019\b\f\0019\b\r\bB\b\1\0025\t\14\0B\a\3\2=\a\16\0069\a\f\0019\b\f\0019\b\17\bB\b\1\0025\t\18\0B\a\3\2=\a\19\0069\a\20\0019\a\21\a=\a\22\0069\a\f\0013\b\23\0005\t\24\0B\a\3\2=\a\25\0069\a\f\0015\b\27\0003\t\26\0=\t\28\b3\t\29\0=\t\30\bB\a\2\2=\a\31\0069\a\f\0019\a \a5\b#\0009\t!\0019\t\"\t=\t$\bB\a\2\2=\a%\6=\6\f\0059\6\20\0019\6&\0064\a\5\0005\b'\0>\b\1\a5\b(\0>\b\2\a5\b)\0>\b\3\a5\b*\0>\b\4\a4\b\3\0005\t+\0>\t\1\bB\6\3\2=\6&\0055\0060\0009\a,\0025\b-\0005\t.\0=\t/\bB\a\2\2=\a1\6=\0062\0055\0063\0=\0064\5B\4\2\0019\4\6\0019\0045\4'\0056\0005\0068\0004\a\3\0005\b7\0>\b\1\a=\a&\6B\4\3\0019\4\6\0019\0045\4'\0059\0005\6<\0009\a\20\0019\a&\a4\b\3\0005\t:\0>\t\1\b4\t\3\0005\n;\0>\n\1\tB\a\3\2=\a&\6B\4\3\0019\4=\0006\5\2\0'\6?\0B\5\2\0029\5@\0059\6=\0009\6>\6B\5\2\2=\5>\0042\0\0ÄK\0\1\0\24update_capabilities\17cmp_nvim_lsp\17capabilities\blsp\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\17experimental\1\0\1\15ghost_text\2\15formatting\vformat\1\0\0\tmenu\1\0\6\fcmdline\14[CmdLine]\rnvim_lua\n[Lua]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\vcrates\r[Crates]\fluasnip\14[LuaSnip]\1\0\1\14with_text\2\15cmp_format\1\0\1\tname\vbuffer\1\0\1\tname\vcrates\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\fsources\t<CR>\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\n<Tab>\6c\0\6i\1\0\0\0\f<S-Tab>\1\3\0\0\6i\6c\0\n<C-y>\fdisable\vconfig\n<C-k>\1\3\0\0\6i\6c\21select_prev_item\n<C-j>\1\0\0\1\3\0\0\6i\6c\21select_next_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\flspkind\bcmp\frequire\f_config\a_G\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: DAPInstall.nvim
time([[Config for DAPInstall.nvim]], true)
try_loadstring("\27LJ\2\2ì\1\0\0\5\0\n\0\0156\0\0\0'\1\1\0B\0\2\0029\1\2\0005\2\b\0006\3\3\0009\3\4\0039\3\5\3'\4\6\0B\3\2\2'\4\a\0&\3\4\3=\3\t\2B\1\2\1K\0\1\0\22installation_path\1\0\0\17/dapinstall/\tdata\fstdpath\afn\bvim\nsetup\16dap-install\frequire\0", "config", "DAPInstall.nvim")
time([[Config for DAPInstall.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\2≠\1\0\0\2\0\b\0\v6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\4\0'\1\5\0B\0\2\0029\0\6\0005\1\a\0B\0\2\1K\0\1\0\1\0\1\25show_current_context\2\nsetup\21indent_blankline\frequire\1\2\0\0\27neo-tree filesystem .*%indent_blankline_bufname_exclude\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\0022\0\0\3\0\3\0\0066\0\0\0006\1\2\0'\2\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: cutlass.nvim
time([[Config for cutlass.nvim]], true)
try_loadstring("\27LJ\2\0029\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\fcutlass\frequire\0", "config", "cutlass.nvim")
time([[Config for cutlass.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\2∆\4\0\0\4\0\21\0%6\0\0\0009\0\1\0009\0\2\0'\1\3\0005\2\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\1\5\0005\2\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\1\a\0005\2\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\1\t\0005\2\n\0B\0\3\0016\0\v\0'\1\f\0B\0\2\0029\0\r\0005\1\14\0005\2\15\0=\2\16\0015\2\18\0005\3\17\0=\3\19\2=\2\20\1B\0\2\1K\0\1\0\15filesystem\19filtered_items\1\0\2\24follow_current_file\2\27use_libuv_file_watcher\2\1\0\2\20hide_gitignored\1\18hide_dotfiles\1\vwindow\1\0\1\nwidth\3\30\1\0\1\25close_if_last_window\2\nsetup\rneo-tree\frequire\1\0\2\ttext\bÔ†¥\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\tÔÅö \vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\tÔÅ± \vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\tÔÅó \vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn\bvim\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: nice-reference.nvim
time([[Config for nice-reference.nvim]], true)
try_loadstring("\27LJ\2\2}\0\0\3\0\a\0\t6\0\0\0009\0\1\0009\0\2\0006\1\4\0'\2\5\0B\1\2\0029\1\6\1=\1\3\0K\0\1\0\22reference_handler\19nice-reference\frequire\28textDocument/references\rhandlers\blsp\bvim\0", "config", "nice-reference.nvim")
time([[Config for nice-reference.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\2\30\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\topen\31\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclose\31\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclose⁄\1\1\0\4\0\14\0\0256\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\1B\2\1\0019\2\4\0009\2\5\0029\2\6\0023\3\b\0=\3\a\0029\2\4\0009\2\t\0029\2\n\0023\3\v\0=\3\a\0029\2\4\0009\2\t\0029\2\f\0023\3\r\0=\3\a\0022\0\0ÄK\0\1\0\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\nsetup\ndapui\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\2Ñ\2\0\0\6\0\15\0\0186\0\0\0009\0\1\0009\1\2\0009\1\3\0019\1\4\0016\2\5\0'\3\6\0B\2\2\0029\2\a\0025\3\v\0005\4\b\0009\5\t\1=\5\n\4=\4\f\0035\4\r\0=\4\14\3B\2\2\1K\0\1\0\ntimer\1\0\3\15task_decay\3Ë\a\17spinner_rate\0032\17fidget_decay\3–\15\ttext\1\0\0\tdone\fsuccess\1\0\3\14commenced\fStarted\14completed\14Completed\fspinner\barc\nsetup\vfidget\frequire\nsigns\15appearance\blsp\f_config\a_G\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
try_loadstring("\27LJ\2\2g\0\0\4\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\1\3\0006\2\0\0009\2\1\0029\2\4\2B\2\1\2'\3\5\0&\2\3\2'\3\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvimã\t\1\0\f\0005\0c6\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0026\2\4\0009\2\5\0029\2\6\2'\3\a\0B\2\2\2'\3\b\0&\2\3\2\18\3\2\0'\4\t\0&\3\4\3\18\4\2\0'\5\n\0&\4\5\0046\5\4\0009\5\5\0059\5\v\5'\6\f\0005\a\r\0B\5\3\0016\5\4\0009\5\5\0059\5\v\5'\6\14\0005\a\15\0B\5\3\0016\5\4\0009\5\5\0059\5\v\5'\6\16\0005\a\17\0B\5\3\0016\5\4\0009\5\5\0059\5\v\5'\6\18\0005\a\19\0B\5\3\0016\5\2\0'\6\20\0B\5\2\0029\5\21\0055\6\25\0005\a\22\0005\b\23\0=\b\24\a=\a\26\0065\a\28\0004\b\3\0006\t\4\0009\t\5\t9\t\6\t'\n\a\0B\t\2\2'\n\27\0&\t\n\t>\t\1\b=\b\29\a9\b\30\0019\t\31\0009\t \tB\b\2\2=\b \a9\b\31\0009\b!\b=\b!\a5\b%\0005\t#\0005\n\"\0=\n$\t=\t&\b=\b'\a=\a(\0065\a+\0006\b\2\0'\t)\0B\b\2\0029\b*\b\18\t\3\0\18\n\4\0B\b\3\2=\b,\a5\b1\0004\t\3\0005\n-\0003\v.\0=\v/\n4\v\0\0=\v0\n>\n\1\t=\t2\b=\b3\a=\a4\6B\5\2\1K\0\1\0\bdap\19configurations\trust\1\0\0\targs\fprogram\0\1\0\5\16stopOnEntry\1\tname\vLaunch\ttype\tlldb\frequest\vlaunch\bcwd\23${workspaceFolder}\fadapter\1\0\0\25get_codelldb_adapter\19rust-tools.dap\vserver\rsettings\18rust-analyzer\1\0\0\16checkOnSave\1\0\0\1\0\1\fcommand\vclippy\17capabilities\14on_attach\blsp\14merge_fns\bcmd\1\0\0$/lsp_servers/rust/rust-analyzer\ntools\1\0\0\18hover_actions\1\0\1\15auto_focus\2\1\0\2\23hover_with_actions\2\17autoSetHints\2\nsetup\15rust-tools\1\0\4\vtexthl\bred\ttext\bÔÅû\vlinehl\5\nnumhl\5\26DapBreakpointRejected\1\0\4\vtexthl\bred\ttext\vÔëÑ·∂´\vlinehl\5\nnumhl\5\16DapLogPoint\1\0\4\vtexthl\bred\ttext\vÔëÑ·∂ú\vlinehl\5\nnumhl\5\27DapBreakpointCondition\1\0\4\vtexthl\bred\ttext\bÔëÑ\vlinehl\5\nnumhl\5\18DapBreakpoint\16sign_define\24lldb/lib/liblldb.so\21adapter/codelldb$/dapinstall/codelldb/extension/\tdata\fstdpath\afn\bvim\17config.utils\frequire\f_config\a_G\0", "config", "rust-tools.nvim")
time([[Config for rust-tools.nvim]], false)
-- Config for: crates.nvim
time([[Config for crates.nvim]], true)
try_loadstring("\27LJ\2\0024\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0", "config", "crates.nvim")
time([[Config for crates.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\2M\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lsp-format.nvim
time([[Config for lsp-format.nvim]], true)
try_loadstring("\27LJ\2\2~\0\0\5\0\t\0\0146\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0029\2\4\1B\2\1\0016\2\5\0009\2\6\0029\3\a\0009\3\b\0039\4\b\1B\2\3\1K\0\1\0\14on_attach\blsp\vinsert\ntable\nsetup\15lsp-format\frequire\f_config\a_G\0", "config", "lsp-format.nvim")
time([[Config for lsp-format.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\2¥\1\0\1\a\2\b\0\0264\1\0\0-\2\0\0009\2\1\2-\3\1\0009\3\2\0039\3\0\3B\2\2\2=\2\0\1-\2\1\0009\2\2\0029\2\3\2=\2\3\1-\2\1\0009\2\2\0029\2\4\0028\2\0\2\n\2\0\0X\3\aÄ6\3\5\0009\3\6\3'\4\a\0\18\5\1\0\18\6\2\0B\3\4\2\18\1\3\0L\1\2\0\1¿\0¿\tkeep\20tbl_deep_extend\bvim\als\17capabilities\blsp\14merge_fns\14on_attachI\0\1\4\1\3\0\n6\1\0\0'\2\1\0B\1\2\0028\1\0\0019\1\2\1-\2\0\0\18\3\0\0B\2\2\0A\1\0\1K\0\1\0\2¿\nsetup\14lspconfig\frequireä\6\1\0\14\0+\0N6\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0023\2\4\0009\3\5\0003\4\a\0=\4\6\0039\3\5\0009\3\b\0039\3\t\0035\4\f\0009\5\n\3'\6\v\0&\5\6\5=\5\r\0049\5\14\3'\6\v\0&\5\6\5=\5\15\0049\5\16\3'\6\v\0&\5\6\5=\5\17\0049\5\18\3'\6\v\0&\5\6\5=\5\19\0046\5\20\0\18\6\4\0B\5\2\4H\b\fÄ'\n\21\0\18\v\b\0&\n\v\n6\v\22\0009\v\23\v9\v\24\v\18\f\n\0005\r\25\0=\t\26\r=\n\27\r=\n\28\rB\v\3\1F\b\3\3R\bÚ\1276\5\22\0009\5\29\0059\5\30\0055\6\31\0005\a \0=\a!\6B\5\2\0016\5\22\0009\5\"\5)\6˙\0=\6#\0056\5\22\0009\5$\5'\6%\0B\5\2\0016\5\22\0009\5\5\0059\5&\0059\6(\1'\a)\0B\6\2\2=\6'\0056\5\22\0009\5\5\0059\5&\0059\6(\1'\a)\0B\6\2\2=\6*\0052\0\0ÄK\0\1\0 textDocument/implementation\vvsplit\20goto_definition\28textDocument/definition\rhandlersgautocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope=\"cursor\"})\bcmd\15updatetime\6o\nfloat\1\0\1\vborder\tnone\1\0\3\14underline\2\nsigns\2\17virtual_text\1\vconfig\15diagnostic\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\bvim\19DiagnosticSign\npairs\tInfo\16information\tHint\thint\tWarn\fwarning\nError\1\0\0\6 \nerror\nsigns\15appearance\0\16init_server\blsp\0\17config.utils\frequire\f_config\a_G\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\2Û\4\0\0\a\0\30\00186\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\1\3\0015\2\20\0005\3\4\0006\4\0\0'\5\5\0B\4\2\0029\4\6\4=\4\a\0036\4\0\0'\5\b\0B\4\2\0029\4\t\0049\4\n\4=\4\v\0035\4\17\0005\5\f\0009\6\r\0=\6\14\0059\6\15\0=\6\16\5=\5\18\4=\4\19\3=\3\21\0025\3\23\0005\4\22\0=\4\24\0034\4\3\0006\5\0\0'\6\25\0B\5\2\0029\5\26\0054\6\0\0B\5\2\0?\5\0\0=\4\27\3=\3\28\2B\1\2\0016\1\0\0'\2\2\0B\1\2\0029\1\29\1'\2\24\0B\1\2\0016\1\0\0'\2\2\0B\1\2\0029\1\29\1'\2\27\0B\1\2\1K\0\1\0\19load_extension\15extensions\14ui-select\17get_dropdown\21telescope.themes\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\rmappings\6i\1\0\0\n<C-j>\24move_selection_next\n<C-k>\28move_selection_previous\1\0\2\n<C-n>\1\n<C-p>\1\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\16file_sorter\19get_fzy_sorter\22telescope.sorters\1\0\1\19color_devicons\2\nsetup\14telescope\22telescope.actions\frequire\3ÄÄ¿ô\4\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\2f\0\0\3\1\a\0\t6\0\0\0009\0\1\0009\0\2\0-\1\0\0009\1\3\0019\1\4\0019\1\5\1'\2\6\0D\0\3\0\0¿\5\18session_store\15appearance\fgeneral\20ObsessionStatus\afn\bvimà\4\1\0\n\0 \0/6\0\0\0009\0\1\0009\1\2\0009\1\3\0019\1\4\0016\2\5\0'\3\6\0B\2\2\0029\2\a\0025\3\26\0005\4\19\0005\5\b\0005\6\t\0005\a\f\0009\b\n\1'\t\v\0&\b\t\b=\b\n\a9\b\r\1'\t\v\0&\b\t\b=\b\14\a9\b\15\1'\t\v\0&\b\t\b=\b\16\a9\b\17\1'\t\v\0&\b\t\b=\b\17\a=\a\18\6>\6\3\5=\5\20\0045\5\21\0=\5\22\0045\5\24\0003\6\23\0>\6\1\5=\5\25\4=\4\27\0035\4\28\0=\4\29\0035\4\30\0=\4\31\3B\2\2\0012\0\0ÄK\0\1\0\foptions\1\0\1\17globalstatus\2\15extensions\1\4\0\0\14nvim-tree\rfugitive\rquickfix\rsections\1\0\0\14lualine_z\1\3\0\0\0\rlocation\0\14lualine_c\1\4\0\0\rfilename\17g:coc_status#require(\"lsp-status\").status()\14lualine_b\1\0\0\fsymbols\thint\tinfo\16information\twarn\fwarning\1\0\0\6 \nerror\1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\nsetup\flualine\frequire\nsigns\15appearance\blsp\f_config\a_G\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\2C\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: legendary.nvim
time([[Config for legendary.nvim]], true)
try_loadstring("\27LJ\2\2≠\2\0\0\f\0\15\0%4\0\0\0006\1\0\0009\1\1\0019\1\2\0016\2\3\0\18\3\1\0B\2\2\4X\5\15Ä6\a\4\0009\a\5\a\18\b\0\0005\t\a\0:\n\2\6>\n\1\t:\n\3\6>\n\2\t9\n\6\6=\n\6\t4\n\3\0:\v\1\6>\v\1\n=\n\b\tB\a\3\1E\5\3\3R\5Ô\1276\2\t\0'\3\n\0B\2\2\0029\2\v\0025\3\f\0=\0\2\0034\4\0\0=\4\r\0034\4\0\0=\4\14\3B\2\2\1K\0\1\0\rautocmds\rcommands\1\0\2\28most_recent_item_at_top\2\20include_builtin\2\nsetup\14legendary\frequire\tmode\1\0\0\16description\vinsert\ntable\vipairs\fkeymaps\f_config\a_G\0", "config", "legendary.nvim")
time([[Config for legendary.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\2è\2\0\0\6\0\18\0\0266\0\0\0009\0\1\0009\1\2\0009\1\3\0019\1\4\0016\2\5\0'\3\6\0B\2\2\0029\2\a\0025\3\b\0005\4\t\0=\4\n\0035\4\f\0009\5\v\1=\5\v\0049\5\r\1=\5\r\0049\5\14\1=\5\14\0049\5\15\1=\5\15\0049\5\16\1=\5\17\4=\4\4\3B\2\2\1K\0\1\0\nother\fsuccess\16information\thint\fwarning\1\0\0\nerror\16action_keys\1\0\1\nhover\6h\1\0\3\14auto_open\2\15auto_close\2\fpadding\1\nsetup\ftrouble\frequire\nsigns\15appearance\blsp\f_config\a_G\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: litee.nvim
time([[Config for litee.nvim]], true)
try_loadstring("\27LJ\2\2œ\1\0\0\5\0\f\0\0226\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\0\0'\1\3\0B\0\2\0029\0\2\0005\1\b\0005\2\6\0006\3\0\0'\4\4\0B\3\2\0029\3\5\3=\3\a\2=\2\t\0015\2\n\0=\2\v\1B\0\2\1K\0\1\0\npanel\1\0\1\16orientation\nright\ttree\1\0\0\nicons\1\0\1\ricon_set\tnerd\tnerd\20litee.lib.icons\14litee.lib\nsetup\rcodicons\frequire\0", "config", "litee.nvim")
time([[Config for litee.nvim]], false)
-- Config for: litee-calltree.nvim
time([[Config for litee-calltree.nvim]], true)
try_loadstring("\27LJ\2\2_\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2\fon_open\npanel\ricon_set\tnerd\nsetup\19litee.calltree\frequire\0", "config", "litee-calltree.nvim")
time([[Config for litee-calltree.nvim]], false)
-- Config for: nvim-regexplainer
time([[Config for nvim-regexplainer]], true)
try_loadstring("\27LJ\2\2:\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17regexplainer\frequire\0", "config", "nvim-regexplainer")
time([[Config for nvim-regexplainer]], false)
-- Config for: litee-symboltree.nvim
time([[Config for litee-symboltree.nvim]], true)
try_loadstring("\27LJ\2\2a\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2\fon_open\npanel\ricon_set\tnerd\nsetup\21litee.symboltree\frequire\0", "config", "litee-symboltree.nvim")
time([[Config for litee-symboltree.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\2:\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\2Ï\1\0\0\4\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\3\0005\3\4\0=\3\5\2=\2\a\1B\0\2\1K\0\1\0\vsearch\1\0\0\targs\1\b\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\25--glob=!node_modules\19--glob=!assets\1\0\2\fpattern\18\\b(KEYWORDS):\fcommand\arg\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\2ù\1\0\4\14\1\6\0\30'\4\0\0006\5\1\0\18\6\2\0B\5\2\4H\b\22Ä\a\b\2\0X\n\6Ä-\n\0\0009\n\2\n'\v\3\0&\n\v\n\14\0\n\0X\v\nÄ\a\b\4\0X\n\6Ä-\n\0\0009\n\4\n'\v\3\0&\n\v\n\14\0\n\0X\v\2Ä-\n\0\0009\n\5\n\18\v\4\0\18\f\t\0\18\r\n\0&\4\r\vF\b\3\3R\bË\127L\4\2\0\1¿\thint\fwarning\6 \nerror\npairs\5‘\1\1\0\6\0\r\0\0176\0\0\0009\0\1\0009\1\2\0009\1\3\0019\1\4\0016\2\5\0'\3\6\0B\2\2\0029\2\a\0025\3\v\0005\4\b\0003\5\t\0=\5\n\4=\4\f\3B\2\2\0012\0\0ÄK\0\1\0\foptions\1\0\0\26diagnostics_indicator\0\1\0\2\16diagnostics\rnvim_lsp\20separator_style\nslant\nsetup\15bufferline\frequire\nsigns\15appearance\blsp\f_config\a_G\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: copilot.vim
time([[Config for copilot.vim]], true)
try_loadstring("\27LJ\2\2\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "copilot.vim")
time([[Config for copilot.vim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\2µ\5\0\0\5\0 \0i6\0\0\0'\1\1\0B\0\2\0029\1\2\0005\2\30\0004\3\25\0009\4\3\0009\4\4\0049\4\5\4>\4\1\0039\4\3\0009\4\6\0049\4\a\4>\4\2\0039\4\3\0009\4\b\0049\4\t\4>\4\3\0039\4\3\0009\4\6\0049\4\n\4>\4\4\0039\4\3\0009\4\v\0049\4\f\4>\4\5\0039\4\3\0009\4\v\0049\4\r\4>\4\6\0039\4\3\0009\4\v\0049\4\14\4>\4\a\0039\4\3\0009\4\v\0049\4\15\4>\4\b\0039\4\3\0009\4\v\0049\4\16\4>\4\t\0039\4\3\0009\4\v\0049\4\17\4>\4\n\0039\4\3\0009\4\v\0049\4\18\4>\4\v\0039\4\3\0009\4\v\0049\4\19\4>\4\f\0039\4\3\0009\4\v\0049\4\20\4>\4\r\0039\4\3\0009\4\v\0049\4\21\4>\4\14\0039\4\3\0009\4\4\0049\4\22\4>\4\15\0039\4\3\0009\4\4\0049\4\14\4>\4\16\0039\4\3\0009\4\4\0049\4\23\4>\4\17\0039\4\3\0009\4\4\0049\4\24\4>\4\18\0039\4\3\0009\4\4\0049\4\25\4>\4\19\0039\4\3\0009\4\4\0049\4\26\4>\4\20\0039\4\3\0009\4\4\0049\4\26\4>\4\21\0039\4\3\0009\4\4\0049\4\27\4>\4\22\0039\4\3\0009\4\4\0049\4\28\4>\4\23\0039\4\3\0009\4\4\0049\4\29\4>\4\24\3=\3\31\2B\1\2\1K\0\1\0\fsources\1\0\0\fxmllint\ttidy\ntaplo\15lua_format\16latexindent\ffixjson\vdjlint\vasmfmt\ryamllint\tvint\rsqlfluff\vselene\17markdownlint\rjsonlint\rhadolint\fcue_fmt\vchktex\14checkmake\16diagnostics\ttags\rgitsigns\17code_actions\nspell\15completion\vstylua\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\2M\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-lsp-installer ]]

-- Config for: nvim-lsp-installer
try_loadstring("\27LJ\2\2\20\0\1\2\0\1\0\0029\1\0\0L\1\2\0\tnameJ\0\2\4\1\4\0\t\18\3\0\0009\2\0\0B\2\2\1-\2\0\0009\2\1\0029\2\2\0029\3\3\0B\2\2\1K\0\1\0\3\0\tname\16init_server\blsp\finstallï\3\1\0\r\4\17\0<-\0\0\0009\0\0\0B\0\1\0024\1\0\0004\2\0\0006\3\1\0\18\4\0\0B\3\2\4X\6\29Ä-\b\1\0009\b\2\b\18\n\a\0009\t\3\aB\t\2\0026\n\4\0009\n\5\n9\n\6\nB\b\3\2-\t\1\0009\t\2\t-\n\2\0\18\v\a\0B\t\3\2\15\0\b\0X\n\rÄ\15\0\t\0X\n\6Ä6\n\a\0009\n\b\n\18\v\2\0\18\f\a\0B\n\3\1X\n\5Ä6\n\a\0009\n\b\n\18\v\1\0\18\f\a\0B\n\3\1E\6\3\3R\6·\127\21\3\2\0)\4\1\0\1\3\4\0X\3\15Ä6\3\4\0009\3\t\0039\3\n\3\18\4\1\0005\5\f\0'\6\v\0006\a\4\0009\a\5\a9\a\6\a&\6\a\6=\6\r\0053\6\14\0=\6\15\0053\6\16\0B\3\4\1K\0\1\0\2¿\1¿\3¿\0¿\0\16format_item\0\vprompt\1\0\0\30Choose a ls for filetype \vselect\aui\vinsert\ntable\rfiletype\abo\bvim\28get_supported_filetypes\fin_list\vipairs\26get_available_serversÙ\1\0\0\v\3\t\0&-\0\0\0009\0\0\0009\0\1\0006\1\2\0-\2\1\0B\1\2\4X\4\28Ä-\6\2\0009\6\3\6\18\a\0\0009\b\4\5B\6\3\2-\a\2\0009\a\3\a-\b\0\0009\b\0\b9\b\5\b9\t\4\5B\a\3\2\14\0\6\0X\b\14Ä\14\0\a\0X\b\fÄ-\b\0\0009\b\0\b9\b\6\b9\t\4\5B\b\2\0016\b\a\0009\b\b\b-\t\0\0009\t\0\t9\t\5\t9\n\4\5B\b\3\1E\4\3\3R\4‚\127K\0\1\0\0¿\3¿\1¿\vinsert\ntable\16init_server\24initialized_servers\tname\fin_list\vipairs\14blacklist\blsp≥\2\1\0\b\0\18\0\0316\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0026\2\2\0'\3\4\0B\2\2\0029\3\5\0025\4\6\0B\3\2\0019\3\a\2B\3\1\0026\4\b\0009\4\t\0049\4\n\0045\5\v\0005\6\r\0003\a\f\0=\a\14\6B\4\3\0016\4\b\0009\4\t\0049\4\n\0045\5\15\0005\6\17\0003\a\16\0=\a\14\6B\4\3\0012\0\0ÄK\0\1\0\1\0\0\0\1\2\0\0\rBufEnter\rcallback\1\0\0\0\1\2\0\0\fBufRead\24nvim_create_autocmd\bapi\bvim\26get_installed_servers\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\17config.utils\frequire\f_config\a_G\0", "config", "nvim-lsp-installer")

time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
