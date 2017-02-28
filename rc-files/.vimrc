" ~/.vimrc ybbs

" syntax highlighting
syntax on
filetype plugin indent on

"
" some new things 2017
"

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/
"
" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
" color wombat256mod

"
"
" end of new things 2017
"
set tabstop=4
set softtabstop=4
set expandtab
set list listchars=tab:».,trail:¬

set autoindent
set copyindent
set preserveindent
" set smartindent

" beginner mode :) disable arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <up> <Nop>
ino <left> <Nop>
ino <right> <Nop>

" provide hjkl movements in insert mode via <Alt>
inoremap <A-h> <C-o>h
inoremap <A-h> <C-o>j
inoremap <A-h> <C-o>k
inoremap <A-h> <C-o>l

" line numbers
set number

" müll : 
" color scheme from bytefluent.com/vivify
" colorscheme tob

" highlight color for ¬
" hi NonText ctermfg=7 guifg=gray

"leave insert mode with jk
imap jk <Esc>

