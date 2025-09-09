# Use the official Python image from Docker Hub
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file first (for better Docker layer caching)
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on (Flask default is 5000)
EXPOSE 5000

# Define the command to run the Flask app
# We use 0.0.0.0 so it's accessible from outside the container
CMD ["python", "app.py"]