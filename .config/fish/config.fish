export ERL_AFLAGS="-kernel shell_history enabled"

set -x CHRUBY_ROOT /usr
set -x TERM 'xterm-256color'
set -Ux EDITOR '/usr/bin/nvim'
set -Ux BROWSER '/usr/bin/brave'
set -Ux GIT_EDITOR 'nvim'
set -x NVIM_TUI_ENABLE_TRUE_COLOR 1
set -x ES_HEAP_SIZE '1g'

set -x EDITOR '/usr/bin/nvim'
set -x VISUAL '/usr/bin/nvim'

set -Ux LC_ALL 'en_GB.UTF8'
set -Ux LANG 'en_GB.UTF8'

set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow'
set -U FZF_LEGACY_KEYBINDINGS 0
set -x KERL_CONFIGURE_OPTIONS '--disable-debug --without-javac'

set -gx PATH '~/.npm-global/bin' $PATH

source $HOME/.config/fish/config.secret.fish

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
set fish_color_search_match --background=555
set fish_color_valid_path
set fish_color_match yellow
set fish_color_autosuggestion $fish_color_comment

set fish_pager_color_prefix yellow
set fish_pager_color_progress yellow
set fish_pager_color_completion $fish_color_redirection
set fish_pager_color_description $fish_color_comment

set -g theme_nerd_fonts no
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_ruby no
set -g theme_project_dir_length 1


[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

if status --is-login
  for p in /usr/bin /usr/local/bin /opt/local/bin /usr/local/mysql/bin ~/bin ~/.config/fish/bin
    if test -d $p
      set PATH $p $PATH
    end
  end
end

bind \cr "rake"
source $HOME/.asdf/asdf.fish
set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths
status --is-interactive; and source (rbenv init -|psub)
