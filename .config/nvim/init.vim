" Set compatibility to vim only, this must be first
set nocompatible

""""""""""""""""""""
" => Vim-Plug      "
""""""""""""""""""""

" Helps force plug-ins to load correctly when it is turned back on below
filetype plugin off

call plug#begin('~/.config/nvim/plugged')
    Plug 'https://github.com/vim-scripts/dbext.vim'
    Plug 'https://github.com/vim-scripts/DrawIt'
    Plug 'https://github.com/voldikss/vim-floaterm'
    Plug 'https://github.com/liuchengxu/vim-clap'
    Plug 'https://github.com/MattesGroeger/vim-bookmarks'
    Plug 'https://github.com/yuki-ycino/fzf-preview.vim'
    Plug 'https://github.com/junegunn/limelight.vim'
    Plug 'https://github.com/junegunn/vim-easy-align'
    Plug 'https://github.com/jeetsukumaran/vim-buffergator'
    Plug 'https://github.com/dyng/ctrlsf.vim'
    Plug 'https://github.com/wesQ3/vim-windowswap'
    Plug 'https://github.com/dhruvasagar/vim-zoom'
    " Plug 'https://github.com/hienvd/vim-stackoverflow'
    Plug 'https://github.com/mickaobrien/vim-stackoverflow'
    Plug 'https://github.com/vim-vdebug/vdebug'
    Plug 'https://github.com/yuttie/comfortable-motion.vim'
    Plug 'https://github.com/vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
    Plug 'https://github.com/sheerun/vim-polyglot'
    Plug 'https://github.com/mhinz/vim-startify'
    Plug 'https://github.com/morhetz/gruvbox'
    Plug 'https://github.com/dracula/vim', { 'as': 'dracula' }
    Plug 'https://github.com/chriskempson/base16-vim'
    Plug 'https://github.com/joshdick/onedark.vim'
    Plug 'https://github.com/vim-airline/vim-airline'
    Plug 'https://github.com/vim-airline/vim-airline-themes'
    Plug 'https://github.com/ryanoasis/vim-devicons'
    Plug 'https://github.com/scrooloose/nerdtree'
    Plug 'https://github.com/majutsushi/tagbar'
    Plug 'https://github.com/ludovicchabant/vim-gutentags'
    Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'https://github.com/junegunn/fzf.vim'
    Plug 'https://github.com/tpope/vim-surround'
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/w0rp/ale'
    Plug 'https://github.com/neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'https://github.com/junegunn/goyo.vim'
    Plug 'https://github.com/SirVer/ultisnips'
    Plug 'https://github.com/honza/vim-snippets'
    Plug 'https://github.com/airblade/vim-rooter'
    Plug 'https://github.com/junegunn/vim-easy-align'
    " Plug 'https://github.com/xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    Plug 'https://github.com/lervag/vimtex'
    Plug 'https://github.com/apalmer1377/factorus'
    Plug 'https://github.com/christoomey/vim-tmux-navigator'
    Plug 'https://github.com/terryma/vim-multiple-cursors'
    Plug 'https://github.com/luochen1990/rainbow'
    Plug 'https://github.com/jiangmiao/auto-pairs'
    Plug 'https://github.com/scrooloose/nerdcommenter'
    Plug 'https://github.com/Yggdroot/indentLine'
    Plug 'https://github.com/mbbill/undotree'
    Plug 'https://github.com/easymotion/vim-easymotion'
    Plug 'https://github.com/google/vim-searchindex'
    Plug 'https://github.com/mhinz/vim-signify'
    Plug 'https://github.com/rhysd/git-messenger.vim'
    Plug 'https://github.com/vim-scripts/SearchComplete'
    Plug 'https://github.com/severin-lemaignan/vim-minimap'
    Plug 'https://github.com/vim-python/python-syntax'
    Plug 'https://github.com/terryma/vim-expand-region'
    Plug 'https://github.com/tpope/vim-repeat'
    Plug 'https://github.com/szw/vim-g'
    Plug 'https://github.com/chrisbra/NrrwRgn'
    Plug 'https://github.com/simeji/winresizer'
    " pip3 install pynvim --upgrade | :UpdateRemotePlugins
    Plug 'https://github.com/numirias/semshi', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'https://github.com/echuraev/translate-shell.vim', { 'do': 'wget -O ~/.vim/trans git.io/trans && chmod +x ~/.vim/trans' }
call plug#end()

" Enable filetype plugins
filetype plugin on
filetype indent on

""""""""""""""""""""
" => General config"
""""""""""""""""""""

