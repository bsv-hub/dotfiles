install: apt-install snap-install

# ranger tig tmux
apt-install:
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	sudo apt update
	sudo apt -y install curl ansible \
		apt-transport-https ca-certificates software-properties-common \
		youtube-dl \
		tmux neovim ncdu tldr fzf \
		google-chrome-stable

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
	sudo snap install sublime-text --classic
	sudo snap install telegram-desktop --classic
	sudo snap install vlc --classic

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
