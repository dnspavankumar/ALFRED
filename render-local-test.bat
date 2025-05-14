@echo off
echo Testing Render deployment locally...

echo Building and starting backend...
cd server
docker build -t ada-backend .
docker run -d --name ada-backend -p 5000:5000 --env-file ../.env ada-backend
cd ..

echo Building and starting frontend...
cd client/ada-online
docker build -t ada-frontend .
docker run -d --name ada-frontend -p 10000:10000 -e VITE_BACKEND_URL=http://localhost:5000 ada-frontend
cd ../..

echo.
echo ADA Application is now running locally with Render configuration!
echo Frontend: http://localhost:10000
echo Backend: http://localhost:5000
echo.
echo To stop the application, run render-local-stop.bat
pause
