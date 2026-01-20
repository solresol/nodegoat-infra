# NodeGoat Docker Image
# Based on 1100CC framework requirements
# https://github.com/LAB1100/1100CC and https://github.com/nodegoat/nodegoat

FROM php:8.2-apache

LABEL maintainer="NodeGoat Infrastructure"
LABEL description="NodeGoat - Web-based data management, network analysis & visualisation environment"

# Install system dependencies
RUN apt-get update && apt-get install -y \
    # Build tools
    build-essential \
    cmake \
    git \
    unzip \
    # Apache/PHP dependencies
    libapache2-mod-fcgid \
    # PHP extension dependencies
    libxml2-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libcurl4-openssl-dev \
    libonig-dev \
    libicu-dev \
    libyaml-dev \
    # Database clients
    default-mysql-client \
    postgresql-client \
    libpq-dev \
    # GDAL for ogr2ogr (required by NodeGoat)
    gdal-bin \
    libgdal-dev \
    # Boost for Network Analysis (optional but recommended)
    libboost-all-dev \
    # RapidJSON for C++ programs
    rapidjson-dev \
    # Mail support
    msmtp \
    msmtp-mta \
    && rm -rf /var/lib/apt/lists/*

# Configure and install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    xml \
    gd \
    mbstring \
    mysqli \
    pdo_mysql \
    pgsql \
    pdo_pgsql \
    curl \
    zip \
    intl \
    bcmath \
    opcache \
    pcntl

# Install YAML extension via PECL
RUN pecl install yaml && docker-php-ext-enable yaml

# Enable Apache modules
RUN a2enmod rewrite headers deflate proxy_fcgi ssl

# Create 1100CC directory structure
RUN mkdir -p /var/1100CC/APP/CORE \
    && mkdir -p /var/1100CC/APP/SITE \
    && mkdir -p /var/1100CC/APP/SETTINGS \
    && mkdir -p /var/1100CC/APP/STORAGE \
    && mkdir -p /var/1100CC/APP/CACHE \
    && mkdir -p /var/1100CC/SAFE \
    && mkdir -p /var/1100CC/PROGRAMS/LIBRARIES \
    && mkdir -p /var/1100CC/PROGRAMS/RUN

# Set permissions
RUN chown -R www-data:www-data /var/1100CC \
    && chmod -R 755 /var/1100CC \
    && chmod -R 775 /var/1100CC/APP/STORAGE \
    && chmod -R 775 /var/1100CC/APP/CACHE

# Copy Apache configuration
COPY apache/nodegoat.conf /etc/apache2/sites-available/nodegoat.conf

# Disable default site and enable nodegoat
RUN a2dissite 000-default && a2ensite nodegoat

# Copy PHP configuration
COPY php/php.ini /usr/local/etc/php/conf.d/nodegoat.ini

# Copy entrypoint script
COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set working directory
WORKDIR /var/1100CC

# Expose ports
EXPOSE 80 443

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["apache2-foreground"]
