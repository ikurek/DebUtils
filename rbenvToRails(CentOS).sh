#!/bin/bash

# Exit on any command fail
set -e

# Begin install
echo -e "==> Begining Ruby on Rails install using rbenv..."

RUBYVERSION=""
RAILSVERSION=""

# Check if ruby version was specified
if [ -z "$1" ]
  then
    read -e -p "==> Please enter Ruby version (eg. 2.2.1): " RUBYVERSION
  else
    RUBYVERSION="$1"
fi

# Confirm ruby version
echo -e "==> Selected Ruby version is: $RUBYVERSION"

# Check if rails version was specified
if [ -z "$2" ]
  then
    read -e -p "==> Please enter Rails version (eg. 2.5.1): " RAILSVERSION
  else
    RAILSVERSION="$2"
fi

# Confirm rails version
echo -e "==> Selected Rails version is: $RAILSVERSION"

# Install required dependencies using YUM
echo "==> Beggining dependencies install..."
sudo yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel
echo "==> Dependencies installed!"

# Get and install rbenv
cd
echo "==> Rbenv will be installed in ${pwd}/.rbenv!"

# Clone and install rbenv
echo "==> Downloading rbenv..."
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo "==> Updating PATH in .bash_profile..."
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo "==> Setting rbenv init in .bash_profile..."
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

# Clone and install ruby-build
echo "==> Downloading ruby-build..."
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo "==> Updating PATH in .bash_profile..."
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile

# Rbenv is installed
echo "==> Rbenv installed!"
echo "==> Installing Ruby $RUBYVERSION"

# Install ruby with selected version
~/.rbenv/bin/rbenv install -v $RUBYVERSION
~/.rbenv/bin/rbenv global $RUBYVERSION

# Ruby is installed
echo "==> Ruby $RUBYVERSION installed!"

# Install bundler
echo "==> Installing bundler gem..."
gem install bundler
echo "==> Bundler installed!"

# Install rails with proivided version
echo "==> Installing Rails $RAILSVERSION"
gem install rails -v $RAILSVERSION
rbenv rehash
echo "==> Rails $RAILSVERSION installed!"

# Install done
echo ""
echo "==> Succesfully installed Ruby $RUBYVERSION with Rails $RAILSVERSION!"
echo "==> Please logout or reboot to apply PATH changes"
