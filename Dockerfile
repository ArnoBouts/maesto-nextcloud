FROM nextcloud
# FROM_DIGEST sha256:95ef3760ff49a1051e452e89dfa3bd24af2ed3be8a50a5438cf7e9e1856bec2f

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
