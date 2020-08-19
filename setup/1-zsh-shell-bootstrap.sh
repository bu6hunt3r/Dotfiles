#!/usr/bin/env bash

function log {
    printf "\033[1;32m$1\033[0m"
}

function check_return {
    if [ "$?" == "0" ]; then
	log "[OK]\n"
    fi
}


printf "%-40s" "Synchronize package databases ... "
sudo pacman -Sy &> /dev/null
check_return

sudo pacman -S --needed --noconfirm zsh wget curl git &> /dev/null

printf "%-40s" "Change users shell to zsh ... "
sudo chsh -s /usr/bin/zsh cr0c0 &> /dev/null
check_return


if [ ! -x "$(command -v yay)" ]; then
    printf "Install yay ... "
    # Install dependencies
    sudo pacman -S --needed --noconfirm git &> /dev/null

    # Create temp directory and navigate to it
    mkdir -p /tmp/yay_install
    cd /tmp/yay_install || exit 1

    # Install yay from git
    git clone https://aur.archlinux.org/yay.git . &> /dev/null
    makepkg --noconfirm -si &> /dev/null

    # Clean up
    cd ~ || exit 1
    rm -rf /tmp/yay_install
fi

printf "%-40s" "Check for yay ... "
command -v yay &> /dev/null
check_return

printf "%-40s" "Set up YADM and dotfiles ... "
yay -S --needed --noconfirm yadm-git &> /dev/null
check_return

printf "%-40s" "Set up antibody ... "
yay -S --needed --noconfirm antibody &> /dev/null
check_return

printf "%-40s" "Set up fzf ... "
sudo pacman -S --needed --noconfirm fzf &> /dev/null
check_return

printf "%-40s" "Set up yadm"
yay -S --needed --noconfirm yadm-git &> /dev/null
check_return

printf "%-40s" "Synchronize dotfiles repo"
sudo install -o cr0c0 -g cr0c0 -d /home/cr0c0/.config/
sudo -u cr0c0 yadm clone https://github.com/bu6hunt3r/dotfiles.git
check_return
