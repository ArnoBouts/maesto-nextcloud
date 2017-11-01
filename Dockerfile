FROM nextcloud
# FROM_DIGEST sha256:abc6b296c6b4b5a77f3dc6ffd367801b71d5355ce667deb0a3817cec27615446

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
