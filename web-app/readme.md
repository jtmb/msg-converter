# What it does:

This installs a webserver and php server in docker containers and converts outlook .msg files to a readable HTML format or mac or linux (opens in browser or plain txt) using a friend web interface. (Standalone webserver with website)


# HOW TO RUN: (docker-compose required)

.runner.sh

OR

bash runner.sh

# IF USING NGINX Proxy Manger & Cloudflare
   If using this app behind a NGINX proxy manager and cloudflare then the bellow needs to go in "Custom Nginx Configuration" as well when editing the proxy host:

    proxy_set_header        X-Real-IP       $remote_addr;
    proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
    set_real_ip_from 103.21.244.0/22;
    set_real_ip_from 103.22.200.0/22;
    set_real_ip_from 103.31.4.0/22;
    set_real_ip_from 104.16.0.0/13;
    set_real_ip_from 104.24.0.0/14;
    set_real_ip_from 108.162.192.0/18;
    set_real_ip_from 131.0.72.0/22;
    set_real_ip_from 141.101.64.0/18;
    set_real_ip_from 162.158.0.0/15;
    set_real_ip_from 172.64.0.0/13;
    set_real_ip_from 173.245.48.0/20;
    set_real_ip_from 188.114.96.0/20;
    set_real_ip_from 190.93.240.0/20;
    set_real_ip_from 197.234.240.0/22;
    set_real_ip_from 198.41.128.0/17;
    set_real_ip_from 108.162.242.0/24;
    real_ip_header    X-Forwarded-For;
    real_ip_recursive on;