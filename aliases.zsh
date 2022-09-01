

alias d='ls -l'


# Enable aliases to be sudo’ed
alias sudo='sudo '

# Shortcuts
alias reloadshell="source $HOME/.zshrc"
alias sshconfig="vi ~/.ssh/config"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias c="clear"
alias root="sudo zsh"
alias vi="nvim"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# IP addresses
alias ip="curl https://diagnostic.opendns.com/myip ; echo"
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Directories
alias dotfiles="cd $DOTFILES"
alias desa="cd $HOME/desa"

# Laravel
alias a="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"
alias p="clear && pest"
alias pp="clear && pest --parallel"
alias pf="clear && pest --filter"
alias lt="tail -100 -f storage/logs/laravel.log"

#alias ppc="chokidar '**/*.php' --debounce 700 --command 'clear && pest --parallel && date'"
function pc()
{
  clear
  if [ -z "$1" ]
    then
      PEST="pest --parallel"
    else
      PEST="pest --filter $1"
  fi
  COMMAND="clear && $PEST && date '+%Y/%m/%d %H:%M:%S' && echo '\033[0;33m$PEST\033[0m'"

  eval $COMMAND
  chokidar '**/*.php' --debounce 700 --command $COMMAND
}

function tinker()
{
  if [ -z "$1" ]
    then
       php artisan tinker
    else
       php artisan tinker --execute="dd($1);"
  fi
}
alias t="tinker"

# Postgres
alias pg="pgcli postgresql://postgres@localhost/"
# TODO: codd, fnet3, etc.

# PHP
alias php81-switch="brew unlink php && brew link --overwrite --force php"
alias php80-switch="brew unlink php && brew link --overwrite --force php@8.0"
alias php74-switch="brew unlink php && brew link --overwrite --force php@7.4"
#alias php74-switch="brew unlink php && brew link --overwrite --force php@7.4"

#echo 'export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"' >> ~/.zshrc
#echo 'export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"' >> ~/.zshrc

# Composer
alias cfresh="rm -rf vendor/ composer.lock && composer i"
#alias composer="php -d memory_limit=-1 /opt/homebrew/bin/composer"

# Docker
alias dc="docker-compose"
alias dclogs="dc logs -f --tail 50"
alias app="docker-compose exec --user $(id -u):$(id -g) app"

# Kubernetes
alias kubectl="kubecolor"
alias kubectx="kubectl config use-context"
alias kubens="kubectl config set-context --current --namespace"
function kpsql()
{
  if [[ -z "$1" ]]; then 
    echo "Uso:"
    echo "    kpsql <microservicio>"
    echo "    Ejemplo: kpsql tramitesgenerales"
  else
    kubectl run "psql-$1" --rm -it --image postgres:12 --env PGPASSWORD=$(kubectl get secret $1 -o jsonpath="{.data.DB_PASSWORD}" | base64 -d) -- psql -h $(kubectl get configmap servicios -o jsonpath="{.data.DB_HOST}") -U $(kubectl get configmap $1 -o jsonpath="{.data.DB_USERNAME}") $(kubectl get configmap $1 -o jsonpath="{.data.DB_DATABASE}")
  fi
}

# Imprime el contexto actual en Kubernetes
function kcontext()
{
  if [[ "$PWD" == "/Users/jose/desa/sem/kubernetes" ]]; then
       kubectl config current-context
  fi
}


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




