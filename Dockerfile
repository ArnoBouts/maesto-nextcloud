FROM nextcloud
# FROM_DIGEST sha256:daa116324e1b974d713851c8aa817933d259c484815b7857d8c9c412c2aa4595

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
