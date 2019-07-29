#!/bin/bash

install() {
    echo "Installing $1"
    if [[ $2 == "python" ]]; then
        pip install --user $1
    elif [[ $2 == "pythonsudo" ]]; then
        sudo pip install $1
    else
        yay -S --needed $1
    fi
}

# install yay
if ! pacman -Qi yay > /dev/null ; then
    echo "Installing yay"
    cd $HOME
    mkdir gitclones
    cd gitclones
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd $HOME/dotfiles
fi


# install dependencies
pckgs=('python vim zathura zathura-pdf-mupdf python-pip rcm bspwm kitty sxhkd texlive-most texlive-lang minted thunar xarchiver thunar-archive-plugin plank inkscape wmname')
python_pckgs=('numpy matplotlib pigments ipython')
python_sudo_pckgs=('inkscape-figures ipython')

for pckg in ${pckgs[@]}; do
    install $pckg
done

for pckg in ${python_pckgs[@]}; do
    install $pckg python
done

for pckg in ${python_sudo_pckgs[@]}; do
    install $pckg pythonsudo
done 

# configurate
echo "Creating symlinks on $HOME"
ln -s $HOME/dotfiles/rcrc $HOME/.rcrc
rcup -v

# refresh sxhkd keys
pkill -USR1 -x sxhkd

# time synchronization
timedatectl set-ntp true

# set one theme
python $HOME/dotfiles/themes/themes.py one

echo "Finished. Reboot is recommended."

