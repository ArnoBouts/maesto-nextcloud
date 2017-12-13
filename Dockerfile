FROM nextcloud
# FROM_DIGEST sha256:7648377174f970557eb89ea2558440e33bf3ec9451a2ebe4767894364dbaeac1

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
