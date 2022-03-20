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
  ["crates.nvim"] = {
    config = { "\27LJ\2\0024\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
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
    config = { "\27LJ\2\2[\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\25show_current_context\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["legendary.nvim"] = {
    config = { "\27LJ\2\2ê\2\0\0\5\0\14\0\0216\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\4\0'\3\5\0005\4\6\0B\0\5\0016\0\a\0'\1\b\0B\0\2\0029\0\t\0005\1\n\0004\2\0\0=\2\v\0014\2\0\0=\2\f\0014\2\0\0=\2\r\1B\0\2\1K\0\1\0\rautocmds\rcommands\fkeymaps\1\0\2\28most_recent_item_at_top\2\20include_builtin\2\nsetup\14legendary\frequire\1\0\1\fnoremap\2):lua require('legendary').find()<cr>\15<leader>km\6n\20nvim_set_keymap\bapi\bvim\0" },
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
  ["lsp-status.nvim"] = {
    config = { "\27LJ\2\2Œ\1\0\0\5\0\v\0\0176\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0029\2\4\1B\2\1\0019\2\5\0015\3\6\0B\2\2\0016\2\a\0009\2\b\0029\3\t\0009\3\n\0039\4\n\1B\2\3\1K\0\1\0\14on_attach\blsp\vinsert\ntable\1\0\3\16diagnostics\1\21current_function\1\18show_filename\1\vconfig\22register_progress\15lsp-status\frequire\f_config\a_G\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/lsp-status.nvim",
    url = "https://github.com/nvim-lua/lsp-status.nvim"
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
    config = { "\27LJ\2\2:\0\0\3\0\5\0\0066\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\4\0D\0\3\0\6X\6S\20ObsessionStatus\afn\bvimÌ\2\1\0\6\0\18\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\14\0005\2\a\0005\3\3\0005\4\4\0005\5\5\0=\5\6\4>\4\3\3=\3\b\0025\3\t\0=\3\n\0025\3\f\0003\4\v\0>\4\1\3=\3\r\2=\2\15\0015\2\16\0=\2\17\1B\0\2\1K\0\1\0\15extensions\1\4\0\0\14nvim-tree\rfugitive\rquickfix\rsections\1\0\0\14lualine_z\1\3\0\0\0\rlocation\0\14lualine_c\1\4\0\0\rfilename\17g:coc_status#require(\"lsp-status\").status()\14lualine_b\1\0\0\fsymbols\1\0\4\thint\tÔ†µ \tinfo\tÔëâ \twarn\tÔî© \nerror\tÔëß \1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nice-reference.nvim"] = {
    config = { "\27LJ\2\2}\0\0\3\0\a\0\t6\0\0\0009\0\1\0009\0\2\0006\1\4\0'\2\5\0B\1\2\0029\1\6\1=\1\3\0K\0\1\0\22reference_handler\19nice-reference\frequire\28textDocument/references\rhandlers\blsp\bvim\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nice-reference.nvim",
    url = "https://github.com/wiliamks/nice-reference.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\2-\0\1\3\1\2\0\5-\1\0\0009\1\0\0019\2\1\0B\1\2\1K\0\1\0\3¿\tbody\15lsp_expandÜ\1\0\1\3\2\4\0\23-\1\0\0009\1\0\1)\2ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\0\0009\1\1\1)\2ˇˇB\1\2\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\v\1\1\0X\1\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\1¿\rcomplete\fvisible\tjump\rjumpable—\1\0\1\4\2\b\0\26-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\tÄ-\1\0\0009\1\1\0015\2\4\0-\3\0\0009\3\2\0039\3\3\3=\3\5\2B\1\2\1X\1\vÄ-\1\1\0009\1\6\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\a\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\19expand_or_jump\23expand_or_jumpable\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\fvisible—\1\0\1\4\2\b\0\26-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\tÄ-\1\0\0009\1\1\0015\2\4\0-\3\0\0009\3\2\0039\3\3\3=\3\5\2B\1\2\1X\1\vÄ-\1\1\0009\1\6\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\a\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\19expand_or_jump\23expand_or_jumpable\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\fvisible±\b\1\0\v\0@\0u6\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0026\2\2\0'\3\4\0B\2\2\0026\3\2\0'\4\5\0B\3\2\0029\4\6\0015\5\n\0005\6\b\0003\a\a\0=\a\t\6=\6\v\0055\6\15\0009\a\f\0019\b\f\0019\b\r\bB\b\1\0025\t\14\0B\a\3\2=\a\16\0069\a\f\0019\b\f\0019\b\17\bB\b\1\0025\t\18\0B\a\3\2=\a\19\0069\a\20\0019\a\21\a=\a\22\0069\a\f\0013\b\23\0005\t\24\0B\a\3\2=\a\25\0069\a\f\0015\b\27\0003\t\26\0=\t\28\b3\t\29\0=\t\30\bB\a\2\2=\a\31\0069\a\f\0019\a \a5\b#\0009\t!\0019\t\"\t=\t$\bB\a\2\2=\a%\6=\6\f\0059\6\20\0019\6&\0064\a\4\0005\b'\0>\b\1\a5\b(\0>\b\2\a5\b)\0>\b\3\a4\b\3\0005\t*\0>\t\1\bB\6\3\2=\6&\0055\6/\0009\a+\0025\b,\0005\t-\0=\t.\bB\a\2\2=\a0\6=\0061\0055\0062\0=\0063\5B\4\2\0019\4\6\0019\0044\4'\0055\0005\0067\0004\a\3\0005\b6\0>\b\1\a=\a&\6B\4\3\0019\4\6\0019\0044\4'\0058\0005\6;\0009\a\20\0019\a&\a4\b\3\0005\t9\0>\t\1\b4\t\3\0005\n:\0>\n\1\tB\a\3\2=\a&\6B\4\3\0019\4<\0006\5\2\0'\6>\0B\5\2\0029\5?\0059\6<\0009\6=\6B\5\2\2=\5=\0042\0\0ÄK\0\1\0\24update_capabilities\17cmp_nvim_lsp\17capabilities\blsp\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\17experimental\1\0\1\15ghost_text\2\15formatting\vformat\1\0\0\tmenu\1\0\5\fcmdline\14[CmdLine]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\vcrates\r[Crates]\fluasnip\14[LuaSnip]\1\0\1\14with_text\2\15cmp_format\1\0\1\tname\vbuffer\1\0\1\tname\vcrates\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\t<CR>\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\n<Tab>\6c\0\6i\1\0\0\0\f<S-Tab>\1\3\0\0\6i\6c\0\n<C-y>\fdisable\vconfig\n<C-k>\1\3\0\0\6i\6c\21select_prev_item\n<C-j>\1\0\0\1\3\0\0\6i\6c\21select_next_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\flspkind\bcmp\frequire\f_config\a_G\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\2\30\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\topen\31\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclose\31\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\ncloseÃ\1\1\0\4\0\r\0\0236\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\0009\2\4\0029\2\5\0023\3\a\0=\3\6\0029\2\3\0009\2\b\0029\2\t\0023\3\n\0=\3\6\0029\2\3\0009\2\b\0029\2\v\0023\3\f\0=\3\6\0022\0\0ÄK\0\1\0\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\ndapui\bdap\frequire\0" },
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
    config = { "\27LJ\2\2z\0\1\5\2\5\0\0174\1\0\0-\2\0\0009\2\1\2-\3\1\0009\3\2\0039\3\0\3B\2\2\2=\2\0\1-\2\1\0009\2\2\0029\2\3\2=\2\3\1\18\3\0\0009\2\4\0\18\4\1\0B\2\3\1K\0\1\0\1¿\0¿\nsetup\17capabilities\blsp\14merge_fns\14on_attach\1\0\5\0\a\0\r6\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0026\2\2\0'\3\4\0B\2\2\0029\3\5\0023\4\6\0B\3\2\0012\0\0ÄK\0\1\0\0\20on_server_ready\23nvim-lsp-installer\17config.utils\frequire\f_config\a_G\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\2Î\4\0\0\v\0\27\00046\0\0\0'\1\1\0B\0\2\0025\1\2\0006\2\3\0\18\3\1\0B\2\2\4H\5\fÄ'\a\4\0\18\b\5\0&\a\b\a6\b\5\0009\b\6\b9\b\a\b\18\t\a\0005\n\b\0=\6\t\n=\a\n\n=\a\v\nB\b\3\1F\5\3\3R\5Ú6\2\5\0009\2\f\0029\2\r\0025\3\14\0005\4\15\0=\4\16\3B\2\2\0016\2\5\0009\2\17\2)\3˙\0=\3\18\0026\2\5\0009\2\19\2'\3\20\0B\2\2\0016\2\5\0009\2\21\0029\2\22\0029\3\24\0'\4\25\0B\3\2\2=\3\23\0026\2\5\0009\2\21\0029\2\22\0029\3\24\0'\4\25\0B\3\2\2=\3\26\2K\0\1\0 textDocument/implementation\vvsplit\20goto_definition\28textDocument/definition\rhandlers\blspgautocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope=\"cursor\"})\bcmd\15updatetime\6o\nfloat\1\0\1\vborder\tnone\1\0\3\14underline\2\nsigns\2\17virtual_text\1\vconfig\15diagnostic\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\bvim\19DiagnosticSign\npairs\1\0\4\tInfo\tÔëâ \tHint\tÔ†µ \nError\tÔëß \tWarn\tÔî© \17config.utils\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lspupdate"] = {
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-lspupdate",
    url = "https://github.com/alexaandru/nvim-lspupdate"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\2™\2\0\0\3\0\14\0\0176\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0015\2\n\0=\2\v\0015\2\f\0=\2\r\1B\0\2\1K\0\1\0\tview\1\0\1\16auto_resize\2\bgit\1\0\1\vignore\1\ffilters\1\0\1\rdotfiles\1\16diagnostics\1\0\1\venable\2\22update_to_buf_dir\1\0\2\14auto_open\2\venable\1\1\0\4\15auto_close\2\18open_on_setup\2'hijack_unnamed_buffer_when_opening\2\16open_on_tab\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
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
    config = { "\27LJ\2\2g\0\0\4\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\1\3\0006\2\0\0009\2\1\0029\2\4\2B\2\1\2'\3\5\0&\2\3\2'\3\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvimª\b\1\0\f\0001\0S6\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\2'\2\4\0\18\3\2\0'\4\5\0&\3\4\3\18\4\2\0'\5\6\0&\4\5\0046\5\a\0009\5\b\0059\5\t\5'\6\n\0005\a\v\0B\5\3\0016\5\a\0009\5\b\0059\5\t\5'\6\f\0005\a\r\0B\5\3\0016\5\a\0009\5\b\0059\5\t\5'\6\14\0005\a\15\0B\5\3\0016\5\a\0009\5\b\0059\5\t\5'\6\16\0005\a\17\0B\5\3\0016\5\2\0'\6\18\0B\5\2\0029\5\19\0055\6\23\0005\a\20\0005\b\21\0=\b\22\a=\a\24\0065\a\28\0009\b\25\0019\t\26\0009\t\27\tB\b\2\2=\b\27\a9\b\26\0009\b\29\b=\b\29\a5\b!\0005\t\31\0005\n\30\0=\n \t=\t\"\b=\b#\a=\a$\0065\a'\0006\b\2\0'\t%\0B\b\2\0029\b&\b\18\t\3\0\18\n\4\0B\b\3\2=\b(\a5\b-\0004\t\3\0005\n)\0003\v*\0=\v+\n4\v\0\0=\v,\n>\n\1\t=\t.\b=\b/\a=\a0\6B\5\2\1K\0\1\0\bdap\19configurations\trust\1\0\0\targs\fprogram\0\1\0\5\16stopOnEntry\1\tname\vLaunch\ttype\tlldb\frequest\vlaunch\bcwd\23${workspaceFolder}\fadapter\1\0\0\25get_codelldb_adapter\19rust-tools.dap\vserver\rsettings\18rust-analyzer\1\0\0\16checkOnSave\1\0\0\1\0\1\fcommand\vclippy\17capabilities\1\0\0\14on_attach\blsp\14merge_fns\ntools\1\0\0\18hover_actions\1\0\1\15auto_focus\2\1\0\2\23hover_with_actions\2\17autoSetHints\2\nsetup\15rust-tools\1\0\4\vtexthl\bred\ttext\bÔÅû\vlinehl\5\nnumhl\5\26DapBreakpointRejected\1\0\4\vtexthl\bred\ttext\vÔëÑ·∂´\vlinehl\5\nnumhl\5\16DapLogPoint\1\0\4\vtexthl\bred\ttext\vÔëÑ·∂ú\vlinehl\5\nnumhl\5\27DapBreakpointCondition\1\0\4\vtexthl\bred\ttext\bÔëÑ\vlinehl\5\nnumhl\5\18DapBreakpoint\16sign_define\afn\bvim\24lldb/lib/liblldb.so\21adapter/codelldbE/home/fabiocaruso/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/\17config.utils\frequire\f_config\a_G\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["tabby.nvim"] = {
    config = { "\27LJ\2\0023\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ntabby\frequire\0" },
    loaded = true,
    path = "/home/fabiocaruso/.local/share/nvim/site/pack/packer/start/tabby.nvim",
    url = "https://github.com/nanozuki/tabby.nvim"
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
  ["trouble.nvim"] = {
    config = { "\27LJ\2\2S\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2\14auto_open\2\15auto_close\2\nsetup\ftrouble\frequire\0" },
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
try_loadstring("\27LJ\2\2-\0\1\3\1\2\0\5-\1\0\0009\1\0\0019\2\1\0B\1\2\1K\0\1\0\3¿\tbody\15lsp_expandÜ\1\0\1\3\2\4\0\23-\1\0\0009\1\0\1)\2ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\0\0009\1\1\1)\2ˇˇB\1\2\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\v\1\1\0X\1\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\1¿\rcomplete\fvisible\tjump\rjumpable—\1\0\1\4\2\b\0\26-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\tÄ-\1\0\0009\1\1\0015\2\4\0-\3\0\0009\3\2\0039\3\3\3=\3\5\2B\1\2\1X\1\vÄ-\1\1\0009\1\6\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\a\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\19expand_or_jump\23expand_or_jumpable\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\fvisible—\1\0\1\4\2\b\0\26-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\tÄ-\1\0\0009\1\1\0015\2\4\0-\3\0\0009\3\2\0039\3\3\3=\3\5\2B\1\2\1X\1\vÄ-\1\1\0009\1\6\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\a\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\19expand_or_jump\23expand_or_jumpable\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\fvisible±\b\1\0\v\0@\0u6\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0026\2\2\0'\3\4\0B\2\2\0026\3\2\0'\4\5\0B\3\2\0029\4\6\0015\5\n\0005\6\b\0003\a\a\0=\a\t\6=\6\v\0055\6\15\0009\a\f\0019\b\f\0019\b\r\bB\b\1\0025\t\14\0B\a\3\2=\a\16\0069\a\f\0019\b\f\0019\b\17\bB\b\1\0025\t\18\0B\a\3\2=\a\19\0069\a\20\0019\a\21\a=\a\22\0069\a\f\0013\b\23\0005\t\24\0B\a\3\2=\a\25\0069\a\f\0015\b\27\0003\t\26\0=\t\28\b3\t\29\0=\t\30\bB\a\2\2=\a\31\0069\a\f\0019\a \a5\b#\0009\t!\0019\t\"\t=\t$\bB\a\2\2=\a%\6=\6\f\0059\6\20\0019\6&\0064\a\4\0005\b'\0>\b\1\a5\b(\0>\b\2\a5\b)\0>\b\3\a4\b\3\0005\t*\0>\t\1\bB\6\3\2=\6&\0055\6/\0009\a+\0025\b,\0005\t-\0=\t.\bB\a\2\2=\a0\6=\0061\0055\0062\0=\0063\5B\4\2\0019\4\6\0019\0044\4'\0055\0005\0067\0004\a\3\0005\b6\0>\b\1\a=\a&\6B\4\3\0019\4\6\0019\0044\4'\0058\0005\6;\0009\a\20\0019\a&\a4\b\3\0005\t9\0>\t\1\b4\t\3\0005\n:\0>\n\1\tB\a\3\2=\a&\6B\4\3\0019\4<\0006\5\2\0'\6>\0B\5\2\0029\5?\0059\6<\0009\6=\6B\5\2\2=\5=\0042\0\0ÄK\0\1\0\24update_capabilities\17cmp_nvim_lsp\17capabilities\blsp\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\17experimental\1\0\1\15ghost_text\2\15formatting\vformat\1\0\0\tmenu\1\0\5\fcmdline\14[CmdLine]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\vcrates\r[Crates]\fluasnip\14[LuaSnip]\1\0\1\14with_text\2\15cmp_format\1\0\1\tname\vbuffer\1\0\1\tname\vcrates\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\t<CR>\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\n<Tab>\6c\0\6i\1\0\0\0\f<S-Tab>\1\3\0\0\6i\6c\0\n<C-y>\fdisable\vconfig\n<C-k>\1\3\0\0\6i\6c\21select_prev_item\n<C-j>\1\0\0\1\3\0\0\6i\6c\21select_next_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\flspkind\bcmp\frequire\f_config\a_G\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: DAPInstall.nvim
time([[Config for DAPInstall.nvim]], true)
try_loadstring("\27LJ\2\2ì\1\0\0\5\0\n\0\0156\0\0\0'\1\1\0B\0\2\0029\1\2\0005\2\b\0006\3\3\0009\3\4\0039\3\5\3'\4\6\0B\3\2\2'\4\a\0&\3\4\3=\3\t\2B\1\2\1K\0\1\0\22installation_path\1\0\0\17/dapinstall/\tdata\fstdpath\afn\bvim\nsetup\16dap-install\frequire\0", "config", "DAPInstall.nvim")
time([[Config for DAPInstall.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\2[\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\25show_current_context\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: litee-symboltree.nvim
time([[Config for litee-symboltree.nvim]], true)
try_loadstring("\27LJ\2\2a\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2\fon_open\npanel\ricon_set\tnerd\nsetup\21litee.symboltree\frequire\0", "config", "litee-symboltree.nvim")
time([[Config for litee-symboltree.nvim]], false)
-- Config for: nice-reference.nvim
time([[Config for nice-reference.nvim]], true)
try_loadstring("\27LJ\2\2}\0\0\3\0\a\0\t6\0\0\0009\0\1\0009\0\2\0006\1\4\0'\2\5\0B\1\2\0029\1\6\1=\1\3\0K\0\1\0\22reference_handler\19nice-reference\frequire\28textDocument/references\rhandlers\blsp\bvim\0", "config", "nice-reference.nvim")
time([[Config for nice-reference.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\2:\0\0\3\0\5\0\0066\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\4\0D\0\3\0\6X\6S\20ObsessionStatus\afn\bvimÌ\2\1\0\6\0\18\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\14\0005\2\a\0005\3\3\0005\4\4\0005\5\5\0=\5\6\4>\4\3\3=\3\b\0025\3\t\0=\3\n\0025\3\f\0003\4\v\0>\4\1\3=\3\r\2=\2\15\0015\2\16\0=\2\17\1B\0\2\1K\0\1\0\15extensions\1\4\0\0\14nvim-tree\rfugitive\rquickfix\rsections\1\0\0\14lualine_z\1\3\0\0\0\rlocation\0\14lualine_c\1\4\0\0\rfilename\17g:coc_status#require(\"lsp-status\").status()\14lualine_b\1\0\0\fsymbols\1\0\4\thint\tÔ†µ \tinfo\tÔëâ \twarn\tÔî© \nerror\tÔëß \1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
try_loadstring("\27LJ\2\2g\0\0\4\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\1\3\0006\2\0\0009\2\1\0029\2\4\2B\2\1\2'\3\5\0&\2\3\2'\3\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvimª\b\1\0\f\0001\0S6\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\2'\2\4\0\18\3\2\0'\4\5\0&\3\4\3\18\4\2\0'\5\6\0&\4\5\0046\5\a\0009\5\b\0059\5\t\5'\6\n\0005\a\v\0B\5\3\0016\5\a\0009\5\b\0059\5\t\5'\6\f\0005\a\r\0B\5\3\0016\5\a\0009\5\b\0059\5\t\5'\6\14\0005\a\15\0B\5\3\0016\5\a\0009\5\b\0059\5\t\5'\6\16\0005\a\17\0B\5\3\0016\5\2\0'\6\18\0B\5\2\0029\5\19\0055\6\23\0005\a\20\0005\b\21\0=\b\22\a=\a\24\0065\a\28\0009\b\25\0019\t\26\0009\t\27\tB\b\2\2=\b\27\a9\b\26\0009\b\29\b=\b\29\a5\b!\0005\t\31\0005\n\30\0=\n \t=\t\"\b=\b#\a=\a$\0065\a'\0006\b\2\0'\t%\0B\b\2\0029\b&\b\18\t\3\0\18\n\4\0B\b\3\2=\b(\a5\b-\0004\t\3\0005\n)\0003\v*\0=\v+\n4\v\0\0=\v,\n>\n\1\t=\t.\b=\b/\a=\a0\6B\5\2\1K\0\1\0\bdap\19configurations\trust\1\0\0\targs\fprogram\0\1\0\5\16stopOnEntry\1\tname\vLaunch\ttype\tlldb\frequest\vlaunch\bcwd\23${workspaceFolder}\fadapter\1\0\0\25get_codelldb_adapter\19rust-tools.dap\vserver\rsettings\18rust-analyzer\1\0\0\16checkOnSave\1\0\0\1\0\1\fcommand\vclippy\17capabilities\1\0\0\14on_attach\blsp\14merge_fns\ntools\1\0\0\18hover_actions\1\0\1\15auto_focus\2\1\0\2\23hover_with_actions\2\17autoSetHints\2\nsetup\15rust-tools\1\0\4\vtexthl\bred\ttext\bÔÅû\vlinehl\5\nnumhl\5\26DapBreakpointRejected\1\0\4\vtexthl\bred\ttext\vÔëÑ·∂´\vlinehl\5\nnumhl\5\16DapLogPoint\1\0\4\vtexthl\bred\ttext\vÔëÑ·∂ú\vlinehl\5\nnumhl\5\27DapBreakpointCondition\1\0\4\vtexthl\bred\ttext\bÔëÑ\vlinehl\5\nnumhl\5\18DapBreakpoint\16sign_define\afn\bvim\24lldb/lib/liblldb.so\21adapter/codelldbE/home/fabiocaruso/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/\17config.utils\frequire\f_config\a_G\0", "config", "rust-tools.nvim")
time([[Config for rust-tools.nvim]], false)
-- Config for: crates.nvim
time([[Config for crates.nvim]], true)
try_loadstring("\27LJ\2\0024\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0", "config", "crates.nvim")
time([[Config for crates.nvim]], false)
-- Config for: legendary.nvim
time([[Config for legendary.nvim]], true)
try_loadstring("\27LJ\2\2ê\2\0\0\5\0\14\0\0216\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\4\0'\3\5\0005\4\6\0B\0\5\0016\0\a\0'\1\b\0B\0\2\0029\0\t\0005\1\n\0004\2\0\0=\2\v\0014\2\0\0=\2\f\0014\2\0\0=\2\r\1B\0\2\1K\0\1\0\rautocmds\rcommands\fkeymaps\1\0\2\28most_recent_item_at_top\2\20include_builtin\2\nsetup\14legendary\frequire\1\0\1\fnoremap\2):lua require('legendary').find()<cr>\15<leader>km\6n\20nvim_set_keymap\bapi\bvim\0", "config", "legendary.nvim")
time([[Config for legendary.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\2Û\4\0\0\a\0\30\00186\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\1\3\0015\2\20\0005\3\4\0006\4\0\0'\5\5\0B\4\2\0029\4\6\4=\4\a\0036\4\0\0'\5\b\0B\4\2\0029\4\t\0049\4\n\4=\4\v\0035\4\17\0005\5\f\0009\6\r\0=\6\14\0059\6\15\0=\6\16\5=\5\18\4=\4\19\3=\3\21\0025\3\23\0005\4\22\0=\4\24\0034\4\3\0006\5\0\0'\6\25\0B\5\2\0029\5\26\0054\6\0\0B\5\2\0?\5\0\0=\4\27\3=\3\28\2B\1\2\0016\1\0\0'\2\2\0B\1\2\0029\1\29\1'\2\24\0B\1\2\0016\1\0\0'\2\2\0B\1\2\0029\1\29\1'\2\27\0B\1\2\1K\0\1\0\19load_extension\15extensions\14ui-select\17get_dropdown\21telescope.themes\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\rmappings\6i\1\0\0\n<C-j>\24move_selection_next\n<C-k>\28move_selection_previous\1\0\2\n<C-n>\1\n<C-p>\1\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\16file_sorter\19get_fzy_sorter\22telescope.sorters\1\0\1\19color_devicons\2\nsetup\14telescope\22telescope.actions\frequire\3ÄÄ¿ô\4\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\2C\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\2\30\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\topen\31\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclose\31\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\ncloseÃ\1\1\0\4\0\r\0\0236\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\0009\2\4\0029\2\5\0023\3\a\0=\3\6\0029\2\3\0009\2\b\0029\2\t\0023\3\n\0=\3\6\0029\2\3\0009\2\b\0029\2\v\0023\3\f\0=\3\6\0022\0\0ÄK\0\1\0\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\ndapui\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: lsp-status.nvim
time([[Config for lsp-status.nvim]], true)
try_loadstring("\27LJ\2\2Œ\1\0\0\5\0\v\0\0176\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0029\2\4\1B\2\1\0019\2\5\0015\3\6\0B\2\2\0016\2\a\0009\2\b\0029\3\t\0009\3\n\0039\4\n\1B\2\3\1K\0\1\0\14on_attach\blsp\vinsert\ntable\1\0\3\16diagnostics\1\21current_function\1\18show_filename\1\vconfig\22register_progress\15lsp-status\frequire\f_config\a_G\0", "config", "lsp-status.nvim")
time([[Config for lsp-status.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\2S\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2\14auto_open\2\15auto_close\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: litee.nvim
time([[Config for litee.nvim]], true)
try_loadstring("\27LJ\2\2œ\1\0\0\5\0\f\0\0226\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\0\0'\1\3\0B\0\2\0029\0\2\0005\1\b\0005\2\6\0006\3\0\0'\4\4\0B\3\2\0029\3\5\3=\3\a\2=\2\t\0015\2\n\0=\2\v\1B\0\2\1K\0\1\0\npanel\1\0\1\16orientation\nright\ttree\1\0\0\nicons\1\0\1\ricon_set\tnerd\tnerd\20litee.lib.icons\14litee.lib\nsetup\rcodicons\frequire\0", "config", "litee.nvim")
time([[Config for litee.nvim]], false)
-- Config for: tabby.nvim
time([[Config for tabby.nvim]], true)
try_loadstring("\27LJ\2\0023\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ntabby\frequire\0", "config", "tabby.nvim")
time([[Config for tabby.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\2:\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: litee-calltree.nvim
time([[Config for litee-calltree.nvim]], true)
try_loadstring("\27LJ\2\2_\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2\fon_open\npanel\ricon_set\tnerd\nsetup\19litee.calltree\frequire\0", "config", "litee-calltree.nvim")
time([[Config for litee-calltree.nvim]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\2z\0\1\5\2\5\0\0174\1\0\0-\2\0\0009\2\1\2-\3\1\0009\3\2\0039\3\0\3B\2\2\2=\2\0\1-\2\1\0009\2\2\0029\2\3\2=\2\3\1\18\3\0\0009\2\4\0\18\4\1\0B\2\3\1K\0\1\0\1¿\0¿\nsetup\17capabilities\blsp\14merge_fns\14on_attach\1\0\5\0\a\0\r6\0\0\0009\0\1\0006\1\2\0'\2\3\0B\1\2\0026\2\2\0'\3\4\0B\2\2\0029\3\5\0023\4\6\0B\3\2\0012\0\0ÄK\0\1\0\0\20on_server_ready\23nvim-lsp-installer\17config.utils\frequire\f_config\a_G\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\2M\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\2Î\4\0\0\v\0\27\00046\0\0\0'\1\1\0B\0\2\0025\1\2\0006\2\3\0\18\3\1\0B\2\2\4H\5\fÄ'\a\4\0\18\b\5\0&\a\b\a6\b\5\0009\b\6\b9\b\a\b\18\t\a\0005\n\b\0=\6\t\n=\a\n\n=\a\v\nB\b\3\1F\5\3\3R\5Ú6\2\5\0009\2\f\0029\2\r\0025\3\14\0005\4\15\0=\4\16\3B\2\2\0016\2\5\0009\2\17\2)\3˙\0=\3\18\0026\2\5\0009\2\19\2'\3\20\0B\2\2\0016\2\5\0009\2\21\0029\2\22\0029\3\24\0'\4\25\0B\3\2\2=\3\23\0026\2\5\0009\2\21\0029\2\22\0029\3\24\0'\4\25\0B\3\2\2=\3\26\2K\0\1\0 textDocument/implementation\vvsplit\20goto_definition\28textDocument/definition\rhandlers\blspgautocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope=\"cursor\"})\bcmd\15updatetime\6o\nfloat\1\0\1\vborder\tnone\1\0\3\14underline\2\nsigns\2\17virtual_text\1\vconfig\15diagnostic\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\bvim\19DiagnosticSign\npairs\1\0\4\tInfo\tÔëâ \tHint\tÔ†µ \nError\tÔëß \tWarn\tÔî© \17config.utils\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\2™\2\0\0\3\0\14\0\0176\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0015\2\n\0=\2\v\0015\2\f\0=\2\r\1B\0\2\1K\0\1\0\tview\1\0\1\16auto_resize\2\bgit\1\0\1\vignore\1\ffilters\1\0\1\rdotfiles\1\16diagnostics\1\0\1\venable\2\22update_to_buf_dir\1\0\2\14auto_open\2\venable\1\1\0\4\15auto_close\2\18open_on_setup\2'hijack_unnamed_buffer_when_opening\2\16open_on_tab\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
