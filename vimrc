"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	 ______   ______     __  __     __  __      					"
"	/\__  _\ /\  == \   /\ \/\ \   /\_\_\_\     					"
"	\/_/\ \/ \ \  __<   \ \ \_\ \  \/_/\_\/_    					"
"	   \ \_\  \ \_\ \_\  \ \_____\   /\_\/\_\   					"
"		\/_/   \/_/ /_/   \/_____/   \/_/\/_/   					"
"																	"
"			   __   __   __     __    __     ______     ______      "
"			  /\ \ / /  /\ \   /\ \-./  \   /\  == \   /\  ___\     "
"			  \ \ \'/   \ \ \  \ \ \-./\ \  \ \  __<   \ \ \____    "
"		/\_\   \ \__|    \ \_\  \ \_\ \ \_\  \ \_\ \_\  \ \_____\   "
"		\/_/    \/_/      \/_/   \/_/  \/_/   \/_/ /_/   \/_____/   "
"																	"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Welcome to my .vimrc ! It's still a work in progress, I tried to
" make it easy to understand.
" There are :   General settings / Identation / Completion
"				Explorer / Plugins / Theme / Statusbar
"																Trux

"		GENERAL SETTINGS
""""""""""""""""""""""""""""""""""""""""
syntax on
set number
set mouse=a
set nopaste
set noshowmode
set showcmd
set cursorline
set scrolloff=5		" keep x lines above / before cursor
set showmatch		" show matching (){}[]
" Clipboard=unnamedplus : Yank to system clipboard with "+y
" and Paste from it with "+p if vim --version got +clipboard or +xtermclipboard
set clipboard=unnamedplus

"	Indentation
""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
set autoindent
set tabstop=2
set shiftwidth=2

setlocal list 		"Necessary for next line
set listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+
"highlight TabLineSel ctermfg=blue ctermbg=black "WIP

" : WILDMENU : Enhannce command line completion
set wildmenu
set wildmode=longest:full,list:full " Set completion behavior, see :help wildmode

"	Brackets Auto Completion :
""""""""""""""""""""""""""""""""""""""""
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ` ``<Left>
inoremap <expr> <CR> search('{\%#}', 'n') ? "\<CR>\<CR>\<Up>\<C-f>" : "\<CR>"


" Function that toggle on and of the left side explorer
" by pressing CTRL + e
function! ToggleExplorer()
    " Check if the explorer is currently open
    if exists("g:explorer_is_open") && g:explorer_is_open
        " Close the explorer window
       "silent! :Lexplorer close
        call win_gotoid(g:wid)
        let g:explorer_is_open = 0
        silent! :q
    else
        " Open the explorer window
        silent! :Vex
        let g:explorer_is_open = 1
        let g:wid = win_getid()
    endif
endfunction

" Map a key to toggle the explorer window
map <C-t> :terminal <CR>
map <space>t :terminal <CR>

tnoremap <C-t> exit<CR>
tnoremap <space>t exit<CR>
tnoremap <space><space> <C-w>w
"tnoremap <C-t> :call ToggleTerminal()<CR>


nnoremap <silent> <C-e> :call ToggleExplorer()<CR>
nnoremap <silent> <space>e :call ToggleExplorer()<CR>
nnoremap <space><right> <C-w><right>
nnoremap <space><left> <C-w><left>
nnoremap <space><down> <C-w><down>
nnoremap <space><up> <C-w><up>
nnoremap <space><space> <C-w>w

"kj to do Escape"
inoremap kj <esc>
"jk to do Enter
inoremap jk <CR>
cnoremap jk <CR>

nnoremap <space>c :

map VS <space>e <space>t <space><space>


set termwinsize=10*0  ""row*colomn, will be size of window or at least that.Aazjhhj

"Custom Explorer with :Vex
""""""""""""""""""""""""""""""""""""""""
let g:netrw_winsize = 20"Vex will be 25% window size
let g:netrw_liststyle = 3"Tree style display
let g:netrw_banner = 0"No Banner
"Browse_split : 1 new hsp 2 new vsp 3 new tab 4 previous window
let g:netrw_browse_split = 4
let g:netrw_list_hide = '^\..*/$' "Hide .directories/
let g:netrw_hide = 1
"let 

" Make explorer netrw close if alone
"aug netrw_close
"  au!
"    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw"|q|endif
"    aug END

"""" GOOD LINE FOR AUTO EXPLORER CLOSE WHEN LAST WINDOW
" Automatically close the netrw explorer if it's the only window left
"autocmd BufEnter * if (winnr("$") == 1 && exists("b:netrw_curdir")) | q | endif

" Close the netrw explorer if all its buffers are deleted
autocmd BufDelete * if (winnr("$") == 1 && exists("b:netrw_curdir")) | q | endif

""Custom Ex Commands :
"""""""""""""""""""""""""""""""""""""""""
"set splitbelow
""set termwinsize=25
""command Vscode :Vex :Hex
"" wid = win_getit() " => set focus where you want
""autocmd VimEnter * let wid = win_getid()
"" call win_gotoid(wid) " => to go back to that focus
""autocmd VimEnter * call win_gotoid(wid)
"
"autocmd VimEnter * let wid = win_getid()
"autocmd VimEnter * Vex
"autocmd VimEnter * call win_gotoid(wid)
"
""autocmd VimEnter * let wid = win_getid()
"set termwinsize=10*0  ""row*colomn, will be size of window or at least that.
""autocmd VimEnter * terminal
""autocmd VimEnter * call win_gotoid(wid)
"
"""" Tentative d'ouverture de l'explorer on a new tab
""autocmd TabNew * let wid = win_getid()
"autocmd TabNew * Vex
"autocmd TabNew * wincmd r
""" Used to resize 
"autocmd TabNew * exec 'vertical resize '. string(&columns * 0.80)
"
""autocmd VimEnter * wincmd k " to do a CTRL-W k 



"		PLUGINS SECTION
""""""""""""""""""""""""""""""""""""""""
"	auto load / install pluging manager : vim-plug
""""""""""""""""""""""""""""""""""""""""
if !1 | finish | endif    " I still dont get that line....
if empty(glob('~/.vim/autoload/plug.vim'))
	echo "Installing VimPlug..."
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif 

"	Plugins List
""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'vim-utils/vim-man'				"View Manual in vim
Plug 'drewtempelmeyer/palenight.vim'	"Palenight theme
"Plug 'ayu-theme/ayu-vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-syntastic/syntastic'
call plug#end()

"	Color Theme
""""""""""""""""""""""""""""""""""""""""
colorscheme palenight
"set termguicolors
"let ayucolor="mirage" "dark
"colorscheme ayu

"	Syntastic Settings
""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_sh_checkers = ['shellcheck', 'sh']


"	Status Line
""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:lightline = {
	\ 'colorscheme': 'palenight',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
	\ }
	\ }

"	Read manual from vim
""""""""""""""""""""""""""""""""""""""""
"	Paste next line to terminal once (or in .bashrc)
" vman() { vim -c "Man $1 $2" -c 'silent only' }


"abbreviation !! 
abbr _sh #!/bin/bash

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml "foldmethod=indent
""autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab}
autocmd FileType yaml setlocal ai et ts=2 sw=2 cuc cul



" NEW SECTION trux 21/04/2023

" Search incrementally
set incsearch
" enable line wrapping
set wrap
" avoid wrapping a line in the middle of a word
set linebreak

set background=dark

colorscheme palenight

set splitbelow
set splitright
