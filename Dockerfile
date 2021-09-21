FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y freeradius freeradius-mysql freeradius-postgresql freeradius-dhcp \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/* \
    && ln -s /etc/freeradius /etc/raddb

COPY docker-entrypoint.sh /

RUN chmod +x docker-entrypoint.sh

EXPOSE 1812/udp 1813/udp
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["freeradius"]