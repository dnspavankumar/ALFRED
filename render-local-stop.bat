@echo off
echo Stopping local Render test...

echo Stopping and removing containers...
docker stop ada-frontend ada-backend 2>nul
docker rm ada-frontend ada-backend 2>nul

echo.
echo Local Render test has been stopped.
pause
