setup:
	# Google chrome
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -	
	sudo add-apt-repository "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
	# php
	sudo add-apt-repository ppa:ondrej/php 
	#
	sudo apt update
	sudo apt -y install ansible mc google-chrome-stable \
	php7.3 php7.3-mbstring php7.3-json php7.3-dom php7.3-sqlite3 composer
	#sudo snap install vscode --classic
