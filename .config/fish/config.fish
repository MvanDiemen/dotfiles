set -x CHRUBY_ROOT /usr/local

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
source /usr/local/opt/fry/share/fry/fry.fish
source $HOME/.config/fish/private.fish

set -x TERM 'screen-256color'
set -x EDITOR 'mvim -f'
set -x PATH $PATH $HOME/bin

set fish_greeting

set fish_pager_color_prefix yellow
set fish_pager_color_progress yellow
set fish_pager_color_completion normal
set fish_pager_color_description $fish_color_comment

if test -e $PWD/.ruby-version
  chruby (cat $PWD/.ruby-version)
else
  chruby (cat $HOME/.ruby-version)
end

if status --is-login
	for p in /usr/bin /usr/local/bin /opt/local/bin /usr/local/mysql/bin /opt/local/lib/postgresql83/bin ~/bin ~/.config/fish/bin
		if test -d $p
			set PATH $p $PATH
		end
	end
end

function parse_git_branch
	sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | cut -c -30
end

function parse_git_tag
	git describe --tags --always ^/dev/null
end

function parse_git_tag_or_branch
	if [ (parse_git_branch) != "(no branch)" ]
        	parse_git_branch
	else
        	parse_git_tag
	end
end


function git_ahead
  echo $gitstatus | grep 'Your branch is ahead' > /dev/null
end

function git_diverged
  echo $gitstatus | grep 'have diverged' > /dev/null
end

function git_behind
  echo $gitstatus | grep 'Your branch is behind' > /dev/null
end

function git_parse_ahead_of_remote
  git status ^/dev/null | grep 'Your branch is ahead' | echo '^'
  git status ^/dev/null | grep 'Your branch is behind' | echo 'v'
end

function is_git
	git status >/dev/null ^&1
	return $status
end

function parse_svn_tag_or_branch
        sh -c 'svn info | grep "^URL:" | egrep -o "(tags|branches)/[^/]+|trunk" | egrep -o "[^/]+$"'
end

function parse_svn_revision
	sh -c 'svn info 2> /dev/null' | sed -n '/^Revision/p' | sed -e 's/^Revision: \(.*\)/\1/'
end

function is_svn
	svnversion | egrep -vq '^(Unversioned directory|exported)'
	return $status
end

function fish_prompt -d "Write out the prompt"
  set -x gitstatus shell -c (git status 2> /dev/null)
	# Color writeable dirs green, read-only dirs red
	if test -w "."
		printf ' %s%s' (set_color green) (prompt_pwd)
	else
		printf ' %s%s' (set_color red) (prompt_pwd)
	end

        # Print subversion tag or branch
	if is_svn
                printf ' %s%s%s' (set_color normal) (set_color blue) (parse_svn_tag_or_branch)
        end

	# Print subversion revision
	if is_svn
		printf '%s%s@%s' (set_color normal) (set_color blue) (parse_svn_revision)
	end

	# Print git tag or branch
	if is_git
		printf ' %s%s/%s' (set_color normal) (set_color blue) (parse_git_tag_or_branch)
		set git_ahead_of_remote (git_parse_ahead_of_remote)
    if git_ahead
      printf ' ↑'
    else if git_behind
      printf " ↓"
    else if git_diverged
      printf " ↕"
    end
	end
	printf '%s> ' (set_color normal)
end


bind \cr "rake"

function ss -d "Run the script/server"
	script/server
end

function sc -d "Run the Rails console"
	script/console
end

if test -d "/opt/java"
   set -x JAVA_HOME "/opt/java"
end

# yarrr, add /var/lib/gems/1.8/bin to path so gems installed by the retarded ubuntu rubygems package are on the path
set CUSTOM_GEM_PATH "/var/lib/gems/1.8/bin"
if test -d $CUSTOM_GEM_PATH
    set -x PATH $PATH "/var/lib/gems/1.8/bin"
end


# Load custom settings for current hostname
set HOST_SPECIFIC_FILE ~/.config/fish/(hostname).fish
if test -f $HOST_SPECIFIC_FILE
   . $HOST_SPECIFIC_FILE
else
   echo Creating host specific file: $HOST_SPECIFIC_FILE
   touch $HOST_SPECIFIC_FILE
end

# Load custom settings for current user
set USER_SPECIFIC_FILE ~/.config/fish/(whoami).fish
if test -f $USER_SPECIFIC_FILE
   . $USER_SPECIFIC_FILE
else
   echo Creating user specific file: $USER_SPECIFIC_FILE
   touch $USER_SPECIFIC_FILE
end

# Load custom settings for current OS
set PLATFORM_SPECIFIC_FILE ~/.config/fish/(uname -s).fish
if test -f $PLATFORM_SPECIFIC_FILE
   . $PLATFORM_SPECIFIC_FILE
else
   echo Creating platform specific file: $PLATFORM_SPECIFIC_FILE
   touch $PLATFORM_SPECIFIC_FILE
end



