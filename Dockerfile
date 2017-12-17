FROM nextcloud
# FROM_DIGEST sha256:762984454f23ba5e60dcf2013b1f341f3f2a1668e06a448f87e95acf0e45bfa1

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
