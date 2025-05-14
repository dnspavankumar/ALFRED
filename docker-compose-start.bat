@echo off
echo Starting ADA Application with Docker Compose...

REM Check if Docker is installed and running
docker --version > nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Docker is not installed or not in PATH.
    echo Please install Docker Desktop from https://www.docker.com/products/docker-desktop/
    pause
    exit /b 1
)

docker info > nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Docker daemon is not running.
    echo Please start Docker Desktop and try again.
    pause
    exit /b 1
)

REM Stop any existing containers
echo Stopping any existing containers...
docker-compose down

REM Build and start the containers
echo Building and starting containers...
docker-compose up -d --build

if %ERRORLEVEL% NEQ 0 (
    echo Failed to start containers. See error message above.
    pause
    exit /b 1
)

echo.
echo ADA Application is now running!
echo Frontend: http://localhost:10000
echo Backend: http://localhost:5000
echo.
echo To stop the application, run docker-compose-stop.bat
pause
