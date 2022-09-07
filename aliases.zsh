




# Enable aliases to be sudo’ed
alias sudo='sudo '

# Shortcuts
alias reloadshell="source $HOME/.zshrc"
alias sshconfig="vi ~/.ssh/config"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias c="clear"
alias root="sudo zsh"
alias vi="nvim"
alias d='ls -l'

# Directories
alias dotfiles="cd $DOTFILES"
alias desa="cd $HOME/desa"

# Postgres
alias pg="pgcli postgresql://postgres@localhost/"
# TODO: codd, fnet3, etc.

# Docker
alias dc="docker-compose"
alias dclogs="dc logs -f --tail 50"
alias app="docker-compose exec --user $(id -u):$(id -g) app"


# Git
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias gdiff="git diff"
alias force="git push --force"
alias nah='git reset --hard;git clean -df'
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias status="git status"
alias unstage="git restore --staged ."
alias wip="commit wip"






# Otros útiles

function weather() {
   city="$1"

   if [ -z "$city" ]; then
      city="Lloret"
   fi

   eval "curl http://wttr.in/${city}"
}
alias tiempo="weather"
alias lloret="weather lloret"
alias santiago="weather santiago_de_chile"


