-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- vim.g.autoformat = false

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.diagnostic.config {
  virtual_text = true,
  virtual_improved = {
    current_line = 'only',
  },
}
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- colorscheme
-- vim.cmd("colorscheme PaperColor")
-- vim.cmd("colorscheme Tomorrow-Night")
vim.cmd("colorscheme quiet")

-- key mappings
local keymap_opts = { silent = true }

vim.keymap.set("n", "<Leader>q", ":q<CR>", keymap_opts)
vim.keymap.set("n", "<Leader>w", ":wa<CR>", keymap_opts)
vim.keymap.set("n", "<Leader>|", ":vs<CR>", keymap_opts)
vim.keymap.set("n", "<Leader>-", ":sp<CR>", keymap_opts)
vim.keymap.set("n", "<Leader>=", "<C-w>=", keymap_opts)
vim.keymap.set("n", "<Leader>,", "<C-w>10<", keymap_opts)
vim.keymap.set("n", "<Leader>.", "<C-w>10>", keymap_opts)
vim.keymap.set("n", "<Leader>h", "<C-w>h", keymap_opts)
vim.keymap.set("n", "<Leader>j", "<C-w>j", keymap_opts)
vim.keymap.set("n", "<Leader>k", "<C-w>k", keymap_opts)
vim.keymap.set("n", "<Leader>l", "<C-w>l", keymap_opts)
vim.keymap.set("n", "<Leader>H", "<C-w>H", keymap_opts)
vim.keymap.set("n", "<Leader>J", "<C-w>J", keymap_opts)
vim.keymap.set("n", "<Leader>K", "<C-w>K", keymap_opts)
vim.keymap.set("n", "<Leader>L", "<C-w>L", keymap_opts)
vim.keymap.set("n", "<Leader>t", ":tabnew<CR>", keymap_opts)
vim.keymap.set("n", "<Leader>b", ":tab ba<CR>", keymap_opts)
vim.keymap.set("n", "<Leader>[", ":term<CR>", keymap_opts)
vim.keymap.set("n", "<Leader>m", ":make<CR><CR><C-w><C-w>", keymap_opts)

vim.keymap.set("i", "jj", "<Esc>", keymap_opts)
vim.keymap.set("i", "JJ", "<Esc>", keymap_opts)

vim.keymap.set("n", ";", ":", keymap_opts)
vim.keymap.set("n", ":", ";", keymap_opts)

vim.keymap.set("n", "+", "<C-a>", keymap_opts)
vim.keymap.set("n", "-", "<C-x>", keymap_opts)
vim.keymap.set("n", "gr", ":tabprevious<CR>", keymap_opts)
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", keymap_opts)
vim.keymap.set("n", "<C-h>", ":vsp<CR>:exe(\"tjump \"..expand('<cword>'))<CR>", keymap_opts)
vim.keymap.set("n", "<C-k>", ":split<CR>:exe(\"tjump \"..expand('<cword>'))<CR>", keymap_opts)
vim.keymap.set("n", "<Up>", "<C-w>k", keymap_opts)
vim.keymap.set("n", "<Down>", "<C-w>j", keymap_opts)
vim.keymap.set("n", "<Left>", "<C-w>h", keymap_opts)
vim.keymap.set("n", "<Right>", "<C-w>l", keymap_opts)
vim.keymap.set("n", "<S-Left>", ":tabprevious<CR>", keymap_opts)
vim.keymap.set("n", "<S-Right>", ":tabnext<CR>", keymap_opts)

-- options
vim.opt.number = true
vim.opt.ruler = true
vim.opt.title = true
vim.opt.writebackup = true
vim.opt.hidden = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.autoread = true
vim.opt.autoindent = true
vim.opt.wildignorecase = true
vim.opt.expandtab = true

vim.opt.compatible = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.startofline = false
vim.opt.errorbells = false

vim.opt.background = "dark"
vim.opt.fileencodings = { "utf-8", "iso-2022-jp", "enc-jp", "cp932" }
vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.mouse = ""
vim.opt.clipboard = "unnamed"

vim.opt.scrolloff = 5
vim.cmd("set visualbell t_vb=")
vim.opt.virtualedit = "onemore"
vim.opt.wildmode = "list:full"
vim.opt.makeprg = "cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && cmake --build build"
vim.cmd("set t_Co=256")
vim.opt.laststatus = 2
vim.cmd(
  [[set statusline=%<\ %{expand('%:p:h')}/%{expand('%:p:t')}\ %m%r%w%h\ %=\ Encode=%{&fenc!=''?&fenc:&enc}\ \|\ Format=%{&ff}\ \|\ FileType=%Y\ \|\ Char=0x%02.2B\ \|\ Position=%l/%L,(%v)\ \|\ Persent=%3p%%]])

-- highlights
vim.cmd("highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666")
vim.cmd("highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white")

-- autocmd
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = "*grep*",
  command = "cwindow"
})
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = "*make*",
  command = "copen"
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*",
  command = "match ZenkakuSpace / /"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "cc", "cxx", "h", "hpp", "hxx", "hh", "lua", "yaml", "yml", "toml", "repos", "xml", "urdf", "launch", "perl", "html", "py", "sh", "jar", "php", "rs" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end
})

-- highlight for insert mode
vim.g.hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

-- special case: Makefile
vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
    local curfile = vim.fn.expand("%:r")
    if curfile == "Makefile" then
      vim.opt_local.expandtab = false
    end
  end,
})
