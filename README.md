# Neovim Config

## Introduction

This is my nvim config written in lua and vim script. Very friendly to coding rust.

## Install and setup

1. Install some dependent libs first.
    - xclip

        ```shell
        # mac
        brew install xclip
        ```

    - BurntSushi/ripgrep

        ```shell
        # mac 
        brew install ripgrep 
        ```

    - sharkdp/fd

        ```shell
        # mac
        brew install fd
        ```

    - Nerd fonts

        ```shell
        # mac
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font
        ```

    - fish

2. Install nvim (version >= 0.7)

    ```shell
    # mac
    brew install neovim
    ```

3. Clone repository

    ```shell
    git clone https://github.com/Fengys123/nvim-config.git ~/.config/nvim
    ```

4. When you open neovim for the first time, it will take a while to download the package.

5. Enjoy it!

## List of plugins used

- Plugin management via lazy.nvim

- TODO: complete plugin list.

## Recommended GUI

- [alacritty](https://github.com/alacritty/alacritty)

- [neovide](https://github.com/neovide/neovide)
