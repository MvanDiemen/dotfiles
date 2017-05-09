function pushbranch -d 'git push branchname'
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/' | sed 's/\?\[m//')
  git push origin $branch
end
