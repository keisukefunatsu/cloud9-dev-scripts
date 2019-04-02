#!/bin/bash

sudo yum -y install gcc-c++ openssl-devel git readline-devel
mkdir ~/.rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
mkdir ~/.rbenv/plugins ~/.rbenv/plugins/ruby-build
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
cd ~/.rbenv/plugins/ruby-build
sudo ./install.sh
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

echo -e "if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi" >> ~/.bash_profile

echo -e "if [ -f ~/.git-prompt.sh ]; then
    GIT_PS1_SHOWDIRTYSTATE=1
    . ~/.git-prompt.sh
    PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi" >> ~/.bash_profile

source ~/.bash_profile

gem install rails

## additional packages
sudo yum install -y libcurl libcurl-devel
sudo yum install -y libxml2-devel
sudo yum install -y curl-devel