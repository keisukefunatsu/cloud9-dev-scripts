#!/bin/bash

sudo yum install -y glances
sudo yum install -y tig 
sudo yum install -y bash-completion
sudo yum install -y lazygit
sudo yum install -y tig
sudo yum install -y git-flow-avh
sudo yum install -y git-completion

wget https://raw.githubusercontent.com/git/git/v2.5.0/contrib/completion/git-completion.bash
wget https://raw.githubusercontent.com/git/git/v2.5.0/contrib/completion/git-prompt.sh

mv git-completion.bash ~/.git-completion.bash
mv git-prompt.sh ~/.git-prompt.sh


echo -e "if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi" >> ~/.bash_profile

echo -e "if [ -f ~/.git-prompt.sh ]; then
    GIT_PS1_SHOWDIRTYSTATE=1
    . ~/.git-prompt.sh
    PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi" >> ~/.bash_profile

source ~/.bash_profile