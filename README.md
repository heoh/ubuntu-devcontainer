# Devcontainer

Docker container for development

## Components

### OpenSSH-Server

### Docker

To enable it, set the build argument to `use_docker=true`.

To run docker commands without root privileges, set the environment variable to `DOCKER_ALLOWS_NON_ROOT=true`.

There are two ways to use Docker inside a container.

#### Docker-out-of-Docker

Share the host's docker daemon into a container.

Add this in *docker-compose.yml*:
```yml
services:
  devcontainer:
    volumes:
      - /var/run:/mnt/host/var/run
```

If you are using *WSL* and *Docker Desktop for Windows*, set the environment to `DOCKER_GID=1001`.

#### Docker-in-Docker

The container uses a host-independent Docker daemon.

Don't mount */var/run* to container. 

Docker daemon will not run due to iptables permission issue. To resolve it, add this in *docker-compose.yml*:
```yml
services:
  devcontainer:
    cap_add:
      - NET_ADMIN
```
