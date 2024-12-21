
# Cam-AI Kernel SDK Docker Image

This directory contains a Dockerized environment for the Cam-AI Kernel SDK based on Ubuntu 18.04. The Docker image contains all necessary tools and libraries to set up a development environment for Cam-AI, including a custom version of OpenSSL.

## Docker Image Overview
- **Base Image**: Ubuntu 18.04
- **Maintainer**: Sundew Shin <sundew@wednus.com>

The image includes:
- Essential development tools (`build-essential`, `libncurses5-dev`, `zlib1g-dev`, etc.)
- Python and Git
- Older version of OpenSSL (1.0.2u) for compatibility
- The user `ubuntu` with `sudo` privileges
- A persistent workspace that can be mounted (optional for Mac users)

## Prerequisites
- **Host System**:
  - Ubuntu 18.04 or higher (or Docker installed on other systems)
  - Docker and Docker Compose installed

- **Target Hardware**:
  - Cam-AI Core or any Lindenis v536-compatible edge device with Linux support

## Getting Started

### 1. Build the Docker Image

Clone this repository and navigate to the directory containing the `Dockerfile`. Then build the image using the following command:

```bash
make build
```

### 2. Run the Docker Container

You can run the container using Docker Compose. The `compose.yml` file is provided to easily spin up the container.

```bash
docker-compose up -d
```

### 3. Mount a Persistent Volume (Optional for Mac Users)

If you're using a Mac and wish to mount a persistent volume for your workspace, follow these steps:

1. Create a case-sensitive sparse disk image:

   ```bash
   hdiutil create -type SPARSE -fs 'Case-sensitive APFS' -size 50g -volname FlagWorkspace ~/FlagWorkspace.dmg
   ```

2. Mount the sparse disk image:

   ```bash
   hdiutil attach ~/FlagWorkspace.dmg.sparseimage
   ```

3. Uncomment the volume mount section in `docker-compose.yml`:

   ```yaml
   volumes:
     - /Volumes/FlagWorkspace:/home/ubuntu/workspace
   ```

### 4. Access the Container

Once the container is running, you can access it via the following command:

```bash
docker exec -it flag bash
```

This will open a shell inside the running container, where you can begin development with the Cam-AI SDK.
