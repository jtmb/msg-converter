FROM alpine:3.14

# set work directory (for file sharing between host and container)
WORKDIR /usr/share/nginx/html

# Dependencies 
RUN apk add py3-pip && \
    apk add jq && \
    apk add nginx && \
    pip install extract-msg

COPY /app /usr/share/nginx/html

RUN python -m extract_msg /usr/share/nginx/html/test.msg