#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update
export BREW_PREFIX=$(brew --prefix)

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle  --file ~/.dotfiles/Brewfile

# Set default MySQL root password and auth type
#mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
cp /$BREW_PREFIX/opt/pcre2/include/pcre2.h /$BREW_PREFIX/opt/php/include/php/ext/pcre/pcre2.h # Previene error de compilacion de imagick
pecl install imagick openswoole pcov redis 


# Php80
ln -s /$BREW_PREFIX/opt/php@8.0/bin/php $BREW_PREFIX/bin/php80
ln -s /$BREW_PREFIX/opt/php@8.0/bin/pecl $BREW_PREFIX/bin/pecl80
cp /$BREW_PREFIX/opt/pcre2/include/pcre2.h /$BREW_PREFIX/opt/php@8.0/include/php/ext/pcre/pcre2.h # Previene error de compilacion de imagick
pecl80 install imagick openswoole pcov redis 

# Php74
ln -s /$BREW_PREFIX/opt/php@7.4/bin/php $BREW_PREFIX/bin/php74
ln -s /$BREW_PREFIX/opt/php@7.4/bin/pecl $BREW_PREFIX/bin/pecl74
cp /$BREW_PREFIX/opt/pcre2/include/pcre2.h /$BREW_PREFIX/opt/php@7.4/include/php/ext/pcre/pcre2.h # Previene error de compilacion de imagick
pecl74 install apcu imagick redis 



# Install global Composer packages
#/usr/local/bin/composer global require laravel/installer laravel/valet beyondcode/expose
composer global require tightenco/takeout friendsofphp/php-cs-fixer

# Install Laravel Valet
#$HOME/.composer/vendor/bin/valet install


# Aplicaciones via npm
npm install -g puppeteer chokidar-cli

# Git

# Configuraciones globales
git config --global init.defaultBranch master
git config --global pull.rebase false
git config --global user.email "jose.rodriguez@zecovery.com"
git config --global user.name "Jose Rodriguez"

# Deshabilita pager en Git
#git config --global core.pager cat
git config --global pager.log true
git config --global pager.branch false
git config --global pager.diff false
git config --global pager.tag false
git config --global pager.status false



# Neovim
pip3 install pynvim

# Create a Sites directory
# mkdir $HOME/Sites
mkdir $HOME/desa

# Create sites subdirectories
# mkdir $HOME/Sites/blade-ui-kit
# mkdir $HOME/Sites/eventsauce
# mkdir $HOME/Sites/laravel

# Clone Github repositories
# ./clone.sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source .macos
