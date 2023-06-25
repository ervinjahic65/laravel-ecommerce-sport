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

# Create a new user and switch to it
RUN useradd -ms /bin/bash dockeruser
USER dockeruser

# Install Composer
COPY --from=composer:2 /usr/bin/composer /home/dockeruser/.composer/vendor/bin/composer

# Set composer bin directory in the PATH
ENV PATH="/home/dockeruser/.composer/vendor/bin:${PATH}"

# Copy composer.json and composer.lock
COPY composer.json composer.lock ./

# Install project dependencies
RUN composer install --prefer-dist --no-scripts --no-autoloader

# Copy existing application directory contents
COPY . .

# Generate autoload files
RUN composer dump-autoload --optimize

# Copy Helper.php to the correct location
RUN cp ./app/Helpers/Helper.php /var/www/html/vendor/composer/../../../App/Helpers/Helper.php

# Set write permissions for storage and bootstrap/cache
USER root
RUN chown -R www-data:www-data storage bootstrap/cache
RUN chmod -R 775 storage bootstrap/cache

# Switch back to the non-root user
USER dockeruser

# Expose port 80 and start PHP built-in server
EXPOSE 80
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=80"]
