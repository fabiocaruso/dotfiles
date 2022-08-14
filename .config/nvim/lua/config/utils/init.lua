-- Go to definition in split window
local function goto_definition(split_cmd)
	local util = vim.lsp.util
	local log = require("vim.lsp.log")
	local api = vim.api
	-- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
	local handler = function(_, result, ctx)
		if result == nil or vim.tbl_isempty(result) then
			local _ = log.info() and log.info(ctx.method, "No location found")
			return nil
		end
		if split_cmd then
			vim.cmd(split_cmd)
		end
		if vim.tbl_islist(result) then
			util.jump_to_location(result[1])

			if #result > 1 then
				util.set_qflist(util.locations_to_items(result))
				api.nvim_command("copen")
				api.nvim_command("wincmd p")
			end
		else
			util.jump_to_location(result)
		end
	end
	return handler
end

local function merge_fns(fns)
	return function(...)
		for _, f in pairs(fns) do
			f(...)
		end
	end
end

local function is_fn(fn)
	return type(fn) == 'function' or (type(fn) == 'table' and getmetatable(fn).__call ~= nil)
end

local function in_list(list, x)
	for _, v in pairs(list) do
		if v == x then return true end
	end
	return false
end

local function filter_table(arr, func)
	local new_index = 1
	local size_orig = #arr
	for old_index, v in ipairs(arr) do
		if func(v, old_index) then
			arr[new_index] = v
			new_index = new_index + 1
		end
	end
	for i = new_index, size_orig do arr[i] = nil end
	return arr
end

local M = {
	goto_definition = goto_definition,
	merge_fns = merge_fns,
	is_fn = is_fn,
	in_list = in_list,
	filter_table = filter_table,
};

return M;
