# Cleans up old Image
docker image rm msg-converter:1.0

# Removes old Container
docker rm -f msg-converter

# Builds Image
docker build -t msg-converter:1.0 .

# Runs image and opens session as host
docker run --name msg-converter -e --expose 3000 -p 80:80 -p 8080:8080 -v //c/Users/james/Desktop/dev-env:/root/dev-env -t -i dev-env:1.0``