inoremap jk <ESC>
let mapleader = "\<Space>"

filetype plugin indent on
syntax on
set encoding=utf-8

nnoremap <leader>nt :NERDTree<CR>


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_rust_checkers=['rustc']

let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']
" let g:syntastic_debug = 1
" " let g:syntastic_debug_file = "~/syntastic.log" 
