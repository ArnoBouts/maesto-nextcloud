FROM nextcloud
# FROM_DIGEST sha256:dcb172ff926242fc25636f2a142dba1486492465338ad3ea9a97f282a6896de9

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
