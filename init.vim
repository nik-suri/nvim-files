scriptencoding utf-8
source ~/.config/nvim/plugins.vim

" GENERAL EDITING

"Mode Settings

" set vim cursor
set guicursor=a:ver10-blinkon1
au VimLeave * set guicursor=a:hor10-blinkon0

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

" do not wrap long lines by default
set nowrap

" Automatically re-read file if a change was detected outside of vim
set autoread

" Only one line for command line
set cmdheight=1

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" PLUGINS

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

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" nerdtree
let NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

" airline
let g:airline_extensions = ['branch', 'hunks', 'coc']
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts=1
let g:airline_theme = "palenight"
" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])
" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1
" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
" Don't show git changes to current file in airline
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#tabline#enabled = 1

" signify
let g:signify_sign_delete = '-'

" UI SETTINGS

" Enable true color support
set termguicolors

" Don't dispay mode in command line (airline already shows it)
set noshowmode

" Set floating window to be slightly transparent
set winbl=10

set background=dark
colorscheme palenight

" MAPPINGS

nmap <C-n> :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>sw :StripWhitespace<CR>

" === Search shorcuts === "
"   <leader>/ - Clear highlighted search terms while preserving history
nmap <silent> <leader>/ :nohlsearch<CR>
