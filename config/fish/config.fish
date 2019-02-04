if not set -q abbrs_initialized
  set -U abbrs_initialized

  abbr ga 'git add'
  abbr gc 'git commit'
  abbr gd 'git diff'
  abbr gm 'git merge'
  abbr gp 'git push'
  abbr gr 'git rebase'
  abbr gs 'git status'
  abbr pi 'pod install'
  abbr rb review-branch
  abbr ts 'tig status'
  abbr vim nvim
end
