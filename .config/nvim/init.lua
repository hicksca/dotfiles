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

-- Keep undo history across sessions (stored in ~/.local/state/nvim/undo)
vim.opt.undofile = true

-- Indentation: use spaces, 4 wide
vim.opt.expandtab = true    -- insert spaces when pressing Tab
vim.opt.tabstop = 4         -- display existing tab characters as 4 columns
vim.opt.shiftwidth = 4      -- indent width for >>, <<, and auto-indent
vim.opt.softtabstop = 4     -- Tab and Backspace move in 4-space steps

-- Line numbers in code files only
local prose_filetypes = {
  text = true, gitcommit = true, gitrebase = true,
}

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local buf = vim.bo[args.buf]
    local is_code = buf.buftype == "" and not prose_filetypes[buf.filetype]
    vim.opt_local.number = is_code
  end,
})

-- Create any missing parent directories when saving a file
local function ensure_parent_dir(path)
  local dir = vim.fn.fnamemodify(path, ":p:h")
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end
end

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    -- Skip URL-style buffers (scp://, oil://, etc.)
    if args.match:match("^%w+://") then
      return
    end
    ensure_parent_dir(args.match)
  end,
})
