local packerAdapter = function(config)
	return config
end;

local setup = function(pkgsConfig)
	for i, pkgc in pairs(pkgsConfig) do
		pkgsConfig[i] = packerAdapter(pkgc);
	end
	local packerConfig = {
		'wbthomason/packer.nvim',
		requires = {
			'lewis6991/impatient.nvim',
		},
	}
	table.insert(pkgsConfig, packerConfig)
	require('packer').startup({
		pkgsConfig
	})
	pcall(require, 'impatient')
end;

local M = {
	setup = setup,
	isPkgMngr = true,
}

return M;
