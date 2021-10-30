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

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Set default MySQL root password and auth type
#mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
cp /opt/homebrew/opt/pcre2/include/pcre2.h /opt/homebrew/opt/php/include/php/ext/pcre/pcre2.h # Previene error de compilacion de imagick
pecl pcov install imagick memcached redis swoole


# Php74
ln -s /opt/homebrew/opt/php@7.4/bin/php php74
ln -s /opt/homebrew/opt/php@7.4/bin/pecl pecl74
cp /opt/homebrew/opt/pcre2/include/pcre2.h /opt/homebrew/opt/php@7.4/include/php/ext/pcre/pcre2.h # Previene error de compilacion de imagick
pecl74 apcu install imagick redis 


# Install global Composer packages
#/usr/local/bin/composer global require laravel/installer laravel/valet beyondcode/expose

# Install Laravel Valet
#$HOME/.composer/vendor/bin/valet install


# Aplicaciones via npm
npm install puppeteer --global
npm install chokidar --global

# Deshabilita pager en Git
#git config --global core.pager cat
git config --global pager.log true
git config --global pager.branch false
git config --global pager.diff false
git config --global pager.tag false
git config --global pager.status false

git config --global user.email "jose.rodriguez@zecovery.com"
git config --global user.name "Jose Rodriguez"


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
