FROM nextcloud
# FROM_DIGEST sha256:5b3259052d851dac2b2d3ea0a104999a9fd392cf0c05dfaeaa5c600aefd8896e

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
