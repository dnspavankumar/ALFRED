# Deploying the Frontend to Connect to Your Existing Backend

This guide explains how to deploy the frontend of the ADA application to connect to your existing backend at https://alfred-2.onrender.com.

## Prerequisites

- A [Render](https://render.com/) account
- Your backend already deployed at https://alfred-2.onrender.com

## Step 1: Deploy the Frontend Service

1. Log in to your Render account
2. Go to the Dashboard
3. Click on "New" and select "Static Site"
4. Connect your GitHub repository
5. Configure the service:
   - **Name**: `ada-frontend` or `alfred-frontend` (or any name you prefer)
   - **Root Directory**: `client/ada-online`
   - **Environment**: Node
   - **Branch**: main (or your preferred branch)
   - **Build Command**: `npm install && npm run build`
   - **Publish Directory**: `dist`

6. Add environment variables:
   - `VITE_BACKEND_URL`: https://alfred-2.onrender.com

7. Click "Create Static Site"
8. Wait for the deployment to complete
9. Note the URL of your frontend service (e.g., `https://alfred-frontend.onrender.com`)

## Step 2: Access Your Application

Once the frontend is deployed, go to the URL of your frontend service to access your application. It should now connect to your existing backend at https://alfred-2.onrender.com.

## Troubleshooting

### Frontend Issues

- **Build Failed**: Check the build logs for errors
- **Cannot Connect to Backend**: 
  - Verify the `VITE_BACKEND_URL` environment variable is correctly set to https://alfred-2.onrender.com
  - Check browser console for CORS errors
  - Make sure your backend has CORS configured to allow requests from your frontend URL

### CORS Issues

If you encounter CORS errors, you may need to update your backend to allow requests from your frontend domain:

1. Go to your backend service on Render
2. Add an environment variable:
   - `FRONTEND_URL`: Your frontend URL (e.g., https://alfred-frontend.onrender.com)
3. Redeploy the backend service

## Maintenance

- **Updating the Frontend**: Push changes to your GitHub repository, and Render will automatically redeploy
- **Monitoring**: Use the Render dashboard to monitor your service
- **Logs**: Check the logs in the Render dashboard for troubleshooting

## Important Notes

- The free tier on Render has limitations:
  - Services will "sleep" after 15 minutes of inactivity
  - Limited compute hours per month
  - No custom domains on the free plan
- For production use, consider upgrading to a paid plan
