# Use official Python 3.10.11 image
FROM python:3.11-slim
# Set work directory
WORKDIR /app

# Install system dependencies (if needed, can be removed if not using any OS deps)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements (if you use one)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy your code
COPY . .

# Run the Extractor module
# Run the web server (for Render's port check) and the Extractor bot
CMD ["sh", "-c", "python app.py & python -m Extractor"]
