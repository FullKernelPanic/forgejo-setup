# Forgejo Setup

A simple Forgejo hosting project managed with Docker Compose and Make.

## Introduction
This project provides a complete setup for hosting a Forgejo instance, including a web server (Caddy), a bot protection layer (Anubis), a database (MariaDB/MySQL), and a Forgejo runner for CI/CD.

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

### Stopping the Services
```sh
make stop ENV=prod
```