FROM nextcloud
# FROM_DIGEST sha256:f8a5dd2eb31f8bfa2811073494ca3e7519f5938a7a81a81193c227e6695c4e50

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
