

# Laravel
alias a="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"
alias p="clear && pest"
alias pp="clear && pest --parallel"
alias pf="clear && pest --filter"
alias lt="tail -100 -f storage/logs/laravel.log"
alias t="tinker"
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

# Postgres
alias pg="pgcli postgresql://postgres@localhost/"
# TODO: codd, fnet3, etc.

# Composer
alias cfresh="rm -rf vendor/ composer.lock && composer i"
#alias composer="php -d memory_limit=-1 /opt/homebrew/bin/composer"
