" Plugins:
call plug#begin('~/.vim/plugged')    
    " Tree view
    Plug 'scrooloose/nerdtree' 
    " One theme
    Plug 'rakr/vim-one'
    " Configurable line
    Plug 'itchyny/lightline.vim'
    " Lint
    Plug 'w0rp/ale'
    " Integration ALE to Lightline 
    Plug 'maximbaz/lightline-ale'
call plug#end()

" UI config
set number
set cursorline
set colorcolumn=80

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
\        'right': [ 
\           ['lineinfo', 'linter_errors', 'linter_warnings', 'linter_ok' ], 
\           [], 
            [ 'fileencoding', 'filetype'] ]
\	 },
\    'inactive': {
\	     'right': [['lineinfo'], [], [] ]
\    },
\    'component_function': {
\        'filetype': 'LightlineFiletype',
\        'fileencoding': 'LightlineFileencoding',
\        'mode': 'LightlineMode',
\        'filename': 'LightlineFilename',
\    }}
" Hide filetype and fileencoding when width < 50
function! LightlineFiletype()
    return winwidth(0) > 50 ? &filetype : ''
endfunction
function! LightlineFileencoding()
    return winwidth(0) > 50 ? &fileencoding : ''
endfunction
" Additional configuration for specific plugins
function! LightlineMode()
    return expand('%:t') ==# '__Tagbar__' ? 'Tagbar':
\       expand('%:t') ==# 'ControlP' ? 'CtrlP' :
\       &filetype ==# 'unite' ? 'Unite' :
\       &filetype ==# 'nerdtree' ? 'NERDTree' :
\       lightline#mode()
endfunction
function! LightlineFilename()
    return &filetype ==# 'unite' ? unite#get_status_string() :
\       &filetype ==# 'nerdtree' ? '' :
\       expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

" Lintline-ale configuration
let g:lightline.component_expand = {
\    'linter_warnings': 'lightline#ale#warnings',
\    'linter_errors': 'lightline#ale#errors',
\    'linter_ok': 'lightline#ale#ok',
\ }
let g:lightline.component_type = {
\    'linter_warnings': 'warning',
\    'linter_errors': 'error',
\    'linter_ok': 'left',
\ }

" NERD tree setup
autocmd vimenter * NERDTree
let g:NERDTreeWinSize = 40
" Remove help line
let NERDTreeMinimalUI=1
let NERDTreeDirArrows = 1
" Close tab if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ALE config
" Check Python files with flake8 and pylint.
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 0
