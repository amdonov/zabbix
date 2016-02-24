FROM alpine:3.3
RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && apk --update add zabbix-pgsql@edge gettext \
         && rm -Rf /var/cache/apk/* 
COPY root /
# allow to run as any user
RUN  chmod 777 /var/log/zabbix /var/run/zabbix && chmod 666 /etc/zabbix/zabbix_server.conf
EXPOSE 10051
CMD zabbix
