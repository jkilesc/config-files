" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

"This stuff is from sensible.vim found at
"github.com/tpope/vim-sensible/blog/master/plugin/sensible.vim

set autoindent

"Searching included files (i) is too slow to be practical, so we'll remove
"this from the auto complete functionality. Explenation here:
"stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
set complete -=i 

"Jump to the matching bracket if it exists, if it doesn't beep
set showmatch

set smarttab

"Remove octal so that CTRL+A and CTRL+X can increment and decrement numbers
"starting with 0 like they are normal numbers
set nrformats-=octal

"Setting shiftround with indent to a multiple of shiftwidth when using > or <
"instead of just adding an additional shiftwidth to the selection
set shiftround

"Sets the amount of time to wait during keyboard combinations
set ttimeout
set ttimeoutlen=50

"Incremental search - will begin searching as you type a search phrase
set incsearch

"Set CTRL+L to clear last highlighted search word
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

"Set the status of all windows open to show by default
set laststatus=2

"Shows current line number and column in bottom right corner
set ruler

"Shows information about the current command being used, namely visual mode
set showcmd

"Autocomplete vim commands when you push tab
set wildmenu

"Set there to always be two line above/below and 5 spaces to each side of
"whatever you're currently working on
"if !&scrolloff
	set scrolloff=1
"endif
"if !&sidescrolloff
	set sidescrolloff=5
"endif
set display+=lastline

"Automatically update a file in vim when it has been updated outside of vim
set autoread

"Interpret mac line endings correctly
set fileformats+=mac

"Save the last 1000 vim commands used
if &history < 1000
	set history=1000
endif

"Number of tabs, as in web browser tabs not the keyboard tab, allowed in vim
if &tabpagemax < 50
	set tabpagemax=50
endif

"CTRL+U undo's the last line typed in insert mode and CTRL+W does the same for
"the last word, adding these lines allows you to push <ESC> then u to undo the
"undo caused by CTRL+U and CTRL+W if they are typed by accident. Its described
"further here: vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>


"Fix & use, to apply last search with last flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

"Yank from the cursor to the end of the line into register
nnoremap Y y$

"Deal with spaces, tabs and lines
"Replace all tabs with 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
"Expand tabs to look like they are 8 spaces instead of 4
set expandtab
set relativenumber

"Configure search and highlight
"If the 'ignorecase' option is on, the case of normal letters is ignored.
"'smartcase' can be set to ignore case when the pattern contains lowercase
"letters only.
set ignorecase
set smartcase

"Shortcut to open the NERDTree plugin
map <C-n> :NERDTreeToggle<CR>

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