" Syntax highlight
syntax enable " Enable syntax highlighting
set t_Co=256
set background=dark
let g:gruvbox_termcolors=256
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_contrast_dark='hard'
" let g:colorminder_scheme_default_gui='gruvbox'
" let g:colorminder_scheme_default_term='gruvbox'

colorscheme gruvbox

" let g:molokai_original = 1 " If you prefer the scheme to match the original monokai
" let g:rehash256 = 1 " For color terminals which attempts to bring the 256 color version

let mapleader = "," " With a map leader it's possible to do extra key combinations
" set shell=/usr/share/zsh
set clipboard=unnamedplus " Let vim copy or cut text to system register
map <leader>s :source ~/.vimrc<CR>
" repeat even commands that have a count!
map <leader>. :@:<CR>
" search and replace faster also empty string is \=''
map <leader>r :%s//
map <leader>t :UndotreeToggle<CR>

" set exrc " enable usage of additional .vimrc files from working directory
" set secure " prohibit .vimrc files to execute shell, create files, etc...
" don't lose selection while tabbing a block of code
xnoremap <  <gv
xnoremap >  >gv
set nrformats= " Treat any number as decimal
set path+=** " Search into subfolders
set autoread " Set to auto read when a file is changed from the outside
" set showmode " Only without vim airline
set noshowmode " I have airline for this
set showcmd " Show (partial) command in status line
set showmatch " Show matching brackets
set mat=2 " How many tenths of a second to blink when matching brackets
set ignorecase " Do case insensitive matching
set smartcase " Do smart case matching
set incsearch " Incremental search
set hlsearch " Highlight matching search patterns
set mouse=a " Enable mouse
set wildmenu " Enable the wild menu
set wildmode=longest:full
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set cmdheight=1 " Height of the command bar
set lazyredraw " Don't redraw while executing macros (good performance config)
set magic " For regex turn magic on
set ruler " Always show the current position
set foldcolumn=1 " Add a bit extra margin to the left
set ffs=unix,dos,mac " Use Unix as the standard file type
set undolevels=1000 "1000 undos
set updatecount=100 "switch every 100 chars
set updatetime=300
set shortmess+=c
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
" Turn backup off, since most stuff is in SVN, git etc anyway...
set nobackup
set nowritebackup
set noswapfile

" 1 tab == 4 spaces
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab " Use spaces instead of tabs
"For make file -> do NOT replace tabs with space
autocmd FileType make setlocal noexpandtab
set smarttab " Be smart when using tabs ;)
set smartindent
set autoindent

set relativenumber
set number " Show line numberis
set cursorline
set cursorcolumn

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <C-down> <C-W>j
map <C-up> <C-W>k
map <C-left> <C-W>h
map <C-right> <C-W>l

" Get rid of capslock and map it to escape
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <Tab> :bnext<cr>
map <S-Tab> :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t<leader> :tabnext<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Specify the behavior when switching between buffers
set switchbuf=useopen,usetab,newtab
set stal=2

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>

set textwidth=80
set nowrap
set scrolloff=5 " Keep at least 5 lines above/below
set sidescrolloff=3 " Keep at least 3 lines left/right
set sidescroll=1
set backspace=indent,eol,start " Fixes common backspace problems, allow backspace in insert mode

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

set ttyfast " Speed up scrolling in vim
set re=1
set foldmethod=manual
" Display different types of white spaces
set list listchars=tab:›\ ,trail:•,extends:#,nbsp:.
" autocmd BufWritePre * :%s/\s\+$//e " Remove whitespaces on save


set laststatus=2 " Status bar
set statusline=%F%m%r%h%w\ [format=%{&ff}]\ [type=%Y]\ [line=%l\ column=%c]\ [buffer=%n]\ %{strftime('%c')} " Set status line display
" set guicursor=a:blinkon100 " Disable neo-vim cursor shape and make it blink
set guicursor=

set cul
set colorcolumn=+1

set termguicolors
" if exists('$TMUX')
"     if has('nvim')
"         set termguicolors
"     else
"         set term=xterm-256color
"     endif
" endif

" gui guibg guifg
" cterm ctermbg ctermfg
if has('nvim')
    highlight ColorColumn guibg=DarkRed
    highlight NonText gui=bold guibg=none guifg=DarkRed
    highlight LineNr gui=bold,italic guibg=Grey23
    highlight ColumnNr gui=bold,italic guibg=Grey23
    highlight StatusLine gui=bold,italic guibg=Grey23 guifg=Red
    highlight CursorLine gui=bold,italic guibg=DarkRed
    highlight CursorColumn gui=bold,italic guibg=DarkRed
    highlight Search guibg=Black guifg=DarkOrange
    augroup ChangeRulersNVim
        autocmd!
        autocmd InsertEnter * highlight CursorLine guibg=Grey19
        autocmd InsertLeave * highlight CursorLine guibg=DarkRed
        autocmd InsertEnter * highlight CursorColumn guibg=Grey19
        autocmd InsertLeave * highlight CursorColumn guibg=DarkRed
    augroup END
