" sudo apt install exuberant-ctags
" sudo apt install build-essential cmake python3-dev # for YCM for ubuntu
" sudo apt install ack " for Ack plugin

" if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
"   exec tmux
" fi

" # clone
" git clone https://github.com/powerline/fonts.git --depth=1
" # install
" cd fonts
" ./install.sh
" # clean-up a bit
" cd ..
" rm -rf fonts

" sudo apt-get install texmaker
" sudo apt-get install texlive-full

set nocompatible " Set compatibility to vim only
let mapleader = "," " With a map leader it's possible to do extra key combinations
" set shell=/usr/share/zsh
set clipboard=unnamedplus " Let vim copy or cut text to system register
filetype plugin off " Helps force plug-ins to load correctly when it is turned back on below

call plug#begin('~/.config/nvim/plugged')
    Plug 'https://github.com/xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    Plug 'https://github.com/apalmer1377/factorus'
    Plug 'https://github.com/vim-airline/vim-airline'
    Plug 'https://github.com/vim-airline/vim-airline-themes'
    Plug 'https://github.com/ludovicchabant/vim-gutentags'
    Plug 'https://github.com/christoomey/vim-tmux-navigator'
    Plug 'https://github.com/mhinz/vim-startify'
    Plug 'https://github.com/mileszs/ack.vim'
    Plug 'https://github.com/morhetz/gruvbox'
    Plug 'https://github.com/scrooloose/nerdtree'
    Plug 'https://github.com/kien/ctrlp.vim'
    Plug 'https://github.com/terryma/vim-multiple-cursors'
    Plug 'https://github.com/majutsushi/tagbar'
    Plug 'https://github.com/kien/rainbow_parentheses.vim'
    Plug 'https://github.com/tpope/vim-surround'
    Plug 'https://github.com/jiangmiao/auto-pairs'
    Plug 'https://github.com/scrooloose/nerdcommenter'
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/junegunn/goyo.vim'
    Plug 'https://github.com/Yggdroot/indentLine'
    Plug 'https://github.com/w0rp/ale'
    Plug 'https://github.com/mbbill/undotree'
    " Plug 'https://github.com/justinmk/vim-sneak'
    Plug 'https://github.com/easymotion/vim-easymotion'
    Plug 'https://github.com/google/vim-searchindex'
    Plug 'https://github.com/mhinz/vim-signify'
    " Plug 'https://github.com/severin-lemaignan/vim-minimap'
    " Plug 'https://github.com/haya14busa/vim-gtrans'
    Plug 'https://github.com/SirVer/ultisnips'
    Plug 'https://github.com/honza/vim-snippets'
    " Plug 'https://github.com/airblade/vim-gitgutter'
    Plug 'https://github.com/vim-scripts/SearchComplete'
    " Plug 'https://github.com/Shougo/deoplete.nvim'
    " Plug 'https://github.com/neoclide/coc.nvim'
    " Plug 'https://github.com/hdima/python-syntax'
    Plug 'https://github.com/vim-python/python-syntax'
    Plug 'https://github.com/terryma/vim-expand-region'
    Plug 'https://github.com/tpope/vim-repeat'
    Plug 'https://github.com/szw/vim-g'
    Plug 'https://github.com/chrisbra/NrrwRgn'
    " pip3 install pynvim --upgrade | :UpdateRemotePlugins
    Plug 'https://github.com/numirias/semshi', { 'do': ':UpdateRemotePlugins' }
    Plug 'https://github.com/echuraev/translate-shell.vim', { 'do': 'wget -O ~/.vim/trans git.io/trans && chmod +x ~/.vim/trans' }
    function! BuildYCM(info)
        " info is a dictionary with 3 fields
        " - name:   name of the plugin
        " - status: 'installed', 'updated', or 'unchanged'
        " - force:  set on PlugInstall! or PlugUpdate!
        if a:info.status == 'installed' || a:info.force
            !./install.py
        endif
    endfunction
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
call plug#end()

" Enable filetype plugins
" filetype indent on
filetype indent off
filetype plugin on

map <leader>s :source ~/.vimrc<CR>
map <leader>. :@:<CR> " repeat even commands that have a count!
map <leader>r :%s// " search and replace faster also empty string is \=''

syntax enable " Enable syntax highlighting
set t_Co=256
set background=dark
let g:gruvbox_termcolors=256
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

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
set cmdheight=1 " Height of the command bar
set lazyredraw " Don't redraw while executing macros (good performance config)
set magic " For regex turn magic on
set ruler " Always show the current position
set foldcolumn=1 " Add a bit extra margin to the left
set ffs=unix,dos,mac " Use Unix as the standard file type
set undolevels=1000 "1000 undos
set updatecount=100 "switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" 1 tab == 4 spaces
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

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

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

set textwidth=79
set nowrap
set scrolloff=5 " Keep at least 5 lines above/below
set sidescrolloff=3 " Keep at least 3 lines left/right
set backspace=indent,eol,start " Fixes common backspace problems
set whichwrap+=<,>,h,l

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

