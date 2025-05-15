# Deploying ADA Application on Render Using Python

This guide explains how to deploy the ADA application on Render using Python (without Docker).

## Prerequisites

- A [Render](https://render.com/) account
- Your API keys for ElevenLabs, Google AI, and Google Maps

## Step 1: Deploy the Backend Service

1. Log in to your Render account
2. Go to the Dashboard
3. Click on "New" and select "Web Service"
4. Connect your GitHub repository
5. Configure the service:
   - **Name**: `ada-backend` (or any name you prefer)
   - **Root Directory**: `server`
   - **Environment**: Python
   - **Region**: Choose the region closest to your users
   - **Branch**: main (or your preferred branch)
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `python app.py`
   - **Plan**: Free

6. Add environment variables:
   - `ELEVENLABS_API_KEY`: Your ElevenLabs API key
   - `GOOGLE_API_KEY`: Your Google AI API key
   - `MAPS_API_KEY`: Your Google Maps API key
   - `FLASK_SECRET_KEY`: Any random string for Flask session security
   - `PORT`: 10000
   - `RENDER`: true

7. Click "Create Web Service"
8. Wait for the deployment to complete
9. Note the URL of your backend service (e.g., `https://ada-backend.onrender.com`)

## Step 2: Deploy the Frontend Service

1. Go back to the Render dashboard
2. Click on "New" and select "Static Site"
3. Connect to the same GitHub repository
4. Configure the service:
   - **Name**: `ada-frontend` (or any name you prefer)
   - **Root Directory**: `client/ada-online`
   - **Environment**: Node
   - **Branch**: main (or your preferred branch)
   - **Build Command**: `chmod +x build.sh && ./build.sh`
   - **Publish Directory**: `dist`

5. Add environment variables:
   - `VITE_BACKEND_URL`: The URL of your backend service from Step 1

6. Click "Create Static Site"
7. Wait for the deployment to complete

## Step 3: Access Your Application

Once both services are deployed, go to the URL of your frontend service to access your application.

## Troubleshooting

### Backend Issues

- **Application Error**: Check the logs in the Render dashboard
- **No Open Ports Detected**: Make sure your app is binding to the PORT environment variable
- **WebSocket Connection Failed**: Check CORS settings and make sure the frontend URL is allowed
- **Werkzeug Error**: If you see "RuntimeError: The Werkzeug web server is not designed to run in production", make sure you're using `allow_unsafe_werkzeug=True` in the socketio.run() call

### Frontend Issues

- **Build Failed**: Check the build logs for errors
- **Cannot Connect to Backend**: Verify the VITE_BACKEND_URL environment variable
- **Blank Page**: Check browser console for JavaScript errors

## Maintenance

- **Updating the Application**: Push changes to your GitHub repository, and Render will automatically redeploy
- **Monitoring**: Use the Render dashboard to monitor your services
- **Logs**: Check the logs in the Render dashboard for troubleshooting

## Important Notes

- The free tier on Render has limitations:
  - Services will "sleep" after 15 minutes of inactivity
  - Limited compute hours per month
  - No custom domains on the free plan
- For production use, consider upgrading to a paid plan
