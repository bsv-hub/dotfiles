install: apt-install snap-install

# ranger tig tmux
apt-install:
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	sudo apt update
	sudo apt-get autoremove unity-lens-shoppin
	sudo apt -y install curl ansible \
		apt-transport-https ca-certificates software-properties-common \
		google-chrome-stable

snap-install:
	sudo snap install code --classic
	sudo snap install slack --classic
	sudo snap install sublime-text --classic
	sudo snap install telegram-desktop --classic
	sudo snap install vlc --classic
