#!bin/bash

#Configurar git
read -p "Introduce tu nombre para Git: " git_name
read -p "Introduce tu email para Git: " git_email

git confing --global user.name "$git_name"
git confing --global user.email "$git_email"

#Instalar code con extenciones
sudo snap snap install --classic code
code --install-extension hilalh.hyper-dracula-vscode-theme
code --install-extension ritwickdey.livese
code --install-extension yzhang.markdown-all-in-one
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension miguelsolorio.symbo

#Instalciones de paquetes
sudo apt install -y wget || true
sudo apt install -y xclip || true
sudo apt install -y htop || true
sudo apt install -y sqlite3 || true
sudo apt install -y eza || true
sudo apt install -y micro || true
sudo apt install -y jq || true
sudo apt install -y tree || true

#Instalar gh
(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

#Copiar configuracion bashrc
cp .bashrc ~

#Instalacion FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Nerd fonts
sudo apt install -y fonts-firacode || true
wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip -d ~/.local/share/fonts
fc-cache -f -v

# oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s



