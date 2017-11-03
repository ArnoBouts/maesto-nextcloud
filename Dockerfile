FROM nextcloud
# FROM_DIGEST sha256:794625a1f9041efd9db9a102ebd733435e5ac31ddf9ab6ac08fb949fb6cfa40a

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
