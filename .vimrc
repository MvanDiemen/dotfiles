" ============================================================================
" VIM CONFIGURATION FILE
"
" This file contains all the Vim configuration settings that I use across
" different computers. These settings include setting themes, remapping leader
" keys, callbacks and many other settings. Font related settings are set in
" ~/.hvimrc instead since different setups tend to render fonts completely
" different (at least in my experience).
"
" The code in this configuration file is released in the public domain. You're
" free to use it as you see fit.
"
" Author:  Michaël van Diemen
" License: Public Domain

" ============================================================================
" PLUGIN SETTINGS
"
" Settings for various plugins such as Pathogen and Syntastic.
"
" runtime bundle/pathogen/autoload/pathogen.vim
" call pathogen#infect()

" Setup Vundle
filetype off

let needsToInstallBundles=0
if !isdirectory(expand("~/.vim/bundle/vundle"))
  echo "\nInstalling Vim dependencies... Please be patient!\n"
  silent !mkdir -p ~/.vim/tmp
  silent !mkdir -p ~/.vim/swap
  silent !mkdir -p ~/.vim/bundle
  silent !mkfifo ~/.vim/commands-fifo
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let needsToInstallBundles=1
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Do these first, because other plugins depend on them
Bundle 'gmarik/vundle'

" Ag is deprecated but I still prefer it to Ack.
Bundle 'mileszs/ack.vim'
" Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'raimondi/delimitmate'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
" Bundle 'slim-template/vim-slim'
Bundle 'yggdroot/indentline'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
" Bundle 'xuyuanp/nerdtree-git-plugin'
Bundle 'powerline/powerline'
Bundle 'vim-scripts/tcomment'
" Bundle 'tomtom/tlib_vim'
" Bundle 'leafgarland/typescript-vim'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'airblade/vim-gitgutter'
Bundle 'pangloss/vim-javascript'
Bundle 'noprompt/vim-yardoc'
Bundle 'junegunn/vim-easy-align'
Bundle 'godlygeek/tabular'
Bundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Bundle 'junegunn/fzf.vim'

" ================================
" BUNDLE COLORSCHEMES
Bundle 'w0ng/vim-hybrid'
Bundle 'yorickpeterse/happy_hacking.vim'
Bundle 'rakr/vim-two-firewatch'
Bundle 'MvanDiemen/ghostbuster'
Bundle 'rakr/vim-one'
" Bundle 'liuchengxu/space-vim-dark'
Bundle 'lifepillar/vim-solarized8'

if needsToInstallBundles == 1
  echo "\nInstalling Bundles, please ignore key map error messages\n"
  :BundleInstall!
  echo "\nInstalled.\n"
endif

filetype plugin indent on
syntax on

" ============================================================================
" GENERAL SETTINGS
"
" A collection of general Vim settings such as enabling the use of the mouse,
" what key combination to use for toggling the paste mode and various other
" settings.
"

