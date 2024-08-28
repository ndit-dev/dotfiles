# ndit-dev dotfiles
## new systems
### linux
```
cd ~
sudo apt update && sudo apt -y upgrade
sudo apt -y install zsh wget curl tree git unzip net-tools make gcc fzf ripgrep bat fzf ripgrep bat lsd build-essential pipx python3-dev xclip
export PATH=$HOME/bin:$PATH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/gretzky/auto-color-ls.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/auto-color-ls
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
curl -sS https://starship.rs/install.sh | sudo sh
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply ndit-dev
source ~/.zshrc
```

### OS X
```
cd ~
brew update && brew upgrade
brew install zsh wget curl tree git unzip make gcc fzf ripgrep bat fzf ripgrep bat lsd ffmpeg
export PATH=$HOME/bin:$PATH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/gretzky/auto-color-ls.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/auto-color-ls
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
curl -sS https://starship.rs/install.sh | sudo sh
chezmoi init --apply ndit-dev --apply
source ~/.zshrc
```

### Windows
does not really use dot chezmoi, but have a setup script here anyway
1. Install PragmataPro (not on github for copyright reasons)
2. install the following after setting up the profile
```
# bat
winget install sharkdp.bat
# ripGrep
winget install BurntSushi.ripgrep.MSVC
# fuzzy finder
winget install fzf
# Cheznoi
winget install twpayne.chezmoi
chezmoi init --apply ndit-dev --apply
# starship
winget install --id Starship.Starship

```

## new user with existing system installation
```
cd ~
export PATH=$HOME/bin:$PATH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/gretzky/auto-color-ls.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/auto-color-ls
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply ndit-dev
source ~/.zshrc
```
