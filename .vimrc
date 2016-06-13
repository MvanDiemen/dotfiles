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
set guifont=Monaco:h12
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

if has("gui_running")
  set lines=999 columns=999
endif

" Do not show GUI Messages
set guioptions+=c

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
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching  = 0

  let g:ag_working_path_mode="r"
endif

" ============================================================================
" PLUGIN SETTINGS
"
" Settings for various plugins such as Pathogen and Syntastic.
"
" runtime bundle/pathogen/autoload/pathogen.vim
" call pathogen#infect()

" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/repos/dotfiles/.vim/bundle/')

  " Necessary Vundle plugin
  Plugin 'VundleVim/Vundle.vim'

  Plugin 'rking/ag.vim'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'Raimondi/delimitMate'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-surround'
  Plugin 'Yggdroot/indentLine'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'powerline/powerline'
  Plugin 'godlygeek/tabular'
  Plugin 'vim-scripts/tComment'
  Plugin 'tomtom/tlib_vim'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'SirVer/ultisnips'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'easymotion/vim-easymotion'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'pangloss/vim-javascript'
  Plugin 'noprompt/vim-yardoc'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'skalnik/vim-vroom'
  Plugin 'junegunn/goyo.vim'
  Plugin 'morhetz/gruvbox'
  Plugin 'jdkanani/vim-material-theme'
  Plugin 'ajh17/Spacegray.vim'
  Plugin 'juanedi/predawn.vim'
  Plugin 'AlessandroYorba/Sierra'
  Plugin 'AlessandroYorba/Alduin'
  Plugin 'kocakosm/hilal'
  Plugin 'marcopaganini/termschool-vim-theme'
  Plugin 'mkarmona/colorsbox'
  Plugin 'tlhr/anderson.vim'
  Plugin 'xiaody/thornbird.vim'
  Plugin 'blackgate/tropikos-vim-theme'
  Plugin 'kristijanhusak/vim-hybrid-material'
  Plugin 'justincampbell/vim-railscasts'
  Plugin 'w0ng/vim-hybrid'
  Plugin 'zandrmartin/vim-distill'

call vundle#end()
filetype plugin indent on


" Indent line character
let g:indentLine_char = '|'
let g:indentLine_first_char = '¦'
let g:indentLine_showFirstIndentLevel = 0

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

let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:spacegray_italicize_comments = 1
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
let g:airline_theme           = 'bubblegum'

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
set textwidth=80
set nowrap
set number
set showmatch
set synmaxcol=500
set background=dark

filetype plugin indent on
syntax on
"color happy_hacking
" color crystin
color hybrid

" colorcolumn doesn't work on slightly older versions of Vim.
if version >= 703
  set colorcolumn=80
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

nnoremap \ :Ag<SPACE>
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" ============================================================================
" NVIM SPECIFICS
"
if !has('nvim')
  set ttymouse=xterm2
endif

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

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

" Open NERDTree in new tabs and windows if no command line args set
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