elseif !has('nvim')
    highlight ColorColumn ctermbg=88
    highlight NonText cterm=bold ctermbg=NONE ctermfg=88
    highlight LineNr cterm=bold,italic ctermbg=237
    highlight ColumnNr cterm=bold,italic ctermbg=237
    highlight StatusLine cterm=bold,italic ctermbg=237 ctermfg=196
    " highlight CursorLine cterm=bold,italic ctermbg=88
    highlight CursorLine cterm=bold,italic guibg=DarkRed
    " highlight CursorColumn cterm=bold,italic ctermbg=88
    highlight CursorColumn cterm=bold,italic guibg=DarkRed
    highlight Search ctermbg=0 ctermfg=208
    augroup ChangeRulersVim
        autocmd!
        " autocmd InsertEnter * highlight CursorLine ctermbg=236
        " autocmd InsertLeave * highlight CursorLine ctermbg=88
        " autocmd InsertEnter * highlight CursorColumn ctermbg=236
        " autocmd InsertLeave * highlight CursorColumn ctermbg=88
        autocmd InsertEnter * highlight CursorLine guibg=Grey19
        autocmd InsertLeave * highlight CursorLine guibg=DarkRed
        autocmd InsertEnter * highlight CursorColumn guibg=Grey19
        autocmd InsertLeave * highlight CursorColumn guibg=DarkRed
    augroup END
endif

set encoding=utf-8 " Encoding

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100
set history=1000 " Sets how many lines of history vim has to remember
set hidden " A buffer becomes hidden when it is abandoned

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

let python_highlight_all = 1

""""""""""""""""""""""""""""""""""""
"             Plugins              "
""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""
" => Coc.nvim        "
"""""""""""""""""""""

" https://github.com/coc-extensions/coc-omnisharp
" https://github.com/iamcco/coc-vimlsp
" https://github.com/neoclide/coc-highlight
" https://github.com/neoclide/coc-html
" https://github.com/neoclide/coc-python
" https://github.com/fannheyward/coc-texlab
" https://github.com/neoclide/coc-java
" https://github.com/neoclide/coc-snippets
" https://github.com/neoclide/coc-rls
" https://github.com/neoclide/coc-json
" https://github.com/neoclide/coc-tsserver
" https://github.com/neoclide/coc-tslint-plugin
" https://github.com/neoclide/coc-css
" https://github.com/neoclide/coc-yaml
" https://github.com/neoclide/coc-emmet
" https://github.com/neoclide/coc-tabnine
" https://github.com/neoclide/coc-sources
" --------------------------------------
" https://github.com/fannheyward/coc-marketplace
" https://github.com/josa42/coc-lua
" https://github.com/neoclide/coc-vimtex
let g:coc_global_extensions = [
    \ 'coc-omnisharp',
    \ 'coc-vimlsp',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-python',
    \ 'coc-texlab',
    \ 'coc-java',
    \ 'coc-snippets',
    \ 'coc-rls',
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-tslint-plugin',
    \ 'coc-css',
    \ 'coc-yaml',
    \ 'coc-emmet',
    \ 'coc-tabnine',
    \ 'coc-gocode',
    \ 'coc-word',
    \ 'coc-marketplace',
    \ 'coc-lua',
    \ 'coc-vimtex',
    \ ]

"""""""""""""""""""""
" => NrrwRgn        "
"""""""""""""""""""""
map <leader>nrr :NR!<CR>

""""""""""""""""""""""
" => NerdTree        "
""""""""""""""""""""""
" autocmd vimenter * NERDTree
" Close vim if nerdtree is the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=20
" let g:NERDTreeWinPos = "right"
map <leader>nn :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = '😎 ▸'
let g:NERDTreeDirArrowCollapsible = '🤣 ▾'

""""""""""""""""""""
" => Multiple curs "
""""""""""""""""""""
" to enter insert mode press shift + i
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key = 'g<C-s>'
let g:multi_cursor_select_all_key = 'g<A-s>'
let g:multi_cursor_next_key = '<C-s>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'

"""""""""""""""""""
" => Tagbar       "
"""""""""""""""""""
" sudo apt-get install exuberant-ctags
nmap <leader>tt :TagbarOpenAutoClose<CR>
let g:tagbar_width=20
let g:tagbar_indent=1

""""""""""""""""""
" => Rainbow     "
""""""""""""""""""
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'guis': [''],
\   'cterms': [''],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'markdown': {
\           'parentheses_options': 'containedin=markdownCode contained',
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'haskell': {
\           'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\       },
\       'vim': {
\           'parentheses_options': 'containedin=vimFuncBody',
\       },
\       'perl': {
\           'syn_name_prefix': 'perlBlockFoldRainbow',
\       },
\       'stylus': {
\           'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\       },
\       'css': 0,
\   },
\}

""""""""""""""""""""""
" => Surround        "
""""""""""""""""""""""
" Press ysw" to get from abc to "abc"
" Check docs

"""""""""""""""""""""
" => Autopair       "
"""""""""""""""""""""
let g:AutoPairsShortcutToggle = '<F3>'

""""""""""""""""""""
" => NerdCommenter "
""""""""""""""""""""
" [count]<leader>c<space> |NERDComToggleComment|
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

"""""""""""""""""""
" => Goyo/Zen mode"
"""""""""""""""""""
map <leader>z :Goyo <CR>
let g:goyo_width=100
let g:goyo_height='88%'
let g:goyo_linenr=1

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  map <leader>z :Goyo! <CR>
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  map <leader>z :Goyo <CR>
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"""""""""""""""""""
" => Indent Helper"
"""""""""""""""""""
let g:indentLine_setColors = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"""""""""""""""""""
" => Airline      "
"""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='kalisi' " random, gruvbox solarized, badwolf, kalisi
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""
" => Ale.vim     "
""""""""""""""""""
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5
" Don't run linters on file enter
let g:ale_lint_on_enter = 0

