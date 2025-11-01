# Neovim Config

## Introduction

This is my nvim config written in lua and vim script.

## Install and setup

1. Install some optional but recommended tools.
    - BurntSushi/ripgrep

        ```shell
        # arch linux
        pacman -S ripgrep 
        ```

    - sharkdp/fd

        ```shell
        # arch linux
        pacman -S fd
        ```

    - Nerd fonts

        ```shell
        # arch linux
        # example for github monaspace nerd font
        pacman -S otf-monaspace-nerd
        ```

    - fish
    
        ```shell
        # arch linux
        pacman -S fish
        ```

2. Install nvim

    ```shell
    # arch linux
    pacman -S neovim
    ```

3. Clone repository

    ```shell
    git clone https://github.com/fengys1996/nvim-config.git ~/.config/nvim
    ```

4. When you open neovim for the first time, it will take a while to download the package.

5. Enjoy it!

## List of plugins used

- Plugin management via lazy.nvim

- TODO: complete plugin list.

## Recommended GUI

- [alacritty](https://github.com/alacritty/alacritty)

- [neovide](https://github.com/neovide/neovide)
