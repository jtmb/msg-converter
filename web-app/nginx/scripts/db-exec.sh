#!/bin/sh

# VARS
    
    # declare database password variable         containerpath # /usr/local/bin/.env
    db_pwd=$(docker exec -it msg-converter-php-1 cat ~/repos/msg-converter/web-app/nginx/.env | rev | cut -d "=" -f1 | rev)

    #count number of lines in logs
    ln=$(docker exec -it msg-converter-php-1 wc -l /var/www/html/logs/logs.out | cut -d " " -f1)

    if [[$ln -gt 0]]; then
        wkln=1p
        name=$(docker exec -it msg-converter-php-1 sed -n $wkln /var/www/html/logs/logs.out | cut -d"|" -f1)
        date=$(docker exec -it msg-converter-php-1 sed -n $wkln /var/www/html/logs/logs.out | cut -d "|" -f3)
        ip=$(docker exec -it msg-converter-php-1 sed -n $wkln /var/www/html/logs/logs.out | cut -d "|" -f2)
    else

    echo "--------- debug --------------"
    echo $wkln
    echo $name
    echo $date
    echo $ip
    echo "----------------end debug--------------"





# cat log files
docker exec -it msg-converter-php-1 cat /var/www/html/logs/logs.out