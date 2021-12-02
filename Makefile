NAME = docker-network-connector
BIN_DIR = /usr/local/bin
SYSTEMD_DIR = /etc/systemd/system

status:
	systemctl status $(NAME).service

restart:
	sudo systemctl restart $(NAME).service

log:
	journalctl -u $(NAME).service

install:
	sudo cp `pwd`/$(NAME) $(BIN_DIR)
	sudo cp `pwd`/$(NAME).service $(SYSTEMD_DIR)
	sudo systemctl daemon-reload
	sudo systemctl enable $(NAME).service --now

uninstall:
	sudo systemctl disable $(NAME).service --now
	sudo rm -f $(BIN_DIR)/$(NAME) $(SYSTEMD_DIR)/$(NAME).service
