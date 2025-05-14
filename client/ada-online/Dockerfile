FROM node:20-alpine

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy frontend code
COPY . .

# Build the app
RUN npm run build

# Install serve to serve the static files
RUN npm install -g serve

# Expose port for the frontend
EXPOSE 5173

# Command to serve the built app
CMD ["serve", "-s", "dist", "-l", "5173"]
