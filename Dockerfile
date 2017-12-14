FROM nextcloud
# FROM_DIGEST sha256:123f34e0e36ef658df8e18215252f6c7d58815555019545130cbe308ef85dba7

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
