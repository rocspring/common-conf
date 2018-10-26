 color Tomorrow-Night

" plugins start {{{
 Plugin 'vim-airline/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
 Plugin 'edkolev/tmuxline.vim'
 Plugin 'scrooloose/syntastic'
 Plugin 'posva/vim-vue'
 Plugin 'pangloss/vim-javascript'
 Plugin 'Yggdroot/indentLine'
 Plugin 'heavenshell/vim-jsdoc'
 Plugin 'groenewege/vim-less'
 Plugin 'hail2u/vim-css3-syntax'
" }}} plugins end

 nnoremap Q <nop>
 " fix vim less {{{
 filetype off
 filetype on
 au FileType vue setl sw=2 sts=2 et
 " }}}

 " airline {{{
 set laststatus=2
 let g:airline_theme='luna'
 let g:airline_powerline_fonts=1
 let g:airline_extensions = ['branch', 'syntastic', 'whitespace']
 let g:airline#extensions#tmuxline#enabled = 0
 " }}}

 " syntastic {{{
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*
 let g:syntastic_always_populate_loc_list = 1
 let g:syntastic_auto_loc_list = 1 
 let g:syntastic_check_on_open = 1
 let g:syntastic_check_on_wq = 0
 let g:syntastic_javascript_checkers = ['eslint']
 let g:syntastic_vue_checkers = ['eslint']
 " }}}

 " vim-javascript {{{
 let g:javascript_plugin_jsdoc = 1
 " }}}

" nerdtree {{{mapleader
let g:NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
" }}}
