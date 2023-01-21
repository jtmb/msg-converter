sudo docker compose -f "./nginx/docker-compose.yml" up -d --build
sudo docker exec nginx-php-1 sh /usr/local/bin/entrypoint