set ttyfast " Speed up scrolling in vim
" Display different types of white spaces
set list listchars=tab:›\ ,trail:•,extends:#,nbsp:.
autocmd BufWritePre * :%s/\s\+$//e " Remove whitespaces on save


set laststatus=2 " Status bar
set statusline=%F%m%r%h%w\ [format=%{&ff}]\ [type=%Y]\ [line=%l\ column=%c]\ [buffer=%n]\ %{strftime('%c')} " Set status line display
" set guicursor=a:blinkon100 " Disable neo-vim cursor shape and make it blink
set guicursor=

" gui guibg guifg
" cterm ctermbg ctermfg
set cul
set colorcolumn=+1

highlight ColorColumn guibg=DarkRed
highlight NonText gui=bold guibg=none guifg=DarkRed
highlight LineNr gui=bold,italic guibg=Grey23
highlight ColumnNr gui=bold,italic guibg=Grey23
highlight StatusLine gui=bold,italic guibg=Grey23 guifg=Red
highlight CursorLine gui=bold,italic guibg=Grey19
highlight CursorColumn gui=bold,italic guibg=Grey19
highlight Search guibg=Black guifg=DarkOrange
autocmd InsertEnter * highlight CursorLine guibg=Grey19
autocmd InsertLeave * highlight CursorLine guibg=DarkRed
autocmd InsertEnter * highlight CursorColumn guibg=Grey19
autocmd InsertLeave * highlight CursorColumn guibg=DarkRed

" highlight ColorColumn ctermbg=DarkRed
" highlight NonText cterm=bold ctermbg=none ctermfg=DarkRed
" highlight LineNr cterm=bold,italic ctermbg=237
" highlight ColumnNr cterm=bold,italic ctermbg=237
" highlight StatusLine cterm=bold,italic ctermbg=237 ctermfg=Red
" highlight CursorLine cterm=bold,italic ctermbg=236
" highlight CursorColumn cterm=bold,italic ctermbg=236
" highlight Search ctermbg=Black ctermfg=208
" autocmd InsertEnter * highlight CursorLine ctermbg=236
" autocmd InsertLeave * highlight CursorLine ctermbg=DarkRed
" autocmd InsertEnter * highlight CursorColumn ctermbg=236
" autocmd InsertLeave * highlight CursorColumn ctermbg=DarkRed

set encoding=utf-8 " Encoding

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100
set history=1000 " Sets how many lines of history vim has to remember
set hidden " A buffer becomes hidden when it is abandoned

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END
"
" augroup remember_folds
"   autocmd!
"   au BufWinLeave ?* mkview 1
"   au BufWinEnter ?* silent! loadview 1
" augroup END

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

nnoremap <leader><space> :noh<cr> " clear search highlights

""""""""""""""""""""""""""""""""""""
"             Plugins              "
""""""""""""""""""""""""""""""""""""

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

"""""""""""""""""""""
" => Ctrlp          "
"""""""""""""""""""""
set runtimepath^=~/.config/nvim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

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
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

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
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"""""""""""""""""""
" => Indent Helper"
"""""""""""""""""""
let g:indentLine_setColors = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"""""""""""""""""""
" => Ack.vim      "
"""""""""""""""""""
let g:ackprg="ack -H --nocolor --nogroup --column"
" Open a new tab and search for something
nmap <leader>a :tab split<CR>:Ack ""<Left>
" Immediately search for the work under the cursor in a new tab
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>

let g:projectA_path="/home/rg/.virtualenvs/scraping_env"

function! SS(toSearch)
    execute "Ack! ".a:toSearch." ".g:projectA_path
endfunction

"""""""""""""""""""
" => Airline      "
"""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='kalisi' " random, gruvbox solarized, badwolf, kalisi
let g:airline#extensions#tabline#enabled = 1

" function! AccentDemo()
"   let keys = ['n', 'e', 'o', 'v', 'i', 'm']
"   for k in keys
"     call airline#parts#define_text(k, k)
"   endfor
"   call airline#parts#define_accent('n', 'red')
"   call airline#parts#define_accent('e', 'red')
"   call airline#parts#define_accent('o', 'red')
"   call airline#parts#define_accent('v', 'red')
"   call airline#parts#define_accent('i', 'red')
"   call airline#parts#define_accent('m', 'red')
"   let g:airline_section_a = airline#section#create(keys)
" endfunction
" autocmd VimEnter * call AccentDemo()

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

"""""""""""""""""
" => YCM        "
"""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_auto_trigger = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

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

map <F10> :!ctags -R -f ./tags /home/rg/.virtualenvs/scraping_env<CR>
map <F12> :!ctags -R .<CR>
" set tags=./tags,tags;

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

""""""""""""""""""""""
" => Python section  "
""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#

""""""""""""""""""""""""""
" => Javascript section  "
""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

"""""""""""""""""""""
" => Shell section  "
"""""""""""""""""""""
if exists('$TMUX')
    if has('nvim')
        set termguicolors
    else
        set term=xterm-256color
    endif
endif


""""""""""""""""""""""""""""""""""""
"         HELPER FUNCTIONS         "
""""""""""""""""""""""""""""""""""""
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

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
