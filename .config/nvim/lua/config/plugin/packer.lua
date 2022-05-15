local packerAdapter = function(config)
	return config
end;

local setup = function(pkgsConfig)
	for i, pkgc in pairs(pkgsConfig) do
		pkgsConfig[i] = packerAdapter(pkgc);
	end
	local packerConfig = {
		'wbthomason/packer.nvim'
	}
	local impatientConfig = {
		'lewis6991/impatient.nvim',
	}
	table.insert(pkgsConfig, packerConfig)
	table.insert(pkgsConfig, impatientConfig)
	-- Bootstrapping
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	local packer_bootstrap = nil
	if fn.empty(fn.glob(install_path)) > 0 then
		packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	end
	require('packer').startup({
		pkgsConfig
	})
	require('impatient')
	if packer_bootstrap then
    require('packer').sync()
  end
end;

local M = {
	setup = setup,
	isPkgMngr = true,
}

return M;
