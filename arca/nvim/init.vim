"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        General Configuration                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set exrc                                " Ex .nvimrc file in cwd on init
set nohlsearch                          " No highlight when search
set undofile                            " Persistent undo 
set undodir=~/.config/nvim/undodir      " Place to save undo history
set hidden 			                        " Maintain mod buffer opened
set nowrap                              " No word wrapping in general nvim
set encoding=utf-8                      " The encoding written to file
set noerrorbells                        " No sounds
set smartcase                           " Ignore case in search if minuscule
set t_Co=256                            " Supports 256 colors
set noswapfile  		                    " Disable swap file creation
set nobackup	 		                      " Disable backup files
set nowritebackup                       " Don't write to backup files
set shortmess+=c                        " Don't pass messages to short

set incsearch                           " Incremental search highlight
set scrolloff=8                         " Make the cursor stay in center
set sidescrolloff=5                     " Make cursor stay in center
set clipboard=unnamedplus               " Use system's clipboard
set number                              " Creates the left column
set mouse=a                             " Mouse support
set termguicolors                       " Use GUI colors always
set updatetime=300                      " Faster completion
set ttimeout                            " Makes things faster
set timeoutlen=300                      " by default 1000ms
set ttimeoutlen=50                      " Makes things faster
let g:mapleader = " "                   " Map leader to space bar
let maplocalleader=" "                  " More leader to space bar
set backspace=indent,eol,start          " Makes sure back space works
set autoread                            " Auto load file change disco
set fileformat=unix                     " Set file format to a global one
set cmdheight=1                         " Number of lines to display commands
set noshowcmd                           " Don't show key pressed
set title                               " Set window title
syntax enable                           " Enable syntax
set splitright                          " Default split begaviour
set splitbelow                          " Default split begaviour
let g:tex_flavor = "latex"              " recognize latex 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Auto install vim-Plug                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Plug's                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" Global functionalities
Plug 'vim-scripts/restore_view.vim'                           " Save cursor position and folds
Plug 'mbbill/undotree'                                        " Undo tree creation visualization
Plug 'tpope/vim-scriptease'                                   " Helps with source reloads
Plug 'nvim-lua/plenary.nvim'                                  " Lua libs for telescope
Plug 'nvim-telescope/telescope.nvim'                          " DAMN fuzzy finder
Plug 'nvim-telescope/telescope-fzy-native.nvim'               " Makes fuzzy finder faster
Plug 'sheerun/vim-polyglot'                                   " syntax highlighting in most languages

" Code dev direct enhancements
Plug 'neoclide/coc.nvim', {'branch': 'release'}               " ide like functions
Plug 'sirver/ultisnips'                                       " Best snippets functions
Plug 'jiangmiao/auto-pairs'                                   " auto pairs functionality and movements
Plug 'tpope/vim-surround'                                     " More auto pairs functions
Plug 'junegunn/vim-easy-align'                                " easy align items
Plug 'tomtom/tcomment_vim'                                    " Better comments with g c c too

" Visual functionalities
Plug 'kyazdani42/nvim-web-devicons'                           " Icons of programing languages nd stuff
Plug 'nvim-lua/popup.nvim'                                    " Create windows
Plug 'kamykn/popup-menu.nvim'                                 " Create window too.
Plug 'mhinz/vim-startify'                                     " Start screen for neovim
Plug 'luochen1990/rainbow'                                    " colorful brackets
Plug 'kevinhwang91/rnvimr'                                    " Open ranger inside neovim
Plug 'yuttie/comfortable-motion.vim'                          " Best scrolling with keyboard
Plug 'voldikss/vim-translator'                                " Translation tool

"Some Third party integration functions
Plug 'tpope/vim-fugitive'                                     " Git super powers
Plug 'airblade/vim-gitgutter'                                 " Some more git functionalities
Plug 'skywind3000/asyncrun.vim'                               " asynchronous commands
Plug 'szw/vim-g'                                              " Easy Google search from Vim
Plug 'wakatime/vim-wakatime'                                  " Time monitoring software

" ThemesOfEther
Plug 'vim-airline/vim-airline'                                " Beautiful bellow bar
Plug 'vim-airline/vim-airline-themes'                         " Themes for the airline bar
Plug 'arcticicestudio/nord-vim'                               " Theme for Nord
Plug 'dracula/vim', { 'as': 'dracula' }                       " Theme for Dracula

