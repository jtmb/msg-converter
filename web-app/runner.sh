# var to generate random string and set as db_pwd
db_pwd=`(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')`
sudo echo "DB_PWD=$db_pwd" > nginx/.env
mkdir ~/tmp/ && sudo echo -e "DB_PWD=$db_pwd" > ~/tmp/.env
sudo mv ~/tmp/.env ~/container-program-files/msg-converter/web-app/nginx/.env

# Build docker compose stack and set entry point script
sudo docker compose --env-file nginx/.env -p "msg-converter" -f "./nginx/docker-compose.yml" up -d --build
sudo docker exec msg-converter-php-1 sh /usr/local/bin/entrypoint

# Show random generated db_pwd at the end of build
echo
echo "-----------------------"
echo db login info: 
echo "user; root"
echo "pwd; $db_pwd"
echo "-----------------------"