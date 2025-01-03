# TESTED ON UBUNTU 24.04

# Color definitions
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_YELLOW="\033[1;33m"
COLOR_PURPLE="\033[1;35m"
COLOR_CYAN="\033[1;36m"
COLOR_RESET="\033[0m"

# Steps to perform
echo -e "\n${COLOR_CYAN}🗒️  Setup will perform the following steps:${COLOR_RESET}"
echo -e "\n"
echo -e "1. Update and upgrade system packages"
echo -e "2. Install essential development tools and utilities"
echo -e "3. Install and configure Zsh with Oh My Zsh"
echo -e "4. Install Zsh plugins (autosuggestions, syntax highlighting, fzf-history-search)"
echo -e "5. Install pyenv for Python version management"
echo -e "6. Install PostgreSQL client"
echo -e "7. Install WSL utilities"
echo -e "8. Set Zsh as default shell"
echo -e "\n"

read -p "Press Enter to continue..."

# Debug mode flag
DEBUG=false

# Exit on error or Ctrl+C
set -e
trap "echo 'Script interrupted.' ; exit 1" INT

# Begin setup
echo -e "\n${COLOR_BLUE}📦 Updating package lists...${COLOR_RESET}"
sudo apt-get update -qq 2>&1 | while read -r line; do
    echo -ne "\r\033[K${line}"
done
echo
if [ "$DEBUG" = true ]; then read -p "Press Enter to continue..."; fi

echo -e "\n${COLOR_BLUE}⬆️ Upgrading installed packages...${COLOR_RESET}"
sudo apt-get upgrade -y -qq 2>&1 | while read -r line; do
    echo -ne "\r\033[K${line}"
done
echo
if [ "$DEBUG" = true ]; then read -p "Press Enter to continue..."; fi

echo -e "\n${COLOR_GREEN}🛠️ Installing essential development tools and utilities...${COLOR_RESET}"
# Some tools
sudo apt-get install -y -qq build-essential git zsh neovim gedit fzf tmux eza bat colordiff ripgrep pipx \
fd-find libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm gettext telnet xdg-utils \
libncurses5-dev tk-dev tcl-dev blt-dev libgdbm-dev git aria2 lzma liblzma-dev python3 python3-pip 2>&1 | while read -r line; do
    echo -ne "\r\033[K${line}"
done
echo
# Zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh >/dev/null 2>&1

if [ "$DEBUG" = true ]; then read -p "Press Enter to continue..."; fi

echo -e "\n${COLOR_PURPLE}🚀 Installing Oh My Zsh...${COLOR_RESET}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended" >/dev/null 2>&1
if [ "$DEBUG" = true ]; then read -p "Press Enter to continue..."; fi

echo -e "\n${COLOR_YELLOW}⚙️ Configuring Zsh and Neovim...${COLOR_RESET}"

echo -e "\n${COLOR_CYAN}📝 Creating .zsh_plugins, .aliases, .zshrc and .config/nvim...${COLOR_RESET}"
echo 'plugins=(
    # asdf
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-fzf-history-search
    git
)' > ~/.zsh_plugins

echo -e "\n${COLOR_CYAN}🔧 Setting up aliases...${COLOR_RESET}"
echo 'alias vim="nvim "
export VISUAL="$EDITOR"
export EDITOR="nvim "
alias cd="z "
alias sudo="sudo "
alias cls="clear"
alias cat="batcat -pp "
alias diff="colordiff "
alias ls="eza"
alias l="eza"
alias ll="eza -l"
alias la="eza -la"
alias dir="eza -lah"
alias exe="chmod +x"' > ~/.aliases

echo -e "\n${COLOR_CYAN}📝 Creating .zshrc configuration...${COLOR_RESET}"
echo 'export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $HOME/.zsh_plugins
source $HOME/.aliases
source $ZSH/oh-my-zsh.sh
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
eval "$(zoxide init zsh)"
export BROWSER=wslview
unsetopt no_match' > ~/.zshrc

echo -e "\n${COLOR_CYAN}📝 Creating .config/nvim configuration...${COLOR_RESET}"
mkdir -p ~/.config/nvim
echo "set nu ai si cindent sw=4 ts=4 so=10 undofile et
au BufReadPost * if line(\"'\\\"\") > 1 && line(\"'\\\"\") <= line(\"\$\") | exe \"normal! g'\\\"\" | endif" > ~/.config/nvim/init.vim

if [ "$DEBUG" = true ]; then read -p "Press Enter to continue..."; fi

echo -e "\n${COLOR_PURPLE}🔌 Installing Zsh plugins...${COLOR_RESET}"
git clone -q https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone -q https://github.com/joshskidmore/zsh-fzf-history-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search
if [ "$DEBUG" = true ]; then read -p "Press Enter to continue..."; fi

# Install asdf (for now not needed)
# echo -e "\n${COLOR_YELLOW}📦 Installing asdf version manager...${COLOR_RESET}"
# git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

# Install asdf plugins
# echo -e "\n${COLOR_CYAN}🔧 Installing asdf plugins...${COLOR_RESET}"
# asdf plugin-add python
# asdf plugin-add golang

echo -e "\n${COLOR_GREEN}🐍 Installing pyenv...${COLOR_RESET}"
curl -s https://pyenv.run | bash >/dev/null 2>&1
if [ "$DEBUG" = true ]; then read -p "Press Enter to continue..."; fi

echo -e "\n${COLOR_BLUE}🐘 Installing PostgreSQL client...${COLOR_RESET}"
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg >/dev/null 2>&1
sudo apt-get update -qq 2>&1 | while read -r line; do
    echo -ne "\r\033[K${line}"
done
echo
sudo apt-get install -y -qq postgresql-client-17 2>&1 | while read -r line; do
    echo -ne "\r\033[K${line}"
done
echo
if [ "$DEBUG" = true ]; then read -p "Press Enter to continue..."; fi

# WSL utilities
echo -e "\n${COLOR_YELLOW}🐧 Installing WSL utilities...${COLOR_RESET}"
sudo add-apt-repository -y ppa:wslutilities/wslu >/dev/null 2>&1
sudo apt-get update -qq 2>&1 | while read -r line; do
    echo -ne "\r\033[K${line}"
done
echo
sudo apt-get install -y -qq wslu 2>&1 | while read -r line; do
    echo -ne "\r\033[K${line}"
done
echo
if [ "$DEBUG" = true ]; then read -p "Press Enter to continue..."; fi

# Last step
echo -e "\n${COLOR_PURPLE}🐚 Setting Zsh as default shell...${COLOR_RESET}"
while [ "$SHELL" != "/usr/bin/zsh" ]; do
    echo -e "${COLOR_YELLOW}🔑 Your password is needed to change your default shell${COLOR_RESET}"
    if chsh -s $(which zsh); then
        break
    fi
    echo -e "${COLOR_RED}❌ Failed to change shell. Please try again.${COLOR_RESET}"
done
if [ "$DEBUG" = true ]; then read -p "Press Enter to continue..."; fi


echo -e "\n${COLOR_GREEN}🎉 Setup completed successfully!${COLOR_RESET}"
echo -e "\n${COLOR_CYAN}🚀 Please restart your terminal to apply all changes.${COLOR_RESET}"
