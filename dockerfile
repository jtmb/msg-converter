FROM nginx

# set work directory (for file sharing between host and container)
WORKDIR /usr/share/nginx/html
RUN rm index.html
COPY /app/test.msg /usr/share/nginx/html/test.msg
COPY /app/index.html /usr/share/nginx/html/index.html

# Dependencies 
RUN apt update && apt install python3 -y && apt-get install python3-pip -y

# APP
RUN pip install extract-msg
RUN python3 -m extract_msg /usr/share/nginx/html/test.msg