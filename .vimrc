function! GlobalSearch()
    call inputsave()
    let replacement = input('Search in files: ')
    execute ':vimgrep/'.replacement.'/gj **/*.rs'
    execute ':cw'
endfunction

nnoremap <F6> :call GlobalSearch()<CR>

set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set backspace=eol,start
set list
set listchars=tab:!·,trail:·

inoremap jk <ESC>
let mapleader = "\<Space>"

"open .vimrc in a split and edit, and source
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

"build and test commands
"filetype plugin on
:autocmd Filetype rust compiler cargo
:autocmd Filetype cpp compiler cargo
:autocmd Filetype c compiler cargo
:autocmd Filetype yaml set expandtab
:autocmd Filetype rust set noexpandtab
:nnoremap <leader>mb :make build<cr>
:nnoremap <leader>mt :make test<cr>

"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

syntax on

set encoding=utf-8

:nnoremap <leader>nt :NERDTree<CR>

:nnoremap <F5> :buffers<CR>:buffer<Space>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0 
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["cpp","c"] }

"syntastic rust
let g:syntastic_rust_checkers=['rustc', 'cargo']
let g:syntastic_rust_rustc_exe = 'cargo check --tests'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'

"syntastic gcc
let g:syntastic_cpp_checkers=['gcc']
let g:syntastic_cpp_compiler_options = ' -std=c++0x'

"let g:syntastic_debug = 1
"let g:syntastic_debug_file = "~/syntastic.log" 

let g:ycm_filetype_blacklist = { 'cpp': 1, 'c':1 }
let g:ycm_rust_src_path="~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src"
"let g:ycm_global_ycm_extra_conf = '~/.vim/pack/yeastplume/start/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
nnoremap <Leader>gd :YcmCompleter GoTo<CR>

