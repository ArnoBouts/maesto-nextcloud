FROM nextcloud
# FROM_DIGEST sha256:2d808cde2661ef53142e22c5e6087fea27fce450ebb38a9625b854e723ef2a98

RUN apt-get update && apt-get install -y \
  supervisor \
  cron \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/log/supervisord /var/run/supervisord && \ 
  echo "*/15 * * * * su - www-data -s /bin/bash -c \"php -f /var/www/html/cron.php\""| crontab -

COPY supervisord.conf /etc/supervisor/supervisord.conf

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/bin/supervisord"]
