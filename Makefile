install: apt-install snap-install

# ranger tig tmux
apt-install:
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	sudo apt update
	sudo apt -y install curl ansible \
		apt-transport-https ca-certificates software-properties-common \
		youtube-dl \
		ncdu bat tldr fzf \
		google-chrome-stable

ripgrep-workaround:
	apt-get download ripgrep
	sudo dpkg --force-overwrite -i ripgrep*.deb
	rm ripgrep*.deb

snap-install:
	sudo snap install code --classic
	sudo snap install slack --classic
	sudo snap install sublime-text --classic
	sudo snap install telegram-desktop --classic
	sudo snap install vlc --classic
	
setup-gnome:
	gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ru')]"
	gsettings set org.gnome.desktop.input-sources xkb-options "['grp:caps_toggle', 'ctrl:ralt_rctrl']"
