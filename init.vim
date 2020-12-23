scriptencoding utf-8
source ~/.config/nvim/plugins.vim

let term_program=$TERM_PROGRAM

" ==================== "
" === GLOBAL HOSTS === "
" ==================== "

if term_program == 'iTerm.app'
  " we are using my mac
  let g:python3_host_prog = '/Users/Nikhil/.pyenv/versions/nvim3/bin/python'
endif

" ======================= "
" === GENERAL EDITING === "
" ======================= "

" set vim cursor
if term_program == 'iTerm.app'
  set guicursor=a:block-blinkon0
else
  set guicursor=a:ver10-blinkon0
  au VimLeave * set guicursor=a:hor10-blinkon0
endif

" Remap leader key to ,
let g:mapleader=','

" Yank and paste with the system clipboard
set clipboard=unnamed

" Hides buffers instead of closing them
set hidden

" Security
set modelines=0

" Line numbers
set number relativenumber

" Search
set ignorecase
set smartcase

" Tab formatting
set softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascript set softtabstop=2 shiftwidth=2
autocmd Filetype python set softtabstop=4 shiftwidth=4
autocmd Filetype java set softtabstop=4 shiftwidth=4

" do not wrap long lines by default
set nowrap

" Automatically re-read file if a change was detected outside of vim
set autoread

" Only one line for command line
set cmdheight=1

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" ======================= "
" === PLUGIN SETTINGS === "
" ======================= "

" === Coc.nvim === "

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" === Prettier ===

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" === CtrlP ===

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git'

" === NERDTree ===

let NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
" open automatically when vim starts up if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim automatically is only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" === Airline ===

let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts=1
let g:airline_theme = "palenight"
" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1
" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]

" === signify ===

let g:signify_sign_delete = '-'

" =================== "
" === UI SETTINGS === "
" =================== "

" Enable true color support
set termguicolors

" Don't dispay mode in command line (airline already shows it)
set noshowmode

" Set floating window to be slightly transparent
set winbl=10

set background=dark
colorscheme palenight

" ================ "
" === MAPPINGS === "
" ================ "

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>sw :StripWhitespace<CR>

" Clear highlighted search terms while preserving history
nmap <silent> <leader>/ :nohlsearch<CR>

" Map <Esc> to exit terminal-mode
tnoremap <Esc> <C-\><C-n>
