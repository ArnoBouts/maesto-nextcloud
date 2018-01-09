FROM nextcloud
# FROM_DIGEST sha256:fbc767350200a5e0f5a5ee0a804c2c332f3ebc27a5d37ae2cf81bddd7249cc04

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