" Python :
Plug 'vim-scripts/indentpython.vim', {'for' : 'python'}       " Create better indentation 
Plug 'jeetsukumaran/vim-pythonsense', {'for' : 'python'}      " More text objects for python
Plug 'tmhedberg/SimpylFold', {'for' : 'python'}               " Create better code folding 

" Csharp :
Plug 'OmniSharp/omnisharp-vim', {'for' : 'cs'}                " Omnisharp capabilities

" Latex magic
Plug 'lervag/vimtex', {'for' : 'latex'}                       " IDLE tools for latex

" MarkDown aslkdfj/lsdkfj   
Plug 'godlygeek/tabular', {'for': 'markdown'}                 " Align text 
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}           " Some mark down functionalities
Plug 'iamcco/mathjax-support-for-mkdp', {'for': 'markdown'}   " MarkDown math support
Plug 'aklt/plantuml-syntax', {'for': 'markdown'}              " Syntax for PlantUML
Plug 'tyru/open-browser.vim', {'for': 'markdown'}             " A tool for opening the browser 
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install', 'for': 'markdown'} " Md preview
Plug 'reedes/vim-pencil', {'for': 'markdown'}                 " Better navigation for prose writing
Plug 'junegunn/goyo.vim', {'for': 'markdown'}                 " For minimalistic view

" web_dev alskdfj
Plug 'mattn/emmet-vim'                                        " Create html more ease
Plug 'MaxMEllon/vim-jsx-pretty', {'for': 'javascript'}        " React syntax highlight
Plug 'pangloss/vim-javascript', {'for': 'javascript'}         " React syntax highlight 
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Looks                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme dracula                                  " Color scheme definition

" General background
hi Normal guibg=NONE ctermbg=NONE

" Translate borders
hi TranslatorBorder guibg=NONE ctermbg=NONE guifg=white

" Cursosr customization
" highlight Cursor guifg=white guibg=black
" highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkwait200-blinkon100-blinkoff50

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Mapping and auto command                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open neovim configuration file
nnoremap <leader>r :tabe $MYVIMRC<CR>
nnoremap <leader>R :Runtime!<CR>

" Some shortcuts to vanila commands
" escape
inoremap jj <esc>

