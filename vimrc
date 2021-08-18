" =================================================
" vimrc from ghostylee <ghosty.lee.1984@gmail.com>
" =================================================

" Regular Vim Configuration {{{
set nocompatible " be iMproved
filetype off     " required!
" Backups {{{
" ---------------
set nobackup
set noswapfile
set noundofile
"}}}
" Language & encoding{{{
" ---------------
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set fileencoding=chinese
set langmenu=zh_CN.UTF-8  " chinese menu
"set helplang=cn           " chinese helpdoc
"}}}
" Font {{{
" ---------------
if has('win32') || has('win64')
    set guifont=FiraCode\ NF:h20
    set guifontwide=Yahei_Mono:h20:cGB2312
elseif has("gui_macvim")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
    set guifontwide=Yahei_Mono:h10:cGB2312
else
    "set guifont=YaHei\ Mono\ 11
    "set guifont=YaHei\ Consolas\ hybrid\ for\ Powerline\ 11
    set guifont=DejaVuSansMonoForPowerline\ NF\ 12
    set guifontwide=WenQuanYi\ Zen\ Hei\ Mono\ 12
endif
"}}}
" UI {{{
" ---------------
set shortmess=atI  " less thing show at startup
set ruler          " Ruler on
set nu             " Line numbers on
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
if exists('+colorcolumn')
    "set colorcolumn=120 " Color the 120th column differently
    set colorcolumn=0
endif
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"
"}}}
" GVIM{{{
" ---------------
set guioptions-=T " Toolbar
set guioptions-=m " Menubar
set guioptions-=L " hide left scroll
set guioptions-=b " hide bottom scroll
set showtabline=0 " hide tab
"}}}
" Behaviors {{{
" ---------------
"source $VIMRUNTIME/mswin.vim
filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)
syntax enable
syntax on
set autoread           " Automatically reload changes if detected
set autochdir          " Automatically change directory to current directory
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql
set iskeyword+=$,@     " Add extra characters that are valid parts of variables
"}}}
" Text Format {{{
" ---------------
set tabstop=4
set backspace=2   " Delete everything with backspace
set shiftwidth=4  " Tabs under smart indent
set softtabstop=4 " backspace can delete 2 space a time
set cindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,1s:1s
set autoindent
set smartindent
set smarttab
set expandtab
set conceallevel=0
"}}}
" Searching {{{
" ---------------
set ignorecase
set smartcase
set infercase
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class
"}}}
" Visual {{{
" ---------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
set list        " show tab and trail
set listchars=tab:▸\ ,trail:¬
"Invisible character colors
highlight NonText guifg=#444444 guibg=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
highlight SpecialKey guifg=#444444 guibg=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
set termguicolors


"}}}
" Sounds {{{
" ---------------
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
"}}}
" Mouse {{{
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes
"}}}
" Better complete options to speed it up {{{
set complete=.,w,b,u,U
"}}}
" Folding{{{
" ---------------
set foldenable
set foldmethod=marker
set foldlevel=0
set foldlevelstart=0
nnoremap <Space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
let g:xml_syntax_folding = 1
autocmd FileType xml set foldmethod=syntax
"}}}
" Path setting {{{
set path+=;,include;inc;
"}}}
" Spell Check{{{
set spelllang=en
" Toggle spelling mode with ,s
nmap <silent> <leader>s :set spell!<CR>
"}}}
"}}}
" neovim Configuration{{{
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
"}}}
" Bindings {{{
" ----------------------------------------
" Set leader to , {{{
" Note: This line MUST come before any <leader> mappings
let mapleader=","
let maplocalleader=","
"}}}
" Fixes common typos {{{
command W w
command Q q
command WQ wq
command Wq wq
" }}}
" use ; for : {{{
nnoremap ; :
vnoremap ; :
"}}}
" Make line completion easier {{{
imap <C-l> <C-x><C-l>
"}}}
" Show highlighting groups for current word {{{
nmap <C-S-P> : call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
"}}}
" Leader Commands {{{
" ---------------

" Edit vimrc with ,v
nmap <silent> <leader>v :e ~/.vim/vimrc<CR>

" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
"}}}
" Auto Commands {{{
" ----------------------------------------
if has("autocmd")
    " No formatting on o key newlines
    autocmd BufNewFile,BufEnter * set formatoptions-=o

    " No more complaining about untitled documents
    autocmd FocusLost silent! :wa

    " When editing a file, always jump to the last cursor position.
    " This must be after the uncompress commands.
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line ("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
    " vim -b : edit binary using xxd-format!
    augroup Binary
        "au!
        "au BufReadPre  *.bin let &bin=1
        "au BufReadPost *.bin if &bin | %!xxd
        "au BufReadPost *.bin set ft=xxd | endif
        "au BufWritePre *.bin if &bin | %!xxd -r
        "au BufWritePre *.bin endif
        "au BufWritePost *.bin if &bin | %!xxd
        "au BufWritePost *.bin set nomod | endif
    augroup END
endif
"}}}
" <s-k> to open help{{{
set keywordprg=":help"
"}}}
" Quickfix Commands {{{
nnoremap ao :botright copen<cr>
nnoremap ap :cclose<cr>
nnoremap [q :cprev<cr>
nnoremap ]q :cnext<cr>
"}}}
" buffer jump {{{
nnoremap bj :bprevious<cr>
nnoremap bk :bnext<cr>
" }}}
"}}}
" ctags {{{
" ---------------
set tags=tags;,~/_vimtags  "; here let vim go to up folds until find one tags file
if has('win32') || has('win64')
    nnoremap ec :!start ctags -R --fields=+l --c-kinds=+pl --c++-kinds=+pl .<cr>
else
    nnoremap ec :!ctags -R --fields=+l --c-kinds=+pl --c++-kinds=+pl .<cr>
endif
"}}}
" cscope {{{
if has('cscope')
    set cscopetag cscopeverbose

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-
    endif
    set csto=0

    " auto load cscope.out file (TODO:not work in window now)
    function! LoadCscope()
        let db = findfile("cscope.out", ".;")
        if (!empty(db))
            echo db
            "let dbpath = strpart(db, 0, match(db, "/cscope.out$"))
            let dbpath = matchstr(db, ".*/")
            set nocscopeverbose " suppress 'duplicate connection' error
            exe "cs add " . db . " " . dbpath
            set cscopeverbose
        endif
    endfunction
    "au BufEnter /* call LoadCscope()
    "autocmd FileType c,cpp call LoadCscope()
    nmap fa :call LoadCscope()<CR>
    " short command
    cnoreabbrev csa cs add
    cnoreabbrev csf cs find
    cnoreabbrev csk cs kill
    cnoreabbrev csr cs reset
    cnoreabbrev css cs show
    cnoreabbrev csh cs help

    nmap fs :cs find s <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
    nmap fg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap fc :cs find c <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
    "nmap ft :cs find t <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
    nmap fe :cs find e <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
    nmap ff :cs find f <C-R>=expand("<cfile>")<CR><CR>:botright copen<CR>
    nmap fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:botright copen<CR>
    nmap fd :cs find d <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
endif
"}}}
" Plugins {{{
" ----------------------------------------
call plug#begin('~/.vim/plugged')
" Theme {{{
"Plug 'junegunn/seoul256.vim'
"Plug 'altercation/vim-colors-solarized'
"Plug 'tpope/vim-vividchalk'
"Plug 'tomasr/molokai'
"Plug 'chriskempson/tomorrow-theme'
Plug 'morhetz/gruvbox'
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
call plug#end()
set t_Co=256
set background=dark

try
    colorscheme gruvbox
    "let g:nord_italic = 1
    "let g:nord_underline = 1
    "let g:nord_cursor_line_number_background = 1
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry
" }}}
" Indent Line {{{
Plug 'Yggdroot/indentLine'
let g:indentLine_setConceal = 0
let g:indentLine_concealcursor = ""
" }}}
" Fugitive {{{
Plug 'tpope/vim-fugitive'
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gp :Git push<CR>
" Mnemonic, gu = Git Update
nmap <Leader>gu :Git pull<CR>
nmap <Leader>gd :Gdiff<CR>
" Exit a diff by closing the diff window
nmap <Leader>gx :wincmd h<CR>:q<CR>
" }}}
" Nerdcommenter {{{
Plug 'scrooloose/nerdcommenter'
" }}}
" Signify {{{
Plug 'mhinz/vim-signify'
" }}}
" delimitMate {{{
Plug 'Raimondi/delimitMate'
" }}}
" vim-autoformat {{{
Plug 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR>
let g:formatdef_my_custom_c = '"astyle --mode=c --style=allman -CSxWYm0M40k1W3pHUfjs4xexC80"'
let g:formatters_c = ['my_custom_c']
let g:formatdef_pep8 = '"autopep8 "'
let g:formatters_python = ['pep8']
"}}}
" vim-autopep8 {{{
Plug 'tell-k/vim-autopep8'
let g:autopep8_disable_show_diff=1
"}}}
" Easy-align {{{
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" gitv {{{
Plug 'gregsexton/gitv'
" }}}
" multiple-cursors {{{
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" }}}
" fzf {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nmap <silent> <C-t> :GitFiles<CR>
" }}}
" ag {{{
Plug 'rking/ag.vim'
let g:ag_working_path_mode="r"
nmap ft :Ag <cword><CR>
" }}}
" devicons {{{
Plug 'ryanoasis/vim-devicons'
" }}}
" vim-tmux-navigator {{{
Plug 'christoomey/vim-tmux-navigator'
" }}}
" vim-slumlord {{{
Plug 'scrooloose/vim-slumlord'
" }}}
" plantuml-syntax {{{
Plug 'aklt/plantuml-syntax'
" }}}
" goyo {{{
Plug 'junegunn/goyo.vim'
" }}}
" vimwiki {{{
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
let g:vimwiki_list = [{'path': '~/Nextcloud/Notes/', 'syntax': 'markdown', 'ext': '.md',
            \ 'auto_toc':1 ,
            \ 'auto_tags':1,
            \ 'auto_diary_index':1}]
let g:vimwiki_table_mappings = 0
let g:vimwiki_key_mappings =
            \ {
            \   'all_maps': 1,
            \   'global': 1,
            \   'headers': 0,
            \   'text_objs': 0,
            \   'table_format': 0,
            \   'table_mappings': 0,
            \   'lists': 1,
            \   'links': 1,
            \   'html': 0,
            \   'mouse': 0,
            \ }
let g:vimwiki_folding = 'custom'
let g:vimwiki_filetypes = ['markdown', 'pandoc']
let g:vimwiki_global_ext = 0
:nmap <M-+> <Plug>VimwikiIncrementListItem
:vmap <M-+> <Plug>VimwikiIncrementListItem
:nmap <M--> <Plug>VimwikiDecrementListItem
:vmap <M--> <Plug>VimwikiDecrementListItem
:map >> <Plug>VimwikiIncreaseLvlSingleItem
:map >>> <Plug>VimwikiIncreaseLvlWholeItem
:map << <Plug>VimwikiDecreaseLvlSingleItem
:map <<< <Plug>VimwikiDecreaseLvlWholeItem
" }}}
" vim-pandoc {{{
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
let g:pandoc#folding#level=3
let g:pandoc#folding#fdc=3
let g:pandoc#compiler#arguments = "--standalone --slide-level=2 --highlight-style=breezeDark"
" }}}
" markdown-preview {{{
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" }}}
" blindFS/vim-reveal {{{
Plug 'blindFS/vim-reveal'
" }}}
" vim-grammarous {{{
Plug 'rhysd/vim-grammarous'
" }}}
" vim-you-autocorrect {{{
Plug 'sedm0784/vim-you-autocorrect'
" }}}
" vim-nix {{{
Plug 'LnL7/vim-nix'
" }}}
" vim-cucumber {{{
Plug 'tpope/vim-cucumber'
" }}}
" csv.vim {{{
Plug 'chrisbra/csv.vim'
" }}}
" neoformat {{{
Plug 'sbdchd/neoformat'
" }}}
" nvim-lspconfig {{{
Plug 'neovim/nvim-lspconfig'
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" }}}
" nvim-treesitter {{{
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" }}}
" nvim-compe {{{
Plug 'hrsh7th/nvim-compe'
" }}}
" symbols-outline {{{
Plug 'simrat39/symbols-outline.nvim'
nnoremap <leader>t :SymbolsOutline<cr>
" }}}
" nvim-web-devicons {{{
Plug 'kyazdani42/nvim-web-devicons' "
" }}}
" lualine {{{
Plug 'hoob3rt/lualine.nvim'
" }}}
" nvim-tree {{{
Plug 'kyazdani42/nvim-tree.lua'
let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width = 40 "30 by default, can be width_in_columns or 'width_in_percent%'
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_auto_resize = 0 "1 by default, will resize the tree to its saved width when opening a file
let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_hijack_cursor = 0 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_update_cwd = 1 "0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose and NvimTreeFocus are also available if you need them

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
" }}}
call plug#end()
"}}}
" lua config {{{
lua require('lspconfig').pyright.setup{}
lua require'lspconfig'.bashls.setup{}
lua require'lspconfig'.clangd.setup{}
lua require'lspconfig'.cmake.setup{}
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.rnix.setup{}
lua require'lspconfig'.rust_analyzer.setup{}
lua require'lspconfig'.yamlls.setup{}
lua require('nvim-treesitter.configs').setup { ensure_installed = "maintained", highlight = { enable = true, disable = {}, }, }
lua require 'nvim-treesitter.install'.compilers = { "clang" }
lua << EOF
vim.o.completeopt = "menuone,noselect"
require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
    spell = true;
  };
}
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

EOF

lua << EOF
local colors = {
    bg = '#202328',
    fg = '#bbc2cf',
    yellow = '#ECBE7B',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#98be65',
    orange = '#FF8800',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#51afef',
    red = '#ec5f67'
    }
require('lualine').setup {
  options = {
    section_separators = {'', ''},
    component_separators = {'', ''}
  },
  extensions = {'quickfix', 'nvim-tree', 'fugitive'},
  sections = {
    lualine_b = {
      'branch',
      'diff'
    },
    lualine_y = {
      {'diagnostics',
          sources = {'nvim_lsp'},
          symbols = {error = ' ', warn = ' ', info = ' '},
          color_error = colors.red,
          color_warn = colors.yellow,
          color_info = colors.cyan
      }
    }
  }
}
EOF

" }}}
