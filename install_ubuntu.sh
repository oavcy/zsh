#!/bin/bash

apt update

zsh --version && echo "ZSH already installed" || apt -y install zsh

[ "$SHELL" == "/usr/bin/zsh" ] && echo "ZSH already as SHELL for current user" || chsh -s /usr/bin/zsh $USER

apt install -y wget git

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

sed -i "s/ZSH_THEME.*/ZSH_THEME=\"fino-time\"/g" ~/.zshrc
sed -i "s/^plugins=.*/plugins=\(git ansible aws brew cp docker docker-compose gcloud genpass gitfast github gitignore helm history isodate iterm2 kubectl mosh nmap otp pass pip postgres redis-cli rsync salt screen shell-proxy ssh-agent sudo systemadmin systemd terraform tmux tmuxinator torrent virtualenv zsh-interactive-cd zsh-interactive-cd zsh-navigation-tools\)/g" ~/.zshrc

source ~/.zshrc

