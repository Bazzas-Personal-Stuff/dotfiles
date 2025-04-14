set tabstop=8
set scrolloff=7
set sidescrolloff=7

" nnoremap <SPACE> <Nop>
" let mapleader=" "

" Navigate splits
nnoremap <S-h> <C-w><C-h>
nnoremap <S-j> <C-w><C-j>
nnoremap <S-k> <C-w><C-k>
nnoremap <S-l> <C-w><C-l>

" Create splits
nnoremap <C-h> <C-w>v
nnoremap <C-j> <C-w>s<C-w><C-j>
nnoremap <C-k> <C-w>s
nnoremap <C-l> <C-w>v<C-w><C-l>

" Stay in visual mode while indenting
vnoremap < <gv
vnoremap > >gv

" Explorer
nnoremap <leader>e :Ex 