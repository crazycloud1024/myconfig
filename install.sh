#!/bin/sh

a=`apt` 
b=`yum`

if [[ $a -eq '1' ]];then
    sudo apt-get remove -y vim 
    sudo apt-get install -y zsh
    sudo chsh -s /bin/zsh
    
    sudo  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    mv ./.zshrc ~/
    mv ./.vimrc ~/

    sudo apt-get install -y python-software-properties 
    sudo apt-get install -y software-properties-common 
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo apt-get install -y neovim
fi

if [[ $b -eq '1' ]];then
    yum remove -y vim
    yum install -y zsh python-software-properties software-properties-common neovim tmux
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cd ./tmux-config && sh install.sh
    mv ./tmux-config/tmux/tmux/tmux.conf ~/.tmux.conf

fi

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.vim/colors && cp ./molokai.vim ~/.vim/colors


vim +PlugInstall +qall


reboot
