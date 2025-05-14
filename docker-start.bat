@echo off
echo Starting ADA Application with Docker...
docker-compose up -d --build
echo.
echo ADA Application is now running!
echo Frontend: http://localhost:5173
echo Backend: http://localhost:5000
echo.
echo To stop the application, run docker-stop.bat
pause
