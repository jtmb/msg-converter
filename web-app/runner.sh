docker compose -f "app/nginx/docker-compose.yml" up -d --build

docker cp php-1 /frontend/upload.php /var/www/html/upload.php