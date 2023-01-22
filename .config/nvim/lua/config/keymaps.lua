-- Don't yank on different actions
for _, mode in pairs({ "x", "n" }) do
	for _, lhs in pairs({ "c", "C", "d", "D" }) do
		if vim.fn.maparg(lhs, mode) == "" then
			vim.api.nvim_set_keymap(mode, lhs, '"_' .. lhs, { noremap = true, silent = true })
		end
	end
end
