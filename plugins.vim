call plug#begin('~/.config/nvim/plugged')

" whitespace highlighting
Plug 'ntpeters/vim-better-whitespace'

" navigation
Plug 'easymotion/vim-easymotion'

" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" js syntax highlighting
Plug 'pangloss/vim-javascript'

" jsx syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'

" file explorer
Plug 'preservim/nerdtree'

" commenting easily
Plug 'preservim/nerdcommenter'

" status bar and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorscheme
Plug 'drewtempelmeyer/palenight.vim'

" git wrapper
Plug 'tpope/vim-fugitive'

" show git diff signs in sign column
Plug 'mhinz/vim-signify'

" glyphs and syntax highlighting for nerdtree
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" buffer management
Plug 'jeetsukumaran/vim-buffergator'

" closes brackets automatically
" supports (, {, and [
Plug 'rstacruz/vim-closer'

" shell command helpers
Plug 'tpope/vim-eunuch'

" show indentation lines
Plug 'yggdroot/indentLine'

" python syntax highlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" python pep8 indentation style
Plug 'Vimjas/vim-python-pep8-indent'

" ftl syntax highlighting
Plug 'andreshazard/vim-freemarker'

" go support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Initialize plugin system
call plug#end()
