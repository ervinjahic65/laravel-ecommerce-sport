# Use the official PHP image as the base image
FROM php:8.0-cli

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the composer.json and composer.lock files to the container
COPY composer.json composer.lock ./

# Install PHP extensions and dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Composer dependencies
RUN composer install --no-scripts --no-autoloader

# Copy the rest of the application code to the container
COPY . ./

# Generate the autoloader
RUN composer dump-autoload --optimize

# Expose port 8000 (adjust as needed)
EXPOSE 8000

# Run the application
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
