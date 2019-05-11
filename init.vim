" The following lines make the cursor work
" on hybrid mode when in normal mode and
" absolute line number in insert mode.
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

set ruler " Show cursor line anc column in status line
syntax enable
set expandtab
set shiftwidth=4
set nowrap
set linebreak
filetype plugin on

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'vim-latex/vim-latex'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'qpkorr/vim-bufkill'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'reedes/vim-pencil'
Plug 'jeetsukumaran/vim-filebeagle'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Always keep 5 lines from bottom/top
set scrolloff=5
" for deoplete you also have to install via pip3 neovim and yapf
" and point python3_host_prog to your python3
let g:python3_host_prog='/opt/local/bin/python3.5'
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#jedi#server_timeout=30

" Search options
set incsearch
set ignorecase
set smartcase
set hlsearch

" Blink words when going for next
" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :nohlsearch<CR><CR>

" New leader
let mapleader=","
let maplocalleader = ";"

" Shortcuts for buffers and files of fzf
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>

" EasyMotion configuration
let g:EasyMotion_do_mapping = 0 "Disable default mappings
hi link EasyMotionShade  Comment
nmap s <Plug>(easymotion-s2)
nmap <Leader>w <Plug>(easymotion-bd-wl)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader><Leader>w <Plug>(easymotion-w)

set hidden

" Syntax Highlighting
syntax on
silent! colorscheme onedark

"Trimwhite space easily
fun! TrimWhiteSpace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

command! TrimWhiteSpace call TrimWhiteSpace()

nnoremap <silent> n n:call HLNext(0.2)<CR>
nnoremap <silent> N N:call HLNext(0.2)<CR>
highlight WhiteOnRed ctermbg=red ctermfg=white

function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'), col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

" FileBeage Remappings
" I only use it to access file search fast and create new ones
let g:filebeagle_suppress_keymaps = 1
map <silent> -          <Plug>FileBeagleOpenCurrentBufferDir


" Startify options
let g:startify_bookmarks = ['~/.config/nvim/init.vim', '~/Dropbox/Thesis']
let g:startify_change_to_dir = 1
let g:startify_relative_path = 1

" Escape terminal key with ESC
:tnoremap <Esc> <C-\><C-n>

" How to disable wrap per file
" Edit  $VIMRUNTIME/ftplugin/filetypename.vim
" In that file write towards the end:setlocal wrap
