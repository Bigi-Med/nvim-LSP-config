function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0,"Normal", {bg = "#010224" })
	vim.api.nvim_set_hl(0,"Normalfloat", {bg = "#0000FF" })

end

ColorMyPencils()