set shell=sh
set nocompatible
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete
set backupskip=/tmp/*
set clipboard=unnamed
set pastetoggle=<F2>
set mouse=a
set tabline=%f
set guitablabel=%f
set lazyredraw
set ttyfast
set hidden
set history=100
set hlsearch
set termguicolors

if system("xrandr --listactivemonitors") =~ 'eDP'
  set guifont=Hack\ 12
elseif system("xrandr --listactivemonitors") =~ 'DP-1'
  set guifont=Hack\ 16
else
  set guifont=Hack\ 9
endif

" Do not show GUI Messages
" Remove scroll bars
set guioptions=aemc

" Printer settings
set printoptions=number:n
set printoptions=header:0

let mapleader      = ','
let maplocalleader = '\'

" These settings are disabled to get some extra performance out of Vim when
" dealing with large files.
set nocursorcolumn
set nocursorline

" I've disabled parens matching since it usually slows down drawing of
" characters quite a bit and I hardly rely on it anyway.
let loaded_matchparen = 1

" Use ag for the :grep command as well as for Ctrlp
if executable('rg')
  set grepprg=rg\ --nogroup\ --nocolor

  let g:ackprg="rg --vimgrep"

  " let g:ctrlp_user_command = ':FZF ""'
  nnoremap <c-p> :FZF<cr>
endif

" CtrlP settings
" let g:ag_working_path_mode="r"

" Indent line character
let g:indentLine_char = '|'
let g:indentLine_first_char = '¦'
let g:indentLine_showFirstIndentLevel = 1

" Syntastic settings.
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 0
let g:syntastic_error_symbol = '!'
let g:syntastic_ignore_files = ['\.min\.js$', '\.min\.css$']
let g:syntastic_loc_list_height = 5
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = '!'
let g:syntastic_style_warning_symbol = '!'

let g:syntastic_html_checkers = []
let g:syntastic_java_checkers = []
let g:syntastic_javascript_checkers = []
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_sh_checkers = ['shellcheck']

let g:syntastic_mode_map = {
  \ 'mode': 'passive',
  \ 'active_filetypes': ['c', 'javascript', 'coffee', 'cpp', 'rust', 'rupy']}

" Ignore syntax checking for Shell scripts as this is currently broken.
let g:syntastic_mode_map = {
  \ 'mode': 'passive',
  \ 'active_filetypes': ['c', 'javascript', 'coffee', 'cpp', 'rust', 'ruby']}

let g:spacegray_italicize_comments = 1
let g:two_firewatch_italics = 1
let g:ghostbuster_italics   = 1
let g:solarized_termtrans   = 1
let g:solarized_term_italics = 1

" NERDTree settings.
let g:NERDTreeShowHidden    = 1
let g:NERDTreeIgnore        = ['\.pyc$', '\.pyo$', '__pycache__', '\.DS_Store', '\.swo$', '\.swp$', '\.keep']
let g:NERDTreeWinSize       = 30

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
let g:airline_theme           = 'twofirewatch'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Airline unicode symbols due to Monaco font.
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Git Gutter settings
let g:gitgutter_sign_column_always = 1

"============================================================================
" SYNTAX SETTINGS
"
" Settings related to configuring the syntax features of Vim such as the text
" width, what theme to use and so on.
"
set textwidth=180
set nowrap
set number
set showmatch
set synmaxcol=300
set background=dark

" color two-firewatch
" color space-vim-dark
color crystin

" colorcolumn doesn't work on slightly older versions of Vim.
if version >= 703
  set colorcolumn=180
endif

" Indentation settings
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set autoindent

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

" Set a few filetypes for some uncommon extensions
autocmd! BufRead,BufNewFile *.md     set filetype=markdown
autocmd! BufRead,BufNewFile Gemfile  set filetype=ruby
autocmd! BufRead,BufNewFile *.rake   set filetype=ruby
autocmd! BufRead,BufNewFile *.ru     set filetype=ruby

" Taken from http://vim.wikia.com/wiki/Highlight_unwanted_spaces
autocmd BufWinEnter * match Visual /\s\+$/
autocmd InsertEnter * match Visual /\s\+\%#\@<!$/
autocmd InsertLeave * match Visual /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Use 2 spaces per indentation level for Ruby, YAML and Vim script.
autocmd! FileType ruby   setlocal sw=2 sts=2 ts=2 expandtab
autocmd! FileType eruby  setlocal sw=2 sts=2 ts=2 expandtab
autocmd! FileType yaml   setlocal sw=2 sts=2 ts=2 expandtab
autocmd! FileType coffee setlocal sw=2 sts=2 ts=2 expandtab

" Set rubycomplete buffer for ruby and eruby files
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" ============================================================================
" KEY BINDINGS
"
" A collection of custom key bindings.
"
map <F5> :SyntasticCheck<CR><Esc>
map <F6> :NERDTreeToggle<CR><Esc>
map <F7> :GitGutterLineHighlightsToggle<CR><Esc>
map <F8> :Gblame<space>w<CR><Esc>

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

nnoremap \ :Ack<SPACE>
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>

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

  runtime! python_setup.vim
endif

if has('unix')
  let s:uname = system("uname")
  let g:python_host_prog='/usr/bin/python'
  if s:uname == "Darwin\n"
    let g:python_host_prog='/usr/bin/python'
    " let g:python3_host_prog='/usr/local/bin/python3'
  endif
endif

" ============================================================================
" HOST SPECIFIC CONFIGURATION
"
" Load a host specific .vimrc. This allows this generic .vimrc file to be
" re-used across the various machines that I use while still being able to set
" host specific configuration options.
"
" The name .hvimrc is derived from "host specific .vimrc".
"
if filereadable(expand('~/.hvimrc'))
  source ~/.hvimrc
endif
