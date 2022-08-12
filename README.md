This is my nvim config written in pure lua. Support encoding rust.

# How to use?
1. Install some dependent libs first.
    - BurntSushi/ripgrep
        ```
        mac: 
        brew install ripgrep 
        ```
    - sharkdp/fd
        ```
        mac: 
        brew install fd
        ```
    - Nerd fonts  
        ```
        mac:
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font
        ```
2. Install your favorite fonts， for example：
    ```
    mac:
    brew tap homebrew/cask-fonts
    brew install font-go-mono-nerd-font
    ```
3. Install nvim (version >= 0.7)
    ```
    mac:
    brew install neovim
    ```
4. Download config of nvim. 
    git clone https://github.com/Fengys123/nvim-config.git ~/.config/nvim
5. When you open nvim for the first time, packer will be downloaded automatically.
6. After installing packer, manually sync the plugin.
    ```
    vim command:
    :PackerSync
    ```
7. Enjoy it!

# Recommended GUI
- neovide: https://github.com/neovide/neovide
- alacritty: https://github.com/alacritty/alacritty
    ```
    cp ~/.config/other/alacritty.yml ~/.config/alacritty/alacritty.yml
    ```
