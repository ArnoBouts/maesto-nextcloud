FROM nextcloud
# FROM_DIGEST sha256:65873a6e1b9409bc4119c6a5fa7708f47a20a6be488f5947090068464dff2ef8

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
