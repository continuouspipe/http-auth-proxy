FROM nginx

RUN apt-get update && \
    apt-get install -y apache2-utils wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    wget https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 -O /usr/bin/confd && \
    chmod +x /usr/bin/confd
 
COPY ./etc/ /etc/
COPY start.sh /start.sh

CMD ["/start.sh"]
