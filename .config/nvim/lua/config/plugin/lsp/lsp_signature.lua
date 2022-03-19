local config = function() 
	require('lsp_signature').setup({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		handler_opts = {
			border = "none"
		}
	})
end

local M = {
	'ray-x/lsp_signature.nvim',
	config = config,
};

return M;
