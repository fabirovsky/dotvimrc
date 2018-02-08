" Plugins:
call plug#begin('~/.vim/plugged')
    
    " Tree view
    Plug 'scrooloose/nerdtree' 
    
    " One theme
    Plug 'rakr/vim-one'
    
    " Configurable line
    Plug 'itchyny/lightline.vim' 

call plug#end()


" UI config
set number
set cursorline


" Python indentation
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4


" Theme
syntax on
filetype indent plugin on
colorscheme one
set background=light


" Set transparent background
hi Normal guibg=NONE ctermbg=NONE 


" Lightline configuration
let g:lightline = {
\    'colorscheme': 'one',
\    'active': {
\        'right': [ [ 'lineinfo' ], [], [ 'fileencoding', 'filetype'] ]
\	 },
\    'inactive': {
\	 'right': [['lineinfo'], [], [] ]		
\    }}


" NERD tree setup
autocmd vimenter * NERDTree
let g:NERDTreeWinSize = 40
" Remove help line
let NERDTreeMinimalUI=1
let NERDTreeDirArrows = 1
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" 80 characters line
set colorcolumn=80
