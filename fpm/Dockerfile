FROM cgr.dev/chainguard/wolfi-base

ARG PHP_VERSION=8.3

RUN apk add --no-cache \
    jq \
    php-${PHP_VERSION} \
    php-${PHP_VERSION}-fpm \
    php-${PHP_VERSION}-bz2 \
    php-${PHP_VERSION}-curl \
    php-${PHP_VERSION}-gd \
    php-${PHP_VERSION}-gmp \
    php-${PHP_VERSION}-mysqlnd \
    php-${PHP_VERSION}-openssl \
    php-${PHP_VERSION}-pdo_mysql \
    php-${PHP_VERSION}-sodium \
    php-${PHP_VERSION}-exif \
    php-${PHP_VERSION}-intl \
    php-${PHP_VERSION}-mbstring \
    php-${PHP_VERSION}-opcache \
    php-${PHP_VERSION}-pcntl \
    php-${PHP_VERSION}-pdo \
    php-${PHP_VERSION}-phar \
    php-${PHP_VERSION}-sockets \
    php-${PHP_VERSION}-bcmath \
    php-${PHP_VERSION}-ctype \
    php-${PHP_VERSION}-iconv \
    php-${PHP_VERSION}-dom \
    php-${PHP_VERSION}-posix \
    php-${PHP_VERSION}-simplexml \
    php-${PHP_VERSION}-xml \
    php-${PHP_VERSION}-xmlreader \
    php-${PHP_VERSION}-xmlwriter \
    php-${PHP_VERSION}-fileinfo \
    php-${PHP_VERSION}-zip \
    php-${PHP_VERSION}-redis \
    php-${PHP_VERSION}-amqp && \
    adduser -u 82 www-data -D

ENV APP_ENV=prod \
    APP_URL_CHECK_DISABLED=1 \
    LOCK_DSN=flock \
    MAILER_DSN=null://localhost \
    DATABASE_PORT=3306 \
    OPENSEARCH_URL= \
    BLUE_GREEN_DEPLOYMENT=0 \
    SHOPWARE_ES_ENABLED=0 \
    SHOPWARE_ES_INDEXING_ENABLED=0 \
    SHOPWARE_ES_INDEX_PREFIX= \
    SHOPWARE_HTTP_CACHE_ENABLED=1 \
    SHOPWARE_HTTP_DEFAULT_TTL=7200 \
    SHOPWARE_CACHE_ID=docker \
    SHOPWARE_SKIP_WEBINSTALLER=1 \
    COMPOSER_PLUGIN_LOADER=1 \
    COMPOSER_HOME=/tmp/composer \
    INSTALL_LOCALE=en-GB \
    INSTALL_CURRENCY=EUR \
    INSTALL_ADMIN_USERNAME=admin \
    INSTALL_ADMIN_PASSWORD=shopware \
    FPM_LISTEN=9000 \
    FPM_PM=dynamic \
    FPM_PM_MAX_CHILDREN=5 \
    FPM_PM_START_SERVERS=2 \
    FPM_PM_MIN_SPARE_SERVERS=1 \
    FPM_PM_MAX_SPARE_SERVERS=3 \
    FPM_PM_MAX_REQUESTS=0 \
    FPM_PM_STATUS_PATH=/-/fpm/status \
    FPM_PING_PATH=/-/fpm/ping \
    PHP_SESSION_HANDLER=files \
    PHP_SESSION_SAVE_PATH= \
    PHP_MAX_UPLOAD_SIZE=128m \
    PHP_MAX_EXECUTION_TIME=300 \
    PHP_MEMORY_LIMIT=512m \
    PHP_DISPLAY_ERRORS=Off \
    PHP_ERROR_REPORTING=E_ALL \
    PHP_OPCACHE_VALIDATE_TIMESTAMPS=0 \
    PHP_OPCACHE_INTERNED_STRINGS_BUFFER=20 \
    PHP_OPCACHE_MAX_ACCELERATED_FILES=10000 \
    PHP_OPCACHE_MEMORY_CONSUMPTION=128 \
    PHP_OPCACHE_FILE_CACHE= \
    PHP_OPCACHE_FILE_CACHE_ONLY=0 \
    PHP_REALPATH_CACHE_SIZE=4096K \
    PHP_REALPATH_CACHE_TTL=3600 \
    MYSQL_WAIT_SECONDS=20

COPY --link rootfs /

WORKDIR /var/www/html
USER www-data

ENTRYPOINT [ "/usr/sbin/php-fpm" ]