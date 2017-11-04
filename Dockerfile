FROM nextcloud
# FROM_DIGEST sha256:dbd90ace16854a216df62f0cfa24a888a99a90dc2736f3804d8b1c9d48f44c3c

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
