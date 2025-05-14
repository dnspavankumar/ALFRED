# Docker Deployment for ADA Application

This guide explains how to deploy the ADA (Advanced Design Assistant) application using Docker.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed on your system
- [Docker Compose](https://docs.docker.com/compose/install/) installed on your system

## Deployment Steps

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Configure Environment Variables**

   The `.env` file contains all the necessary API keys and configuration. Make sure to update it with your own API keys:
   
   - `ELEVENLABS_API_KEY`: Get from ElevenLabs website
   - `GOOGLE_API_KEY`: Get from Google AI Studio (for Gemini Models)
   - `MAPS_API_KEY`: Get from Google Cloud Console (Enabled for Directions API)
   - `FLASK_SECRET_KEY`: Used for session security, can be any random string

3. **Build and Start the Docker Containers**

   ```bash
   docker-compose up -d --build
   ```

   This command will:
   - Build the Docker images for both the backend and frontend
   - Start the containers in detached mode

4. **Access the Application**

   - Frontend: http://localhost:5173
   - Backend: http://localhost:5000

5. **View Logs**

   To view the logs of the running containers:

   ```bash
   # View logs for all services
   docker-compose logs -f

   # View logs for a specific service
   docker-compose logs -f backend
   docker-compose logs -f frontend
   ```

6. **Stop the Application**

   ```bash
   docker-compose down
   ```

## Troubleshooting

- **Issue**: Frontend can't connect to backend
  **Solution**: Make sure both containers are running and the backend is accessible from the frontend container. Check the network configuration in docker-compose.yml.

- **Issue**: API keys not working
  **Solution**: Verify that the API keys in the .env file are correct and have the necessary permissions.

- **Issue**: Container fails to start
  **Solution**: Check the logs using `docker-compose logs` to identify the specific error.

## Additional Information

- The backend runs on port 5000
- The frontend runs on port 5173
- Both services are configured to restart automatically unless explicitly stopped
- The backend container has a volume mount to allow for code changes without rebuilding the image
