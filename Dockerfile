FROM wordpress:latest

RUN apt-get update && apt-get install -y \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    wget \
    build-essential \
    git \
    && git clone https://github.com/phpredis/phpredis.git /tmp/phpredis \
    && cd /tmp/phpredis \
    && git checkout 5.3.7 \
    && phpize \
    && ./configure --with-php-config=/usr/local/bin/php-config \
    && make \
    && make install \
    && rm -rf /tmp/phpredis \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-enable redis
