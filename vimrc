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
    set guifont=DejaVu_Sans_Mono_for_Powerline:h10
    set guifontwide=Yahei_Mono:h10:cGB2312
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
" Airline {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
" }}}
" NERDTree {{{
Plug 'scrooloose/nerdtree'
let g:NERDTreeDirArrows=0
let g:NERDTreeCascadeSingleChildDir=0
let g:NERDTreeCascadeOpenSingleChildDir=0
nnoremap <leader>e :NERDTreeToggle<CR>
" }}}
" Tagbar {{{
Plug 'majutsushi/tagbar'
let g:tagbar_width = 30
nnoremap <leader>t :TagbarToggle<cr>
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
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md',
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
" coc.nvim {{{
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
let g:coc_global_extensions = [
            \ 'coc-clangd',
            \ 'coc-cmake',
            \ 'coc-rls',
            \ 'coc-highlight',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-tag',
            \ 'coc-word',
            \ 'coc-syntax',
            \ 'coc-emoji'
            \ ]
let g:coc_user_config = {
            \ 'coc.source.emoji.filetypes': ['markdown', 'vimwiki.markdown.pandoc'],
            \ 'coc.source.emoji.triggerCharacters': [ '.']
            \ }
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" :  <SID>check_back_space() ? "<TAB>" :  coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" }}}
" csv.vim {{{
Plug 'chrisbra/csv.vim'
" }}}
" neoformat {{{
Plug 'sbdchd/neoformat'
" }}}
call plug#end()
"}}}
