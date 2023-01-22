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
	vim.api.nvim_create_autocmd({ "FileType" }, {
		callback = function(args)
			local bufnr = args.buf
			if vim.bo[bufnr].filetype == "packer" then
				-- TODO: Remove schedule. Something is setting this option after the FileType event
				vim.schedule(function()
					vim.wo.cursorcolumn = false
				end)
			end
		end,
	})
end;

local M = {
	setup = setup,
	isPkgMngr = true,
}

return M;
