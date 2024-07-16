"     ____  _____ ______
"    / __ \/ ___// ____/	
"   / / / /\__ \/ /    		github.com/ismashbuttons 
"  / /_/ /___/ / /___  		dencha@airmail.cc 
" /_____//____/\____/       2024.07.16
" My gVim config for Windows

" = GLOBAL VARIABLES =
let g:Home='C:\Users\chavesd'
let g:Mypy='C:\Users\chavesd\python_scripts'
let g:DWD='P:\HPD_Shar\07_SES_MFG\SES\ PROGRAMS\ FOR\ PRODUCTION\' 

" = User Interface =
set title                       " Update the title of your window/terminal
set number relativenumber       " The best way to number lines in Vim.
set ruler                       " Display cursor position
set nowrap                      " Do not wrap lines unless I fucking tell you to, Vim!
set scrolloff=3                 " Remove the buffer zone between the cursor and top/bottom of screen.
syntax enable                   " Turn on syntax highlighting
colorscheme gruvbox             " the best color scheme in the universe 💯
"colorscheme solarized          " pretty good 👍
"colorscheme elflord            " high contrast
set background=dark             " light or dark
set colorcolumn=80              " Puts a colored column on the screen n spaces from the left.
set cursorline                  " highlights current line
set guioptions=                 " T: GUI toolbar; blank: no GUI toolbar
set guifont=Cascadia\ Mono:h12  " Set font
set antialias                   " Make the text smooth and sexy.
set mouse=a                     " Enable mouse stuff
set wildmenu                    " visual autocomplete for command menu

" = SEARCHING =
set smartcase ignorecase        " Searches are case-insensitive by deafult and become case-sensitive if you use a capital letter.
set hlsearch                    " Highlight search results
set incsearch                   " Highlight search results while typing.
" == SEARCHING → KEYBINDS ==
" Clear search highlights ↓
nnoremap <leader>hl :nohlsearch<cr>

" = TABS & INDENTS =
set tabstop=4                   " Number of visual spaces per TAB
set softtabstop=4               " Number of spaces in tab while editing.
set shiftwidth=4                " `>>` or `<<` shifts a line 4 spaces.
set smartindent	                " Automatically indents based on previous lines.
set expandtab                   " No tabs. Only spaces.

" = FOLDING =
set foldenable              " enable folding
set foldmethod=indent       " fold lines based on indents
set foldlevelstart=10       " open most folds by default
set foldnestmax=10          " 10 nested folds max

" = MISC OPTIONS =
set nocompatible                                " Remove compatibility with Vi
set backspace=indent,eol,start                  " Make the backspace key behave as expected.
set noswapfile                                  " Stop swapfiles from being created. If you loose power or crash, you will lose your work!
set nobackup                                    " Don't do automatic backups
set viewdir=C:\Users\chavesd\vimfiles\view      " Location of for 'view' storage:
set undodir=C:\Users\chavesd\vimfiles\undodir   " location of undo directory on Windows systems:
set undofile                                    " Save the undo history with each file.
set textwidth=0                                 " Stop hard text-wrapping
"let g:solarized_menu=0                         " This function in solarized color scheme generates an error.
set noerrorbells	                            " No annoying bells. 
cd g:DWD                                        " Enter default working directory.

" = FILETYPE SETTINGS =
filetype on             " Enable filetype-specific behavior like syntax highlighting
filetype plugin on      " Enable loading the plugin files for specific file types.
filetype indent on      " Vim will attempt to recognize the file type and indent accordingly. Ex: if Vim detects you are editing a C file, it will apply C-style indents. 
" == FILETYPE → MARKDOWN ==
autocmd FileType markdown setlocal wrap linebreak 
autocmd FileType markdown setlocal spell spelllang=en_us
" == FILETYPE → NC ==
autocmd BufNewFile,BufRead *.mpf set filetype=nc
autocmd BufNewFile,BufRead *.nc set filetype=nc
" Toggle scroll bind ↓
autocmd filetype nc nnoremap <leader>sl :set scb!<CR> 
" == FILETYPE → VIMWIKI ==
autocmd FileType vimwiki setlocal wrap linebreak 
autocmd FileType vimwiki setlocal spell spelllang=en_us

" = KEY BINDINGS =
" lead char is a space ↓
let mapleader=" " 
" Launch editNC's backplotter with the current file. ↓
nnoremap <leader><C-b> :!editNC11.exe -b "%:p"<CR>
" open current file in python interpreter. ↓
nnoremap <leader>py :!python "%:p"<CR>
" open current file in python interpreter, interactive mode. ↓
nnoremap <leader>ipy :!python "%:p"<CR>
" map jk in insert mode to escape ↓
inoremap jk <esc>

" == KEY BINDINGS → VIM WINDOWS ==
" move to window left:
nnoremap <C-h> :wincmd h<CR>    
" move to window down:
nnoremap <C-j> :wincmd j<CR>    
" move to window up:
nnoremap <C-k> :wincmd k<CR>    
" move to window right:
nnoremap <C-l> :wincmd l<CR>    
" Increase horizontal split by 3 lines:
nnoremap <C-up> :resize +3<CR>  
" Decrease horizontal split by 3 lines:
nnoremap <C-down> :resize -3<CR>  
" Decrease vertical split by 3 columns:
nnoremap <C-left> :vertical resize -3<CR>  
" Increase vertical split by 3 columns:
nnoremap <C-right> :vertical resize +3<CR>  

" == KEY BINDINGS → NETRW ==
" Toggle netrw in a window on the left side (project drawer style):
nmap <leader>fl :Lexplore<CR>
" Bring up Netrw in the current window:
nmap <leader>fe :Explore<CR>
" Split horizontally and explore:
nmap <leader>fs :Hexplore<CR>
" Split vertically and explore:
nmap <leader>fvs :Vexplore<CR>
" Return from explore to buffer you were in when
" you started Netrw:
nmap <leader>fr :Rexplore<CR>

" == KEY BINDINGS → BUFFERS ==
" Choose another buffer from a list ↓
nnoremap <leader>bl :buffers<CR>:b  
" Delete selected buffer ↓
nnoremap <leader>bd :buffers<CR>:bdelete 
" select buffer and split ↓
nnoremap <leader>bs :buffers<CR>:sbuffer 
" Wipe Vim clean by deleting all buffers ↓
nnoremap <leader>bw :bufdo bwipeout<CR>
" Switch to next buffer in the list ↓
nnoremap <leader>bn :bn<CR>

" = VIM AIRLINE =
let g:airline_detect_modified=1
let g:airline_detect_spell=1
let g:airline_theme='gruvbox'

" = NETRW =
let g:netrw_keepdir = 0                         " Keep the current working dir and browsing dir synced. Helps prevent copy/move errors:
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'  " Hide hidden files/directories by default:
let g:netrw_localcopydircmd = 'cp -r'           " Change the copy command to allow copying of directories:

" = TEXT SNIPPETS =
let @c = 'I(A)j'
let @l = 'A (R.LIP)'
let @h = 'ggjjf.r:a j0llveuf-r:hxjF-r:jf-r:jF-r:jkkkblveujjjeea:j^aMaterial: '
let @g = ':%s/g28 u0 w0\|g28 u0.0/G28'
let @s = ':%s/^\s\+//'

" = USER DEFINED COMMANDS = 
command FixSpaces %s/^\s\+//g
command SESF term py.exe C:\Users\Chavesd\python_scripts\sesf\v3\main.py
command CSS %s/g97.*/G50 S2000\rG96 S2000 M03/
command ScrollBind windo set scb!
