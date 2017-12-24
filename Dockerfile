FROM nextcloud
# FROM_DIGEST sha256:ddca7a6a9f1b4657209feba1025b1ddf7cbac8b777c44ed6c4d8ff1944b76773

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
