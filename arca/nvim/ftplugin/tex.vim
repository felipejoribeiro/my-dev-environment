"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Markdown configurations                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal wrap linebreak                      " Nice line breaks
setlocal nofoldenable                        " Disable nvim folding
setlocal conceallevel=0                      " Show plain text
let g:indentLine_setConceal= 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Specific plugin config                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Mapping and auto command                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>R :source $MYVIMRC<CR> :source ~/.config/nvim/ftplugin/tex.vim<CR>
nmap <buffer> <silent> <M-1> :w<CR> :VimtexCompile<CR>
nmap <buffer> <silent> <Leader>v : VimtexView<CR>
