FROM nextcloud
# FROM_DIGEST sha256:3c78a8ec2504cc545e915b3a792b48b3d6292cf310ff6dbd6afac6f0d5e6f8e7

COPY wait-for-mysql.php /wait-for-mysql.php

COPY docker-entrypoint.sh /entrypoint.sh
