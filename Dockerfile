FROM nextcloud
# FROM_DIGEST sha256:b7284bcdd2dbcb2a43aa1bc1cfc43cec055ff1237ec6845b6c7a04189bee5e60

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
