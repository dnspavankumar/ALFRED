FROM python:3.11-slim

WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy server code
COPY . .

# Expose port for Flask server
EXPOSE 5000

# Command to run the server
CMD ["python", "app.py"]
