@echo off
echo Stopping local Render test...

echo Stopping and removing containers...
docker stop ada-frontend ada-backend
docker rm ada-frontend ada-backend

echo.
echo Local Render test has been stopped.
pause
