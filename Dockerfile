FROM nextcloud
# FROM_DIGEST sha256:b110da4fb31ef72062a32de606b611792857a0898a9fc8dda35612a775aaf266

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
