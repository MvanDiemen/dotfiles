function grmb -d 'git remove merged branches'
  git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d
end
