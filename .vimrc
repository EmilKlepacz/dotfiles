" ============ General ============
" leader key changed from default
let mapleader = " "

" Ignore capital letters during search.
set ignorecase
" Use highlighting when doing a search.
set hlsearch
" (:split) opens window below
set splitbelow
" (:vsplit) opens window on right side
set splitright
" line number visble
set number
" turn hybrid line numbers on
set number relativenumber
" Enable persistent undo
set undofile

" Centralize backups, swapfiles and undo history
if !isdirectory(expand("~/.vim/backups"))
    call mkdir(expand("~/.vim/backups"), "p")
endif
set backupdir=~/.vim/backups

if !isdirectory(expand("~/.vim/swaps"))
    call mkdir(expand("~/.vim/swaps"), "p")
endif
set directory=~/.vim/swaps

if exists("&undodir") && !isdirectory(expand("~/.vim/undo"))
    call mkdir(expand("~/.vim/undo"), "p")
endif
set undodir=~/.vim/undo

" keep the clipboard content even when replacing text
" deletes selected tex to black hole register
xnoremap<leader>p "_dP
" deletes to black hole register
nnoremap<leader>d "_d
vnoremap<leader>d "_d

"please disable this one vimrc is used as intellij source for plugin
"as there is already this functinallity in the intellilj by default
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>

" double esc disable highliting after search
nnoremap <Esc><Esc> :nohlsearch<CR>

" faster quit
nnoremap <leader>q :q!<cr>
" faster save
nnoremap <leader>w :w<cr>
" faster save all buffers/files
nnoremap <leader>a :wa<cr>
" faster save and quit
nnoremap <leader>z :wq<cr>

" better windows navigation in split view
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
" faster opening of split
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
" faster splits resizing
nnoremap <leader><Left> :vertical resize -5<CR>
nnoremap <leader><Right> :vertical resize +5<CR>
nnoremap <leader><Up> :resize +5<CR>
nnoremap <leader><Down> :resize -5<CR>
" Yank ) to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Reload .vimrc configuration
" prints confirmation
" clears the last search pattern (which might be highlighting empty spaces)
" disables any remaining search highlighting
nnoremap <leader>r :source $MYVIMRC \| echo "Vim config reloaded!" \| let @/ = "" \| nohlsearch<CR>
" Removes trailing whitespaces for each line
" disables any remaining search highlighting
nnoremap <leader>t :%s/\s\+$//g<CR>:nohlsearch<CR>

" centers the screen always scrolling down or up
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Yank from cursor to end of line, to be consistent with C and D.
nnoremap Y y$

" ============ Plugins Initialization ============
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/vim-easy-align'
Plug 'morhetz/gruvbox'
Plug 'machakann/vim-highlightedyank'
" gcc -> comments line; gc for comment visual selection;
Plug 'tpope/vim-commentary'
call plug#end()

" ============ Plugins configuration ============
" vim-airline plugin
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" simplify z section to display current/total lines only
let g:airline_section_z = '%l/%L'

" nerd-tree  plugin
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" vim-easy-aligin plugin
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vimwiki plugin
" .md files for markdown syntax handled by github
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]

" ============ Setting theme ============
set background=dark
colorscheme gruvbox
