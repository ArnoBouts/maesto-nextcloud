FROM nextcloud
# FROM_DIGEST sha256:c62d489ec489b529faad952c37de20289e2bf9e3c14c22130689fe58da4bac6d

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
