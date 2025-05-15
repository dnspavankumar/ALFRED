#!/bin/bash
# Start script for Render deployment

# Set environment variables if not already set
export PORT=${PORT:-10000}
export RENDER=true

# Run the application
python app.py
