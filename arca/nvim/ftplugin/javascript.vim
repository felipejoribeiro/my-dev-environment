"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Markdown configurations                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal nowrap                              " The text won't fold by Vim
setlocal foldmethod=syntax                   " foldable
setlocal foldnestmax=10

setlocal list lcs=tab:\┊\ 

setlocal noexpandtab
setlocal copyindent
setlocal preserveindent
setlocal softtabstop=0
setlocal shiftwidth=2
setlocal tabstop=2

highlight NonText guifg=#636363
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Specific plugin config                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Mapping and auto command                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>R :source $MYVIMRC<CR> :source ~/.config/nvim/ftplugin/javascript.vim<CR>
