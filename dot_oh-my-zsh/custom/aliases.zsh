alias nv="nvim"
alias gs="git status"
alias gr='cd $(git rev-parse --show-toplevel)'
alias ipy="ipython"
alias tm="tmux"
alias mysync="rsync -ah --partial --info=progress2"
#alias duh= "du -h --max-depth=1"
alias duh= "du -sh"
alias l="ls -a"
alias j="fasd_cd -d"
alias jj="fasd_cd -d -i"

function cl() {
    cd "$@" && l
  }
