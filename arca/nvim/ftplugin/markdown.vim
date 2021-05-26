"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Markdown configurations                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal nonumber                            " Don't display numbers
setlocal wrap linebreak                      " Nice line breaks
setlocal nofoldenable                        " Disable nvim folding

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Specific plugin config                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown ----
let b:vim_markdown_fenced_languages = ['csharp=cs', 'python=python', 'json=javascript', 'plantuml']
let b:vim_markdown_math = 1

" ==markdown preview==
let b:mkdp_refresh_slow = 0
let b:mkdp_auto_close = 0
let b:mkdp_markdown_css = '/home/felipejoribeiro/.config/nvim/dracula_md_css.css'
let b:indentLine_setConceal= 0
let g:indentLine_setConceal = 0
" let g:mkdp_markdown_css = '/home/felipejoribeiro/.config/nvim/github_md_css.css'
" let g:mkdp_markdown_css = '/home/felipejoribeiro/.config/nvim/prism_md.css'

" Applying code Action to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Mapping and auto command                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>R :source $MYVIMRC<CR> :source ~/.config/nvim/ftplugin/markdown.vim<CR>
nnoremap <M-1> :MarkdownPreview<CR>
nmap <leader>g :Goyo<CR>
nmap <leader>P :PencilSoft<CR>
nmap <leader>p :PencilToggle<CR>
