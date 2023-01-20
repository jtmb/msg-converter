docker compose -f "./nginx/docker-compose.yml" up -d --build && \
sudo docker exec nginx-php-1 adduser root www-data && chown -R www-data:www-data /var/www && chmod -R g+rwX /var/www && \
sudo docker exec nginx-php-1 apk add py3-pip && pip install extract-msg