FROM nextcloud
# FROM_DIGEST sha256:d4d83d66bca8fa2f1e83a750d4e1ebc47eba4e44026369d7b20ffaa17f932aa2

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
