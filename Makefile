NAME = docker-network-connector
BIN_DIR = /usr/local/bin
SYSTEMD_DIR = /etc/systemd/system

install:
	sudo cp `pwd`/$(NAME) $(BIN_DIR)
	sudo cp `pwd`/$(NAME).service $(SYSTEMD_DIR)
	sudo systemctl daemon-reload
	sudo systemctl enable $(NAME).service --now

uninstall:
	sudo systemctl disable $(NAME).service --now
	sudo rm -f $(BIN_DIR)/$(NAME) $(SYSTEMD_DIR)/$(NAME).service
