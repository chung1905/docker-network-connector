# Docker Network Connector
This bash script run in background, to connect/disconnect a container to all docker bridge networks.

## Why
I host all my applications as docker containers and expose no port.

So I need a reverse proxy like traefik, nginx or caddy.
- For traefik: it has more than I need, but there are some reason: I don't want a GUI, I prefer nginx or caddy config
file over yaml, but more than that, I don't want to mount my `docker.sock` to container.

- For nginx/caddy is good for me, if you didn't try Caddy, please give it a try:
  - Caddyfile is a godsend, I can create a reverse server in 1 line.
  - Auto SSL with Let's Encrypt or ZeroSSL.

But nginx/caddy is not born for Docker, you have to use one:
  - Expose docker container port so we can proxy to something like localhost:8989
  - Set container IP to static, we can proxy to 10.5.0.1:port
  - Use [this /etc/hosts update script](https://stackoverflow.com/a/63656003) with network_mode="host",
which is pretty good but we need to restart proxy server container to update container's hosts file.
So we can proxy to container_name:port.

With the inspiration of the last script, I wrote this.
This script listen to `docker events`, and connect my caddy container to all networks.


## Installation
### Step 1:
Open and edit your container name in `docker-network-connector` (default is `caddy`)
```shell
readonly main_con_name=caddy
```

### Step 2:
Copy `docker-network-connector` and service file to correct directory.
Reload systemd and enable it.

Or simple:
```shell
make install
```

## Uninstall
Disable service and remove it

Or:
```shell
make uninstall
```

## Usage
You can restart, view status/log with those commands:
```shell
make restart
make status
make log
```
