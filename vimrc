let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Select your Leader key
let mapleader = "\<Space>"


"------------------------------------------------------------
" Plugins 
"------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'

" File Commenting
Plug 'tpope/vim-commentary'

" Fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'Fzf'

" Go language support
Plug 'fatih/vim-go'
" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []
" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" Language Server and Formatting Plugins
Plug 'prettier/vim-prettier', {'do': 'npm install'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'codechips/coc-svelte', {'do': 'npm install'}

" netwr https://shapeshed.com/vim-netrw/
let g:netrw_liststyle = 1 "alphabetical list with attributes 

call plug#end()
" Install Plugins - End 

"------------------------------------------------------------
" Settings
"------------------------------------------------------------
" Spellcheck :setlocal spell
" z= to see recommendations.
" set spell
set spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add

" I really do not like automatically continuing comments to new lines.
"  it messes up my pastes and I'm usually writing one line comments anyway.
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

"------------------------------------------------------------
" Mappings
"------------------------------------------------------------
" In Vim, the mapleader or <leader> key is like a namespaced command key for
" user commands so that you don't accidentally override something important
" from the base Vim command set.
"
" By default it is '\', make it space because we are too lazy to reach that
" far and we like using both hands.
"
" The sheerun/vimrc plugin sets this to space when the plugin loads.
"
" Example: <leader>p is <leader> followed by 'p' within 1000ms

" <leader>g should open fzf for all files tracked by git
nnoremap <leader>g :FzfGFiles<CR>

" <leader>o should open fzf for all files
nnoremap <leader>o :FzfFiles<CR>

" <leader>f should run fzf with ripgrep for file text search by content
nnoremap <leader>f :FzfRg<CR>

" Ctrl-/ comments out lines with Commentary
noremap <silent> <C-_> :Commentary<CR>

" system clipboard yank and put
" Note: this requires vim to be built with the +clipboard feature flag
" run :echo has('clipboard') to see if you have it

" Yank all unnamed into the system buffer
set clipboard=unnamedplus

" Stay Centered
nnoremap <silent> j jzz
nnoremap <silent> k kzz
" Scroll Faster
nnoremap <silent> <C-j> 10jzz
nnoremap <silent> <C-k> 10kzz
" Exit insert mode and go forward one character
" inoremap <silent> <Esc> <Esc>`^
