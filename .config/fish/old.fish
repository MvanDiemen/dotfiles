
function parse_git_branch
	sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's\(.*\)/\1/' | cut -c -30
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
  echo shell -c (git status 2> /dev/null) | grep 'Your branch is ahead' > /dev/null
end

function git_diverged
  echo shell -c (git status 2> /dev/null) | grep 'have diverged' > /dev/null
end

function git_behind
  echo shell -c (git status 2> /dev/null) | grep 'Your branch is behind' > /dev/null
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
	end
	printf '%s> ' (set_color normal)
end


