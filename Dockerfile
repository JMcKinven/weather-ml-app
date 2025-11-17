FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies (If needed for numpy / sklearn)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy requirements first to leverage Docker caching
COPY requirements.txt .

# Install Python dependancies
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of application code

COPY . .

#Expose port for Flask
EXPOSE 5000


#Start flash app
CMD ["python","app.py"]

	


