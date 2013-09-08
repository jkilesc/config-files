set nocompatible
syntax on

" Configure Vundle
filetype on " Without this vim emits a zero exit status because of later :ft off
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" Install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif
filetype plugin indent on

set autoindent
set autoread          " Automatically update a file in vim when it has been updated outside of vim
set clipboard=unnamed " Synchronize Vim's default register and the clipboard register to copy and paste
set complete -=i      " Searching included files (i) is too slow to be practical in auto complete
set display+=lastline
set expandtab         " Expand tabs to look like they are 8 spaces instead of 4
set fileformats+=mac  " Interpret mac line endings correctly
set ignorecase        " Ignore case in searching
set incsearch         " Incremental search - will begin searching as you type a search phrase
set laststatus=2      " Set the status of all windows open to show by default
set nrformats-=octal  " Remove octal so that CTRL+A and CTRL+X can increment and decrement numbers
set number            " Show line numbers
set relativenumber
set ruler             " Shows current line number and column in bottom right corner
set scrolloff=3       " Set there to always be 3 line above/below and 5 spaces to each side of
set shiftround        " Setting shiftround with indent to a multiple of shiftwidth when using > or <
set shiftwidth=4      " Replace all tabs with 4 spaces
set showcmd           " Shows information about the current command being used, namely visual mode
set showmatch         " Jump to the matching bracket if it exists, if it doesn't beep
set sidescrolloff=5 
set smartcase         " Unless we specify a case
set smarttab
set softtabstop=4
set tabstop=4         " Deal with spaces, tabs and lines
set ttimeout          " Sets the amount of time to wait during keyboard combinations
set ttimeoutlen=50
set wildmenu          " Autocomplete vim commands when you push tab

set mouse=a
if exists('$TMUX')  " Support resizing in tmux
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
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>] :TlistToggle
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>c <Plug>Kwbd
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'<CR>


"Add TextMate behavior to UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Set syntax highlighting for unusual file types
au BufNewFile,BufRead *.pde set filetype=java

"Git branch
function! GitBranch()
    let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
    if branch != ''
        return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
    en
    return ''
endfunction

" Format the statusline
set statusline=%F
set statusline+=%=  
set statusline+=Line:
set statusline+=%l/%L
set statusline+=%{GitBranch()}

" Manage Panes
map <C-W><Bar> <C-W>v<C-W><Right>
map <C-W>- <C-W>s<C-W><Down>

" Color Scheme
colorscheme elflord 
" Color Indents using vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=16 " Black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8 " Grey
