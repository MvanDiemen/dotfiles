set -x CHRUBY_ROOT /usr/local

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
source $HOME/.config/fish/private.fish

set -x TERM 'screen-256color'
set -x EDITOR 'mvim -f'
set -x PATH $PATH $HOME/bin

set fish_greeting

set fish_pager_color_prefix yellow
set fish_pager_color_progress yellow
set fish_pager_color_completion normal
set fish_pager_color_description $fish_color_comment

chruby_reset

if test -e $PWD/.ruby-version
  chruby (cat $PWD/.ruby-version)
else
  chruby (cat $HOME/.ruby-version)
end
