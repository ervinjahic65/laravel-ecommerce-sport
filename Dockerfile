# Use the official PHP image as the base image
FROM php:7.3-cli

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the composer.json and composer.lock files to the container
COPY composer.json composer.lock ./

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip

# Install PHP extensions
RUN docker-php-ext-install zip pdo_mysql

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install Composer dependencies
RUN composer install --no-scripts --no-autoloader --optimize-autoloader

# Copy the rest of the application code to the container
COPY . .

# Generate the autoloader
RUN composer dump-autoload --optimize --classmap-authoritative

# Expose port 8000 (adjust as needed)
EXPOSE 8000

# Run the application
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
