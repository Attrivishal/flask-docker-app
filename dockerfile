# Use a stable Python base image
FROM python:3.9-alpine

# Set working directory
WORKDIR /app

# Copy only requirements first to leverage Docker cache
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app files
COPY . .

# Expose Flask port
EXPOSE 3000

# Run Flask app
CMD ["python", "index.py"]
