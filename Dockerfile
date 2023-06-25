# Use the official PHP 8.0 image as the base image
FROM php:8.0

# Set working directory
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    curl

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copy composer.json and composer.lock
COPY composer.json composer.lock ./

# Install project dependencies
RUN composer install --prefer-dist --no-scripts --no-autoloader

# Copy existing application directory contents
COPY . ./

# Generate autoload files and optimize Composer autoloader
RUN composer dump-autoload --optimize

# Set write permissions for storage and bootstrap/cache
RUN chown -R www-data:www-data storage bootstrap/cache
RUN chmod -R 775 storage bootstrap/cache

# Expose port 80 and start PHP built-in server
EXPOSE 80
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=80"]
