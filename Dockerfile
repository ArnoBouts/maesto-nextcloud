FROM nextcloud
# FROM_DIGEST sha256:9ae57808cc274f49f0cd230e6d7bd090de1325c21b4c1cf956529fa244a9e3a1

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
