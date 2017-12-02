FROM nextcloud
# FROM_DIGEST sha256:b16052d05383112e4225f29dbdddc4015f9e82a2290a5ce31e61e8cd1c87bb39

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
