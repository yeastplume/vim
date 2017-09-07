function! GlobalSearch()
    call inputsave()
    let replacement = input('Search in files: ')
    call inputrestore()
    execute ':vimgrep/'.replacement.'/gj **/*.rs'
    execute ':cw'
endfunction

nnoremap <F6> :call GlobalSearch()<CR>

set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

set list
set listchars=tab:!·,trail:·

inoremap jk <ESC>
let mapleader = "\<Space>"

"open .vimrc in a split and edit, and source
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

"set compiler to cargo for now
:compiler cargo
:nnoremap <leader>mb :make build<cr>

"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

"filetype plugin indent on
syntax on

set encoding=utf-8

:nnoremap <leader>nt :NERDTree<CR>

:nnoremap <F5> :buffers<CR>:buffer<Space>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0 
let g:syntastic_rust_checkers=['rustc']

let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
"let g:syntastic_debug = 1
"let g:syntastic_debug_file = "~/syntastic.log" 

let g:ycm_rust_src_path="/home/mcordner/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src"
let g:ycm_global_ycm_extra_conf = '/home/mcordner/.vim/pack/yeastplume/start/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
nnoremap <Leader>gd :YcmCompleter GoTo<CR>

