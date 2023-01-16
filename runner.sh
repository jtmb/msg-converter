# Cleans up old Image
docker image rm msg-converter:1.0

# Removes old Container
docker rm -f msg-converter

# Builds Image
docker build -t msg-converter:1.0 .

# Runs image and opens session as host
docker run --name msg-converter -p 80:80 -p 8080:8080 -t -i msg-converter:1.0