syntax on
let mapleader = " " 
set noerrorbells "This removes vim's default error bell, turning it off so that it doesn't annoy us
set textwidth=80 "Ensures that each line is not longer than 80 columns
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number relativenumber
set showmatch
set showbreak=+++
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set spell 
set showmatch 
set confirm 
set ruler 
set autochdir 
set autowriteall 
set undolevels=1000
set backspace=indent,eol,start
set termguicolors
set mouse=a
set cursorline
set cursorlineopt=number
set scrolloff=7
set linebreak
set encoding=UTF-8
set term=kitty
set hlsearch

" The next two settings ensure that line breaks and wrap work how writers, not
" coders, prefer it

set wrap
nnoremap <F5> :set linebreak<CR>
nnoremap <C-F5> :set nolinebreak<CR>


call plug#begin('~/.vim/plugged')

"   This is for color themes

Plug 'colepeters/spacemacs-theme.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'dylanaraps/wal.vim'

"   This is a selection of plugins to make prose writing easier.

Plug 'dpelle/vim-LanguageTool'
Plug 'ron89/thesaurus_query.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'
Plug 'mikewest/vimroom'

" This section are nice-to-haves for easier integration with machine, using
" vim-airline and such.

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'

"This section deals with workspace and session management

Plug 'thaerkh/vim-workspace'

"Related to above, the following code saves all session files in a single
"directory outside your workspace

let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autocreate = 1
nnoremap <leader>s :ToggleWorkspace<CR>
let g:workspace_autosave_always = 1

" A disturbance in the force: we are using some Emacs functionality here,
" org-mode specifically

Plug 'jceb/vim-orgmode'


"  This is for language-specific plugins

Plug 'plasticboy/vim-markdown'

call plug#end()

" color theme

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
" colorscheme tokyonight
set background=dark
" colorscheme wal
colorscheme gruvbox

" goyo and limelight setting


 if executable('rg')
     let g:rg_derive_root='true'
     let g:goyo_width = 80
 endif
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

nnoremap <Leader>g :Goyo<CR>
nnoremap <C-s> :w<CR>
nnoremap <CR> :nohlsearch<CR><CR>


" airline configuration

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

nnoremap <S-Tab> :bp <CR>
nnoremap <Tab> :bn <CR>
nnoremap <Leader>x :bd<CR>

nnoremap <Leader>e :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:webdevicons_enable_nerdtree = 1

" FZF configuration

" Initialize configuration dictionary
let g:fzf_vim = {}

" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']

" Preview window is hidden by default. You can toggle it with ctrl-/.
" It will show on the right with 50% width, but if the width is smaller
" than 70 columns, it will show above the candidate list
let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_vim.preview_window = []

" fzf.vim needs bash to display the preview window.
" On Windows, fzf.vim will first see if bash is in $PATH, then if
" Git bash (C:\Program Files\Git\bin\bash.exe) is available.
" If you want it to use a different bash, set this variable.
"   let g:fzf_vim = {}
"   let g:fzf_vim.preview_bash = 'C:\Git\bin\bash.exe'

" [Buffers] Jump to the existing window if possible
let g:fzf_vim.buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_vim.commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_vim.tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_vim.commands_expect = 'alt-enter,ctrl-x'

" Default: Use quickfix list
let g:fzf_vim.listproc = { list -> fzf#vim#listproc#quickfix(list) }

" Use location list instead of quickfix list
let g:fzf_vim.listproc = { list -> fzf#vim#listproc#location(list) }

" Command-wise customization
let g:fzf_vim.listproc_ag = { list -> fzf#vim#listproc#quickfix(list) }
let g:fzf_vim.listproc_rg = { list -> fzf#vim#listproc#location(list) }

" A customized version of fzf#vim#listproc#quickfix.
" The last two lines are commented out not to move to the first entry.
function! g:fzf_vim.listproc(list)
  call setqflist(a:list)
  copen
  wincmd p
  " cfirst
  " normal! zvzz
endfunction

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))
