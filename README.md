# set up new system 
cd ~
sudo apt update && sudo apt -y upgrade
sudo apt -y install zsh wget curl tree git
export PATH=$HOME/bin:$PATH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
curl -sS https://starship.rs/install.sh | sudo sh
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply ndit-dev
source ~/.zshrc
sudo do-release-upgrade
sudo reboot

# setup new user with existing system installation
cd ~
export PATH=$HOME/bin:$PATH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply ndit-dev
source ~/.zshrc
