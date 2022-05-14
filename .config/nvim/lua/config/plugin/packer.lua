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
	require('packer').startup({
		pkgsConfig
	})
	require('impatient')
end;

local M = {
	setup = setup,
	isPkgMngr = true,
}

return M;