" movement 
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Go to mark that doesn't conflict with Tmux
nnoremap 1 `

" Easy quit
map <silent> <leader>q :qa<cr>

" Spawn terminal
nnoremap <leader>t :call OpenTerminal()<CR>

" turn terminal to normal mode with jj
tnoremap jj <C-\><C-n>
tnoremap jq <C-\><C-n>:q<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                    Plugins mappings                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins mappings
vnoremap <leader>s :Google<CR>
nnoremap <leader>s :Google<CR> 
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <silent> <Leader>w :TranslateW --engines=google --target_lang=en<CR>
vnoremap <silent> <Leader>w :TranslateW --engines=google --target_lang=en<CR>
nnoremap <silent> <Leader>W :TranslateW --engines=google --target_lang=pt<CR>
vnoremap <silent> <Leader>W :TranslateW --engines=google --target_lang=pt<CR>

" Move lines selected in visual mode
xnoremap <silent> K :call user_defined#visual_movement#move_up()<CR>
xnoremap <silent> J :call user_defined#visual_movement#move_down()<CR> 

" Fuzzy finder global configuration
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Ranger toggle
nnoremap <silent> <leader>i :RnvimrToggle<CR>


" Coc color picker
nnoremap <silent> <leader>c :call CocAction("pickColor")<CR>

" Coc code actions (correct spell for example) 
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Coc  Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Highlight with cursor over
if exists('*CocActionAsync')
  augroup coc_settings
    autocmd!
    autocmd CursorHold * silent call CocActionAsync('highlight')
  augroup END
endif

" Coc Use <c-space> to trigger completion. 
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Better scrool in floating windows
nnoremap <silent><nowait><expr> <M-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <M-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <M-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <M-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <M-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <M-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                    Plugins configurations                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-pencil ----
let g:pencil#conceallevel = 0 

" vim-translator ----
let g:translator_target_lang = 'english'
let g:translator_window_borderchars = ['-', '|', '-', '|', '+', '+', '+', '+']

" vim-g ----
let g:vim_g_open_command = "xdg-open"
let g:vim_g_python_command = "python3"
let g:vim_g_query_url = "https://duckduckgo.com/?q="

" restore_view ----
set viewoptions=cursor,folds,slash,unix

" auto-pairs ----
" some new ones to html:
au FileType html let b:AutoPairs = AutoPairsDefine({'<\!--' : '-->'})
"this disable auto pairs to stop problems with \":
au BufNewFile,BufRead *.vim let g:AutoPairsMultilineClose = 0

" vim-startify ----
" let g:startify_session_autoload = 0
" let g:startify_session_persistence = 1
let g:startify_relative_path = 1

" Vim-easy-align ----
" Start in visual mode (like... With vipga - visual mode - inner paragraph - g a to align by character)
xmap ga <Plug>(EasyAlign)
" Start interactive Easy Align for a motion/text object (like... g a i p)
nmap ga <Plug>(EasyAlign)

" rainbow ----
" To enable the plugging (this disable rainbow toggle)
let g:rainbow_active = 1


" airline.vim ---- 
set laststatus=2
let g:airline_theme='dracula'
let g:airline#extensions#whitespace#checks =
    \  [ 'indent', 'conflicts' ]
let g:airline_detect_spelllang=0
let g:airline_detect_spell=0
let g:airline_detect_spelllang=0
let g:airline#extensions#keymap#enabled = 0

" Vimtex ----
let g:vimtex_view_method = 'zathura'
let g:tex_flaver = 'latex'
let g:vimtex_quickfix_mode = 0
let g:vimtex_view_forward_search_on_start = 1

"vim-gitgutter ----
let g:gitgutter_enabled=0


" vim-surround ----
let b:surround_{char2nr('i')} = "\"\"\"\r\"\"\"" 

" ultisnips ----
let g:UltiSnipsExpandTrigger='<m-j>'
let g:UltiSnipsJumpForwardTrigger = '<m-j>'
let g:UltiSnipsJumpBackwardTrigger = '<m-k>'
let g:UltiSnipsEditSplit='vertical'

" coc ----
let g:airline#extensions#coc#enabled = 0
let g:coc_global_extensions=[
    \ 'coc-spell-checker',
    \ 'coc-cspell-dicts',
    \ 'coc-omnisharp',
    \ 'coc-highlight',
    \ 'coc-vimtex',
    \ 'coc-tsserver',
    \ 'coc-tslint-plugin',
    \ 'coc-fzf-preview',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-eslint',
    \ 'coc-json',
    \ 'coc-emmet',
    \ 'coc-prettier',
    \ 'coc-pyright',
    \ 'coc-python',
    \]

" nvim-telescope ----
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = ">",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "vertical",
    layout_defaults = {
      -- TODO add builtin options.
    },
    file_sorter =  require('telescope.sorters').get_fzy_sorter,
    file_ignore_patterns = {},
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}
require('telescope').load_extension('fzy_native')
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   User defined functions                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open terminal command
function! OpenTerminal()
  split term://bash
  resize 10
  setlocal scrolloff=0
  setlocal nonumber
endfunction
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" Delete file view
if exists(":Delview")
else
    command Delview call user_defined#delete_view#MyDeleteView()
endif

" to turn everything into tabs ==> :%s/  /\t/g
" to turn everything into tabs ==> set noet ci pi sts=0 sw=2 ts=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                     PYTHON                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup python_files
  autocmd!

  autocmd FileType python setlocal textwidth=79                     " Limit in text length

                          " == simply fold ==
  autocmd FileType python let b:SimpylFold_docstring_preview=1
                          
                          " GoTo code navigation.
  autocmd FileType python nmap <silent> gd <Plug>(coc-definition)
  autocmd FileType python nmap <silent> gy <Plug>(coc-type-definition)
  autocmd FileType python nmap <silent> gi <Plug>(coc-implementation)
  autocmd FileType python nmap <silent> gr <Plug>(coc-references)
  autocmd FileType python highlight NonText guifg=#636363

  " indent in tabs
  autocmd FileType python nnoremap <buffer> <silent> <leader>R :source $MYVIMRC<CR>

  " Execute command
  autocmd FileType python nmap <buffer> <silent> <leader>j :w<CR> :AsyncRun alacritty --working-directory %:p:h --hold -e python %:p &<CR>

augroup END

python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    with open(activate_this) as f:
        code = compile(f.read(), activate_this, 'exec')
        exec(code, dict(__file__=activate_this))
EOF





