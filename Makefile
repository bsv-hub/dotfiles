setup:
	# Google chrome
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -	
	sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
	# VsCode	
	wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
	# php
	sudo add-apt-repository ppa:ondrej/php
	# composer
	#
	sudo apt update
	sudo apt -y install git curl ansible mc google-chrome-stable code \
	php7.3 php7.3-xml php7.3-mbstring php7.3-json php7.3-dom php7.3-sqlite3
	