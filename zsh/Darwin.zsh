
export BREW_PREFIX=$(brew --prefix)
export HOMEBREW_NO_AUTO_UPDATE=1


export PATH=/Users/jose/desa/sem/cli:$PATH


# z
. $BREW_PREFIX/etc/profile.d/z.sh


# Puppeteer usa Google Chome en vez de Chromium
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

# node 16 LTS en vez de versiones más recientes
export PATH="$BREW_PREFIX/opt/node@16/bin:$PATH"
export LDFLAGS="-L$BREW_PREFIX/opt/node@16/lib"
export CPPFLAGS="-I$BREW_PREFIX/opt/node@16/include"

# Shortcuts
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# IP addresses
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# PHP
alias php81-switch="brew unlink php && brew link --overwrite --force php"
alias php80-switch="brew unlink php && brew link --overwrite --force php@8.0"
alias php74-switch="brew unlink php && brew link --overwrite --force php@7.4"

##
## Configruaciones que deben ir al final del .zshrc en un orden específico
##

# brew install zsh-autosuggestions
source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# brew install zsh-syntax-highlighting
source $BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Evita delay al pegar contenido en el terminal
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# brew install zsh-history-substring-search
source $BREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

