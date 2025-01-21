# Use a lightweight Python base image
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Copy the script and required files
COPY msg-converter.command /app/convert_msg.sh
COPY requirements.txt /app/requirements.txt

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    chmod +x /app/convert_msg.sh && \
    pip install --no-cache-dir -r /app/requirements.txt

# Default command to run the script
ENTRYPOINT ["/bin/bash", "/app/convert_msg.sh"]
