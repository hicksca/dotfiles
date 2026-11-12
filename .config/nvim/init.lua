-- Let the terminal's background show through instead of
-- Neovim painting the colorscheme's background over it.
local transparent_groups = {
  "Normal", "NormalNC", "NormalFloat", "SignColumn",
  "EndOfBuffer", "LineNr", "FoldColumn",
}

local function clear_background()
  for _, group in ipairs(transparent_groups) do
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    hl.bg, hl.ctermbg = nil, nil
    vim.api.nvim_set_hl(0, group, hl)
  end
end

-- Reapply whenever a colorscheme loads, since it resets highlights
vim.api.nvim_create_autocmd("ColorScheme", { callback = clear_background })
clear_background()
