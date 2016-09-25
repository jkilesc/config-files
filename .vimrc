" set nocompatible
syntax on

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

filetype on " Without this vim emits a zero exit status because of later :ft off
filetype off

" First insall vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" then when adding a new plugin:
" Run PlugInstall or PlugClean
call plug#begin('~/.vim/plugged')

"filetypmck/vim-coffee-script'
"Plug 'airblade/vim-gitgutter'
"Plug 'altercation/vim-colors-solarized'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gmarik/vundle'
Plug 'gregsexton/MatchTag'
Plug 'groenewege/vim-less'
Plug 'int3/vim-taglist-plus'
Plug 'kien/ctrlp.vim'
Plug 'ternjs/tern_for_vim' " Need to run npm install in ~/.nvim/plugged/tern_for_vim
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nono/vim-handlebars'
Plug 'moll/vim-node'
" Plug 'pangloss/vim-javascript' " This was fucking up the formatting of comments
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vividchalk'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/greplace.vim'
Plug 'vim-scripts/kwbdi.vim'
Plug 'chrisbra/Recover.vim'
Plug 'othree/xml.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'terryma/vim-expand-region'
" Plug 'wookiehangover/jshint.vim' " These were making vim slow
" Plug 'Shutnik/jshint2.vim'
Plug 'godlygeek/tabular'

" Add plugins to &runtimepath
call plug#end()

filetype plugin on
filetype plugin indent on

set autoindent
set autoread                         " Automatically update a file in vim when it has been updated outside of vim
set clipboard=unnamed                " Synchronize Vim's default register and the clipboard register to copy and paste
set complete -=i                     " Searching included files (i) is too slow to be practical in auto complete
set directory-=.                     " don't store swapfiles in the current directory
set display+=lastline
set expandtab                        " Expand tabs to look like they are 8 spaces instead of 4
set fileformats+=mac                 " Interpret mac line endings correctly
set foldlevelstart=1
set foldmethod=indent
set ignorecase                       " Ignore case in searching
set incsearch                        " Incremental search - will begin searching as you type a search phrase
set laststatus=2                     " Set the status of all windows open to show by default
set nowrap                           " Turn off wordwrap
set nrformats-=octal                 " Remove octal so that CTRL+A and CTRL+X can increment and decrement numbers
set number                           " Show line numbers
" set omnifunc=syntaxcomplete#Complete " Enable autocomplete
set relativenumber
set ruler                            " Shows current line number and column in bottom right corner
set scrolloff=3                      " Set there to always be 3 line above/below and 5 spaces to each side of
set shiftround                       " Setting shiftround with indent to a multiple of shiftwidth when using > or <
set shiftwidth=2                     " Replace all tabs with 2 spaces
set showcmd                          " Shows information about the current command being used, namely visual mode
set showmatch                        " Jump to the matching bracket if it exists, if it doesn't beep
set sidescrolloff=5
set smartcase                        " Unless we specify a case
set smarttab
set softtabstop=2
set spell                            " Turn on spell check, should be intelligent enough to work with html
set tabstop=2                        " Deal with spaces, tabs and lines
set textwidth=119                    " Makes comments wrap at the end of the line
set ttimeout                         " Sets the amount of time to wait during keyboard combinations
set ttimeoutlen=50
set wildmenu                         " Autocomplete vim commands when you push tab in the menu

" Folding
let javaScript_fold=1

" Change p to move the cursor to the end of the pasted item after pasting
" noremap p gpk

" Indenting
vmap > >>
vmap < <<

" Remap ultisnips so it doesn't interfere with you complete me
" This is going to interfere with switching between windows, commenting for
" now until I can figure out a better method
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Resizing splits, use a single key so it can be held down
nmap > <C-W>>
nmap < <C-W><
nmap + <C-W>+
nmap - <C-W>-

" Increment and decrement numbers with + and -
nnoremap <kPlus> <C-a>
nnoremap <kMinus> <C-x>

set mouse=a
if exists('$TMUX') && !has('nvim')  " Support resizing in tmux
  set ttymouse=xterm2
endif
if &history < 1000
	set history=1000 " Save the last 1000 vim commands used
endif
if &tabpagemax < 50
	set tabpagemax=50 " Number of tabs, as in web browser tabs not the keyboard tab, allowed in vim
endif

" Keyboard Shortcuts
let mapleader = ','

"CTRL+U undo's the last line typed in insert mode and CTRL+W does the same for
"the last word, adding these lines allows you to push <ESC> then u to undo the
"undo caused by CTRL+U and CTRL+W if they are typed by accident. Its described
"further here: vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
" inoremap <c-w> <c-g>u<c-w>

"Fix & use, to apply last search with last flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

"Yank from the cursor to the end of the line into register
"nnoremap Y y$

map <leader>l :Align 
nmap <leader>a :Ack
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :TernType<CR>
nmap <leader>gd :TernDef<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>] :TlistToggle
nmap <leader><space> :call whitespace#strip_trailing()<CR>
" nmap <leader>g :GitGutterToggle<CR>
nmap <leader>c <Plug>Kwbd
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'<CR>

" Configure NerdTree
let NERDTreeShowHidden=1 " Show hidden files

"Set syntax highlighting for unusual file types
au BufNewFile,BufRead *.pde set filetype=java
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.mustache set filetype=html
au BufRead,BufNewFile *.md set filetype=markdown

" Syntactic
let g:syntastic_javascript_checkers = ['eslint']

" Line wrapping
autocmd bufreadpre *.txt setlocal textwidth=119
autocmd bufreadpre *.md setlocal textwidth=119

" Format the statusline
set statusline=%F
set statusline+=%=  
set statusline+=%l/%L

" Manage Panes
map <C-W><bar> <C-W>v<C-W><Right>
map <C-W>_ <C-W>s<C-W><Down>

" Color Scheme
colorscheme elflord 
" Color Indents using vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=16 " Black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8 " Grey

" Highlight past 119 columns
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(120,999),",")


" Error colors
hi clear SpellBad
hi SpellBad cterm=underline

" Make ctrl+p faster
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" You Complete Me options
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1

" Tern
let g:tern_map_keys=1
let tern#is_show_argument_hints_enabled=1
let g:tern_show_argument_hints='on_hold'
