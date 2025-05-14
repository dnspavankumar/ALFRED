@echo off
echo Checking Docker installation and status...

docker --version
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

echo Docker is installed and running correctly.
echo.
echo You can now run render-local-test.bat to start the application.
pause
