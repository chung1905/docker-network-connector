install:
	jq --version
	sudo cp `pwd`/docker-update-hosts /usr/local/bin/
	sudo cp `pwd`/docker-update-hosts.service /etc/systemd/system/
	sudo systemctl daemon-reload
	sudo systemctl enable docker-update-hosts.service --now

uninstall:
	sudo systemctl disable docker-update-hosts.service --now
	sudo rm -f /usr/local/bin/docker-update-hosts /etc/systemd/system/docker-update-hosts.service
	echo "Please remove data in /etc/hosts yourself"
