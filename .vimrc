" ============================================================================
" VIM CONFIGURATION FILE
"
" This file contains all the Vim configuration settings that I use. These
" settings include setting themes, remapping leader keys, callbacks and many
" other settings.
"
" The code in this configuration file is released in the public domain.
"
" Author:  Michaël van Diemen
" License: Public Domain

" ============================================================================
" VUNDLE INSTALLATION AND FOLDER SETUP
"

filetype off

call plug#begin('~/.local/share/nvim/plugged')

" =======
" PLUGINS
"

Plug 'mileszs/ack.vim'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/tcomment'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'enricobacis/vim-airline-clock'
Plug 'junegunn/goyo.vim'

" =============
" COLOR SCHEMES
"
"
Plug 'rakr/vim-two-firewatch'
Plug 'joshdick/onedark.vim'
Plug 'haishanh/night-owl.vim'
Plug 'morhetz/gruvbox'
Plug 'ntk148v/vim-horizon'

" =========
" LANGUAGES
"

Plug 'sheerun/vim-polyglot'
Plug 'dag/vim-fish'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

" ============
" ELIXIR STUFF
"
Plug 'neomake/neomake'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-projectionist'
Plug 'c-brenn/phoenix.vim'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'Shougo/deoplete.nvim'

call plug#end()

filetype plugin indent on
syntax on

" ============================================================================
" GENERAL SETTINGS
"

set termguicolors
set shell=sh
set nolazyredraw
set showcmd
set hid
set clipboard+=unnamedplus
set mouse=a
set history=100
set nocursorcolumn
set nocursorline
set shortmess+=A    " Hackityhacky no swapfile warnings
set guioptions=aemc " Do not show GUI Messages & Remove scroll bars
set signcolumn=yes  " Git Gutter settings


set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set tw=120
set wrap linebreak


" ===========================================================================
" SYNTAX SETTINGS
"
" Settings related to configuring the syntax features of Vim such as the text
" width, what theme to use and so on.
"
set textwidth=120
" set nowrap
set number
set synmaxcol=400
set colorcolumn=80
set colorcolumn+=120
set smartindent
set autoindent
set background=dark
color gruvbox

" ============================================================================
" NEOMAKE
"

" Run Neomake when I save any buffer
augroup localneomake
  autocmd! BufWritePost * Neomake
augroup END
" Don't tell me to use smartquotes in markdown ok?
let g:neomake_markdown_enabled_makers = []

" Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
let g:neomake_elixir_enabled_makers = ['mix', 'mycredo']
function! NeomakeCredoErrorType(entry)
  if a:entry.type ==# 'F'      " Refactoring opportunities
    let l:type = 'W'
  elseif a:entry.type ==# 'D'  " Software design suggestions
    let l:type = 'I'
  elseif a:entry.type ==# 'W'  " Warnings
    let l:type = 'W'
  elseif a:entry.type ==# 'R'  " Readability suggestions
    let l:type = 'I'
  elseif a:entry.type ==# 'C'  " Convention violation
    let l:type = 'W'
  else
    let l:type = 'M'           " Everything else is a message
  endif
  let a:entry.type = l:type
endfunction

let g:neomake_elixir_mycredo_maker = {
  \ 'exe': 'mix',
  \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
  \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
  \ 'postprocess': function('NeomakeCredoErrorType')
  \ }

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" ============================================================================
" FZF
"

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Indent line character
let g:indentLine_char = '|'
let g:indentLine_first_char = '¦'
let g:indentLine_showFirstIndentLevel = 1

" Goyo settings
let g:goyo_width = 120
let g:goyo_linenr = 1

" set formatprg=mix\ format\ -


let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

let g:vim_json_syntax_conceal = 0
let g:two_firewatch_italics   = 1
let g:alchemist_tag_disable   = 1
let g:rainbow_active          = 0
let g:gruvbox_contrast_dark   = 'dark'

" NERDTree settings.
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore     = ['\.pyc$', '\.pyo$', '__pycache__', '\.DS_Store', '\.swo$', '\.swp$', '\.keep']
let g:NERDTreeWinSize    = 30

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" Airline/Powerline settings.
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_disable_statusline = 0
" let g:airline#extensions#neomake#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" " Airline unicode symbols due to Monaco font.
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'
"
let s:neomake_elixir_credo_config_typemap = {
    \ 'F': 'W',
    \ 'C': 'W',
    \ 'D': 'I',
    \ 'R': 'I'}

" ============================================================================
" CUSTOM FUNCTIONS
"
" A collection of custom functions such as a function used for trimming
" trailing whitespace or converting a file's encoding to UTF-8.

" Removes trailing whitespace from the current buffer.
function! Trim()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//eg
  call cursor(l, c)
:endfunction

" ============================================================================
" HOOKS
"
" Collection of various hooks that have to be executed when a certain filetype
" is set or action is executed.

" Automatically strip trailing whitespace.
autocmd! BufWritePre * :call Trim()
autocmd! BufWritePost * Neomake
autocmd BufWritePost *.exs,*.ex silent :!mix format %

" Set a few filetypes for some uncommon extensions
au BufRead,BufNewFile *.md     setf markdown
au BufRead,BufNewFile Gemfile  setf ruby
au BufRead,BufNewFile *.rake   setf ruby
au BufRead,BufNewFile *.ru     setf ruby
au BufRead,BufNewFile *.ex     setf elixir
au BufRead,BufNewFile *.exs    setf elixir
au BufNewFile,BufRead *.liquid setf liquid

" Taken from http://vim.wikia.com/wiki/Highlight_unwanted_spaces
au BufWinEnter * match Visual /\s\+$/
au InsertEnter * match Visual /\s\+\%#\@<!$/
au InsertLeave * match Visual /\s\+$/
au BufWinLeave * call clearmatches()

" Use 2 spaces per indentation level for Ruby, YAML and Vim script.
au FileType ruby   setlocal sw=2 sts=2 ts=2 expandtab
au FileType eruby  setlocal sw=2 sts=2 ts=2 expandtab
au FileType yaml   setlocal sw=2 sts=2 ts=2 expandtab
au FileType coffee setlocal sw=2 sts=2 ts=2 expandtab
au FileType elixir setlocal sw=2 sts=2 ts=2 expandtab
au FileType liquid setlocal sw=2 sts=2 ts=2 expandtab

" ============================================================================
" KEY BINDINGS
"
" A collection of custom key bindings.
"
map <F5> :SyntasticCheck<CR><Esc>
map <F6> :NERDTreeToggle<CR><Esc>
map <F7> :GitGutterLineHighlightsToggle<CR><Esc>
map <F8> :Gblame<space>w<CR><Esc>

nnoremap \ :Rg<SPACE>
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>

nnoremap :Wq :wq
nnoremap :WQ :wq
nnoremap :W :w
nnoremap :Q :q

noremap <MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>

" Easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ============================================================================
" NVIM SPECIFICS
"
if !has('nvim')
  set ttymouse=xterm2
  nnoremap <silent> <C-p> :FZF<CR>
endif

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  nnoremap <silent> <C-p> :FZF<CR>
  tnoremap <Esc> <C-\><C-n>
endif

if has('unix')
  let s:uname = system("uname")
endif

let g:python_host_prog='/usr/bin/python3'

" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 200)
