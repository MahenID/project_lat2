#!/bin/bash
set -e

# Wait for PostgreSQL
DB_HOST=${DB_HOST:-postgres}
DB_PORT=${DB_PORT:-5432}

echo "Waiting for PostgreSQL ($DB_HOST:$DB_PORT)..."
while ! nc -z "$DB_HOST" "$DB_PORT"; do
  sleep 1
done
echo "PostgreSQL is up and running!"

# Wait for Redis
REDIS_HOST=${REDIS_HOST:-redis}
REDIS_PORT=${REDIS_PORT:-6379}

echo "Waiting for Redis ($REDIS_HOST:$REDIS_PORT)..."
while ! nc -z "$REDIS_HOST" "$REDIS_PORT"; do
  sleep 1
done
echo "Redis is up and running!"

# Copy .env if not exists
if [ ! -f .env ]; then
  echo "Copying .env.example to .env..."
  cp .env.example .env
fi

# Ensure storage directories exist and writable
mkdir -p storage/framework/cache/data storage/framework/sessions storage/framework/views storage/logs bootstrap/cache
chmod -R 777 storage bootstrap/cache

# Generate APP_KEY if empty
if ! grep -q "APP_KEY=base64:" .env; then
  echo "Generating application key..."
  php artisan key:generate --force
fi

# Run database migrations
echo "Running database migrations..."
php artisan migrate --force

echo "Backend startup checks completed."

exec "$@"
