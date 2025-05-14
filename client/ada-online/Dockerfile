FROM node:20-alpine

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy frontend code
COPY . .

# Create .env file for Vite to use during build
RUN echo "VITE_BACKEND_URL=${VITE_BACKEND_URL:-http://localhost:5000}" > .env

# Build the app
RUN npm run build

# Install serve to serve the static files
RUN npm install -g serve

# Create a script to run the server with the PORT environment variable
RUN echo '#!/bin/sh\n\
serve -s dist -l ${PORT:-10000}' > /app/start.sh && \
    chmod +x /app/start.sh

# Expose port for the frontend (Render will override this with PORT env var)
EXPOSE 10000

# Command to serve the built app
CMD ["/app/start.sh"]
