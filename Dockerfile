FROM nextcloud
# FROM_DIGEST sha256:9720f3e30491e013eab140b60d0a0b4e17da4c85cfdee167350fc677be9c811c

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
