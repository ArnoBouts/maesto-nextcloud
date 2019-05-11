FROM nextcloud
# FROM_DIGEST sha256:1aa8dd4b755a3e3aeb93300b336cc8e40dcd37a75c4c3e12ffdce7778b3f1fcf

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
