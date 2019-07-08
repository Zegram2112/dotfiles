#!/bin/bash

install() {
    echo "Installing $1"
    if [[ $2 == "python" ]]; then
        pip install --user $1
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
pckgs=('python vim zathura python-pip rcm bspwm kitty sxhkd texlive-most texlive-lang')
python_pckgs=('numpy matplotlib inkscape-figures')

for pckg in ${pckgs[@]}; do
    install $pckg
done

for pckg in ${python_pckgs[@]}; do
    install $pckg python
done

# configurate
echo "Creating symlinks on $HOME"
ln -s $HOME/dotfiles/rcrc $HOME/.rcrc
rcup -v

# refresh sxhkd keys
pkill -USR1 -x sxhkd

echo "Finished. Reboot is recommended."

