source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

set -x CHRUBY_ROOT /usr
set -x TERM 'xterm-256color'
set -x EDITOR 'nvim'
set -x GIT_EDITOR 'nvim'
set -x NVIM_TUI_ENABLE_TRUE_COLOR 1
set -x ES_HEAP_SIZE '1g'

set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
set -U FZF_LEGACY_KEYBINDINGS 0

set fish_greeting

set fish_color_command blue
set fish_color_param 00AACC
set fish_color_quote green
set fish_color_cwd yellow
set fish_color_cwd_root yellow
set fish_color_error red
set fish_color_status red
set fish_color_comment 9e9e9e
set fish_color_operator blue
set fish_color_redirection yellow
set fish_color_end yellow
set fish_color_search_match --background=333333
set fish_color_valid_path
set fish_color_match yellow
set fish_color_autosuggestion $fish_color_comment

set fish_pager_color_prefix yellow
set fish_pager_color_progress yellow
set fish_pager_color_completion $fish_color_redirection
set fish_pager_color_description $fish_color_comment

if test -e $PWD/.ruby-version
  chruby (cat $PWD/.ruby-version)
else
  chruby (cat $HOME/.ruby-version)
end

[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

if status --is-login
  for p in /usr/bin /usr/local/bin /opt/local/bin /usr/local/mysql/bin ~/bin ~/.config/fish/bin
    if test -d $p
      set PATH $p $PATH
    end
  end
end

bind \cr "rake"

function ss -d "Run the script/server"
	script/server
end

function sc -d "Run the Rails console"
	script/console
end