""""""""""""""""
" => transShell"
""""""""""""""""
let g:trans_bin = "~/.vim"

""""""""""""""""
" => Ctags     "
""""""""""""""""
" Ctrl+] - go to definition
" Ctrl+T - Jump back from the definition.
" Ctrl+W Ctrl+] - Open the definition in a horizontal split

map <F10> :!ctags -R -f ./tags /home/rg<CR>
map <F12> :!ctags -R .<CR>
set tags+=./tags;

" Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"""""""""""""""
" => UltiSnips"
"""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<F4>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"


"""""""""""""""
" => Vim Latex"
"""""""""""""""
let g:tex_flavor='latex'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

""""""""""""""""""""""""""""""""""""
"         HELPER FUNCTIONS         "
""""""""""""""""""""""""""""""""""""

function! CompileAndRun()
  write
  if &filetype == 'c'
    !gcc % && ./a.out && rm a.out
  elseif &filetype == 'cpp'
    !g++ -O2 -std=c++11 -Dhome -Wall % && ./a.out && rm a.out
  elseif &filetype == 'lisp'
    !clisp %
  elseif &filetype == 'python'
   !python %
  elseif &filetype == 'javascript'
    !node %
  elseif &filetype == 'java'
    !javac % && java %:r
  elseif &filetype == 'php'
    !php %
  elseif &filetype == 'perl'
    !perl %
  elseif &filetype == 'sh'
    !bash %
  elseif &filetype == 'haskell'
    !ghc -o a.out % && ./a.out && rm a.out
  endif
endfunction
nnoremap <leader>c <ESC>:w!<CR>:call CompileAndRun()<CR>

function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize ' . line('$')
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
  if getchar()
    silent! execute ':q!'
  endif
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

if v:version < 700 || exists('loaded_switchcolor') || &cp
    finish
endif

let loaded_switchcolor = 1

let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
let s:swcolors = map(paths, 'fnamemodify(v:val, ":t:r")')
let s:swskip = [ '256-jungle', '3dglasses', 'calmar256-light', 'coots-beauty-256', 'grb256' ]
let s:swback = 0    " background variants light/dark was not yet switched
let s:swindex = 0

function! SwitchColor(swinc)

    " if have switched background: dark/light
    if (s:swback == 1)
        let s:swback = 0
        let s:swindex += a:swinc
        let i = s:swindex % len(s:swcolors)

        " in skip list
        if (index(s:swskip, s:swcolors[i]) == -1)
            execute "colorscheme " . s:swcolors[i]
        else
            return SwitchColor(a:swinc)
        endif

    else
        let s:swback = 1
        if (&background == "light")
            execute "set background=dark"
        else
            execute "set background=light"
        endif

        " roll back if background is not supported
        if (!exists('g:colors_name'))
            return SwitchColor(a:swinc)
        endif
    endif

    " show current name on screen. :h :echo-redraw
    redraw
    execute "colorscheme"
endfunction

 map <F8>        :call SwitchColor(1)<CR>
imap <F8>   <Esc>:call SwitchColor(1)<CR>
 map <F7>      :call SwitchColor(-1)<CR>
imap <F7> <Esc>:call SwitchColor(-1)<CR>

set modifiable
