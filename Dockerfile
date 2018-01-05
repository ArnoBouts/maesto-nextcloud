FROM nextcloud
# FROM_DIGEST sha256:04147d1dab2c6cb1383e7a9dd03b62ac326459828aa4fcc11119430c175b9bc0

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
