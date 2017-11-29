FROM nextcloud
# FROM_DIGEST sha256:7ead4dc8e8a2d9966d74ae42685a905f5afbbfe794a2f77430d63c0693e0410e

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
