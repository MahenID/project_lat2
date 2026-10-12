FROM php:8.3-cli-alpine

# Install extension installer
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions \
        pdo_pgsql \
        pgsql \
        redis \
        gd \
        intl \
        zip \
        bcmath \
        exif \
        pcntl

# Install system dependencies
RUN apk add --no-cache bash netcat-openbsd postgresql-client

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copy application files
COPY . .

# Permissions
RUN chmod +x docker-entrypoint.sh && \
    mkdir -p storage bootstrap/cache && \
    chmod -R 777 storage bootstrap/cache

EXPOSE 8000

ENTRYPOINT ["/var/www/html/docker-entrypoint.sh"]
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
