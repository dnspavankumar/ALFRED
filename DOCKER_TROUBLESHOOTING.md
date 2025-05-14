# Docker Troubleshooting Guide for ADA Application

This guide helps you troubleshoot common Docker-related issues when deploying the ADA application.

## Common Issues and Solutions

### 1. "failed to solve: failed to read dockerfile: open Dockerfile: no such file or directory"

This error occurs when Docker can't find the Dockerfile in the specified location.

**Solutions:**
- Make sure you're running the commands from the root directory of the project
- Check that the Dockerfile exists in the correct location:
  - Backend Dockerfile should be at `server/Dockerfile`
  - Frontend Dockerfile should be at `client/ada-online/Dockerfile`
- Use absolute paths in your Docker commands:
  ```
  docker build -t ada-backend -f "C:\path\to\project\server\Dockerfile" "C:\path\to\project\server"
  ```

### 2. Docker Daemon Not Running

If you see an error like "Cannot connect to the Docker daemon", it means Docker is not running.

**Solutions:**
- Start Docker Desktop
- Wait for Docker to fully initialize
- Run `docker info` to verify Docker is running

### 3. Port Already in Use

If you see an error like "port is already allocated", it means another process is using the port.

**Solutions:**
- Stop any existing containers: `docker stop ada-frontend ada-backend`
- Remove existing containers: `docker rm ada-frontend ada-backend`
- Check if other applications are using the ports:
  ```
  netstat -ano | findstr :5000
  netstat -ano | findstr :10000
  ```
- Change the port mapping in the Docker run command if needed

### 4. Environment Variables Not Set

If the application is running but not working correctly, it might be due to missing environment variables.

**Solutions:**
- Make sure the `.env` file exists in the root directory
- Check that the `.env` file contains all required variables
- Verify that the Docker run command includes the `--env-file` flag

### 5. Network Issues Between Containers

If the frontend can't connect to the backend, it might be a network issue.

**Solutions:**
- Make sure both containers are running: `docker ps`
- Check that the `VITE_BACKEND_URL` environment variable is set correctly
- Try using Docker Compose instead of individual Docker commands

## Advanced Troubleshooting

### Checking Container Logs

To see what's happening inside the containers:

```
docker logs ada-backend
docker logs ada-frontend
```

### Accessing Container Shell

To get a shell inside a running container:

```
docker exec -it ada-backend /bin/bash
docker exec -it ada-frontend /bin/sh
```

### Rebuilding Images

If you've made changes to the code, you need to rebuild the images:

```
docker stop ada-frontend ada-backend
docker rm ada-frontend ada-backend
docker rmi ada-frontend ada-backend
```

Then run the `render-local-test.bat` script again.

## Docker Compose Alternative

If you're still having issues with the individual Docker commands, try using Docker Compose:

1. Make sure you're in the root directory of the project
2. Run `docker-compose up -d`
3. Check the logs with `docker-compose logs`
4. Stop the containers with `docker-compose down`

## Getting Help

If you're still experiencing issues:

1. Run `check-docker.bat` to verify Docker is installed and running
2. Check the Docker logs for more detailed error messages
3. Search for the specific error message online
4. Consult the Docker documentation at https://docs.docker.com/
