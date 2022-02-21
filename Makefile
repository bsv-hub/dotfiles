install: copy-configs-to-system install-essentials

# ranger tig tmux youtube-dl 
install-essentials:
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt update
	sudo apt -y install curl ansible \
		apt-transport-https ca-certificates software-properties-common build-essential \
		tmux neovim ncdu tldr fzf \

install-chrome:
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	sudo apt update
	sudo apt -y install google-chrome-stable

copy-configs-from-system:
	mkdir -p .config/Code/User/snippets/ \
		&& cp -R ~/.config/Code/User/snippets/ .config/Code/User/
	cp ~/.config/Code/User/keybindings.json .config/Code/User/
	cp ~/.config/Code/User/settings.json .config/Code/User/
	mkdir -p .config/micro/
	cp ~/.config/micro/settings.json .config/micro/
	cp ~/.config/micro/palette.txt .config/micro/
	cp ~/.config/micro/bindings.json .config/micro/
	cp ~/.config/micro/init.lua .config/micro/
	cp -R ~/.config/alacritty/ .config/
	cp -R ~/.config/nvim/ .config/
	cp -R ~/.config/ranger/ .config/
	cp -R ~/.config/tmux .config/
	cp ~/.config/starship.toml .config/

copy-configs-to-system:
	cp -R .config/ ~/.config/
	mkdir -p ~/.config/Code/User/snippets/ \
		&& cp -R .config/Code/User/ ~/.config/Code/

setup-nvim:
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
		~/.local/share/nvim/site/pack/packer/start/packer.nvim

ripgrep-workaround:
	apt-get download ripgrep
	sudo dpkg --force-overwrite -i ripgrep*.deb
	rm ripgrep*.deb

bat-workaround:
	sudo apt -y install bat
	sudo ln -s /usr/bin/batcat /usr/local/bin/bat

snap-install:
	sudo snap install code --classic
	sudo snap install slack --classic
	sudo snap install telegram-desktop --classic
	sudo snap install vlc --classic
	# sudo snap install sublime-text --classic

install-docker:
	sudo apt-get remove docker docker.io containerd runc
	sudo apt-get update
	sudo apt-get -y install \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg-agent \
		software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
	sudo apt-get update
	sudo apt-get -y install docker-ce docker-ce-cli containerd.io
	sudo usermod -aG docker $USER
	newgrp docker

setup-gnome:
	gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ru')]"
	gsettings set org.gnome.desktop.input-sources xkb-options "['grp:caps_toggle', 'ctrl:ralt_rctrl']"
