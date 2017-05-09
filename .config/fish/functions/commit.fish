function commit -d 'git commit with ticket prefix'
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/' | sed 's/feature\///g' | sed 's/_\(.*\)//g')
  git commit -m "$branch $argv"
end
