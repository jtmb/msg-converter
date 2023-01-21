sudo docker compose -f "./nginx/docker-compose.yml" up -d --build
# sudo docker exec nginx-php-1 adduser root www-data && chown -R www-data:www-data /var/www && chmod -R g+rwX /var/www && \
# sudo docker exec nginx-php-1 apk add py3-pip && pip install extract-msg

adduser root /home/james/container-program-files/msg-converter/web-app/nginx/frontend && chmod -R g+rwX /home/james/container-program-files/msg-converter/web-app/nginx/frontend