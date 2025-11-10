# Sotehus Power Configuration

Docker Compose configuration for the Sotehus Power project.

## Prerequisites

- Docker
- Docker Compose
- External network `sotehus` must exist

## Setup

1. Create the external network if it doesn't exist:
   ```bash
   docker network create sotehus
   ```

2. Copy the `.env.example` file to `.env` and configure your environment variables:
   ```bash
   cp .env.example .env
   ```

3. Edit `.env` with your specific configuration.

## Usage

Start the service:
```bash
docker-compose up -d
```

Stop the service:
```bash
docker-compose down
```

View logs:
```bash
docker-compose logs -f
```

## Configuration

The service is configured through environment variables in the `.env` file.

Default port: `8080`

## Network

The service uses an external Docker network named `sotehus`. Ensure this network exists before starting the service.
