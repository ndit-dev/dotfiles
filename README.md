# ndit-dev dotfiles

## new systems

### linux

```sh
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

```sh
cd ~
brew update && brew upgrade
brew chezmoi install zsh wget curl tree git lazygit unzip make gcc cmake fzf ripgrep bat fzf ripgrep bat lsd neovim neovide node
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

1. Install Powershell 7 with 'winget install Microsoft.Powershell'
2. install the following in pwsh, pwsh-profile will be loaded from OneDrive

```ps1
# jetbrains nerd fonts
& ([scriptblock]::Create((iwr 'https://to.loredo.me/Install-NerdFont.ps1'))) -Confirm:$false -Name jetbrains-mono
# bat, ripgrepm, fzf, npm, git, lazygit
winget install sharkdp.bat
winget install BurntSushi.ripgrep.MSVC
winget install fzf
winget install OpenJS.NodeJS.LTS
winget install git.Git
winget install JesseDuffield.lazygit
winget install zig.zig
# install terminal-icons for Powershell
Install-Module -Name Terminal-Icons -Repository PSGallery
# Chezmoi
winget install twpayne.chezmoi
chezmoi init --apply ndit-dev --apply
# starship
winget install --id Starship.Starship
# Neovim and neovide
winget install neovim.Neovim
winget install neovide.neovide
```

## new user with existing system installation

```sh
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
