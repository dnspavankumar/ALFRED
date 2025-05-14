@echo off
echo Testing Render deployment locally...

SET PROJECT_ROOT=%CD%

echo Building and starting backend...
docker build -t ada-backend -f "%PROJECT_ROOT%\server\Dockerfile" "%PROJECT_ROOT%\server"
docker run -d --name ada-backend -p 5000:5000 --env-file "%PROJECT_ROOT%\.env" ada-backend

echo Building and starting frontend...
docker build -t ada-frontend -f "%PROJECT_ROOT%\client\ada-online\Dockerfile" "%PROJECT_ROOT%\client\ada-online"
docker run -d --name ada-frontend -p 10000:10000 -e VITE_BACKEND_URL=http://localhost:5000 ada-frontend

echo.
echo ADA Application is now running locally with Render configuration!
echo Frontend: http://localhost:10000
echo Backend: http://localhost:5000
echo.
echo To stop the application, run render-local-stop.bat
pause
