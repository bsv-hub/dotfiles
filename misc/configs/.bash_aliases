alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias gh="log --pretty=format:'%C(yellow)[%ad]%C(reset) %C(green)[%h]%C(reset) | %C(red)%s %C(bold red){{%an}}%C(reset) %C(blue)%d%C(reset)' --graph --date=short"
alias gc='git checkout '
alias ga='git add -p'
alias gcb='git checkout -b '
# alias gpr='git pull --rebase origin master'
alias gph='git push origin HEAD'
alias pull='git pull '
alias stash='git stash '
alias wttr='curl wttr.in/Moscow'
alias so='ddgr -w stackoverflow.com '
alias docker_clean_containers='docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null'
alias docker_clean_images='docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null'
alias snap_clean='snap list --all | while read snapname ver rev trk pub notes; do if [[ $notes = *disabled* ]]; then sudo snap remove "$snapname" --revision="$rev"; fi; done'

dictorg() { curl "dict.org/d:$1"; }
cheat() { curl "cheat.sh/$1"; }

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
