# Forgejo Setup

A simple Forgejo hosting project managed with Docker Compose and Make.

## Introduction
This project provides a complete setup for hosting a Forgejo instance, including a web server (Caddy), a bot protection layer (Anubis), a database (MariaDB/MySQL), and a Forgejo runner for CI/CD.

## Links
- **Forgejo**: [forgejo.org](https://forgejo.org)
- **Caddy**: [caddyserver.com](https://caddyserver.com)
- **Anubis**: [anubis.techaro.lol](https://anubis.techaro.lol)

## Requirements
Before you begin, ensure you have the following installed:
- Docker
- Docker Compose
- Make

## Configuration
Before running the project, you need to create the environment-specific `.env` files.

### Local Development
Copy the example file to `.env.local`:
```sh
cp .env.example .env.local
```
Then, edit `.env.local` and fill in the required values.

### Production
Copy the example file to `.env.prod`:
```sh
cp .env.example .env.prod
```
Then, edit `.env.prod` and fill in the required values.

## Usage

### Production
To build and run the project in production mode:

```sh
# Build production images
make build ENV=prod

# Run the project in production
make run ENV=prod
```

### Local Development (Default)
To build and run the project locally:

```sh
make build
make run
```

### Forgejo Runner Configuration
After starting the project, you must register the runner in Forgejo:
1. Log in to Forgejo as an administrator.
2. Go to **Site Administration** > **Actions** > **Runners**.
3. Create a new runner and copy the **Registration Token**.
4. Edit `.docker/runner/data/runner-config.yml`:
    Example:
    ```yaml
    connections:
      local:
        url: http://forgejo.internal
        uuid: #FORGEJO_RUNNER_UUID#
        token: #FORGEJO_RUNNER_TOKEN#
        labels:
          - ubuntu-latest:docker://ghcr.io/catthehacker/ubuntu:act-24.04
    ```
5. Restart the runner service:
   
### Trusting Caddy Root CA
For HTTPS certificates to be trusted on your host machine (especially in local development), you need to add Caddy's root certificate to your host's trust store:
1. Copy the root certificate from the Caddy container:
   ```sh
   docker cp caddy:/data/caddy/pki/authorities/local/root.crt ./root.crt
   ```
2. Add `root.crt` to your system's trusted certificates (the process varies by OS).

### Stopping the Services
```sh
make stop ENV=prod
```