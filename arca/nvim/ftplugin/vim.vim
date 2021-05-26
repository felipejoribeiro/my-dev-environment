"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        General Configuration                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal nofoldenable                        " Disable nvim folding
setlocal conceallevel=0                      " Show plain text
let g:indentLine_setConceal= 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Mapping and auto command                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au! bufwritepost init.vim :source $MYVIMRC      " Source init.vim in save
nnoremap <buffer> <leader>R :source $MYVIMRC<CR> :source ~/.config/nvim/ftplugin/vim.vim<CR>
