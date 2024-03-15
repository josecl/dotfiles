

# Laravel
alias a="php artisan"
alias c="composer"
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"
alias p="pest"
alias pp="pest --parallel"
alias ppf="pest --parallel --filter"
alias pf="pest --filter"
alias t="tinker"
#alias ppc="chokidar '**/*.php' --debounce 700 --command 'clear && pest --parallel && date'"

function tl()
{
  (
    while [[ ! -d "storage" && $PWD != "/" ]]; do
      cd ..
    done

    if [ -d "storage" ]; then
      tail -n 300 -f storage/logs/laravel.log |\
        sed -E '
          # JSON
          s/( \{".*\}?)/\x1B[38;5;110m\1\x1B[39m/;
          # traces
          s/^(#[0-9]+ .*\/vendor\/.*)/\x1B[38;5;242m\1\x1B[39m/;
          s/^(#[0-9]+ .*)/\x1B[38;5;248m\1\x1B[39m/;
          # Exceptions
          s/([a-zA-Z]*Exception)([^A-Za-z])/\x1B[32m\1\x1B[39m\2/;
          # severidad: ERROR, WARNING, ...
          s/\.(ERROR|ALERT|CRITICAL): /.\x1B[31m\1\x1B[39m: /;
          s/\.(WARN(ING)?): /.\x1B[33m\1\x1B[39m: /;
        '
    fi
  )
}

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
  return 0
}

# Postgres
alias pg="pgcli postgresql://postgres@localhost/"
# TODO: codd, fnet3, etc.

# Composer
alias cfresh="rm -rf vendor/ composer.lock && composer i"
#alias composer="php -d memory_limit=-1 /opt/homebrew/bin/composer"
