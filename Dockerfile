FROM nextcloud
# FROM_DIGEST sha256:1

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
