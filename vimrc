" this is custom version of /etc/vimrc file 
" which comes from Git Bash installation on Windows
" please replace the original with this one + change the Theme to gruvbox
" manually for better user experience

" ============ General ============
" make sure Vim is in modern mode (this is needed for Git Bash Terminal) - Windows
set nocompatible

" define leader and neutralize the <Space> key as this is the leader!
" for some reasons the Git Bash terminal (Windows) needs this!
let mapleader = " "
nnoremap <Space> <Nop>
xnoremap <Space> <Nop>

set showmode                    
" set clipboard to unnamed to access the system clipboard under Windows
set clipboard=unnamed           
" Better command line completion
set wildmode=list:longest,longest:full   
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
" Show a few lines of context around the cursor. Makes navigation smoother.
set scrolloff=3
" Do incremental searching.
set incsearch

" keep the clipboard content even when replacing text
" deletes selected tex to black hole register
xnoremap<leader>p "_dP
" deletes to black hole register
nnoremap<leader>d "_d
vnoremap<leader>d "_d

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
nnoremap <leader>h :split<CR>" faster splits resizing
nnoremap <leader><Left> :vertical resize -5<CR>
nnoremap <leader><Right> :vertical resize +5<CR>
nnoremap <leader><Up> :resize +5<CR>
nnoremap <leader><Down> :resize -5<CR>

" Yank to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" centers the screen always scrolling down or up
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Yank from cursor to end of line, to be consistent with C and D.
nnoremap Y y$

"-----SECTION BELOW WAS JUST COPIED FROM THE DEFAULT /etc/vmirc-----

" Show EOL type and last modified timestamp, right after the filename
" Set the statusline
set statusline=%f               " filename relative to current $PWD
set statusline+=%h              " help file flag
set statusline+=%m              " modified flag
set statusline+=%r              " readonly flag
set statusline+=\ [%{&ff}]      " Fileformat [unix]/[dos] etc...
set statusline+=\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})  " last modified timestamp
set statusline+=%=              " Rest: right align
set statusline+=%l,%c%V         " Position in buffer: linenumber, column, virtual column
set statusline+=\ %P            " Position in buffer: Percentage

if &term =~ 'xterm-256color'    " mintty identifies itself as xterm-compatible
  if &t_Co == 8
    set t_Co = 256              " Use at least 256 colors
  endif
  " set termguicolors           " Uncomment to allow truecolors on mintty
endif

"-------------------------------------------------------------------
