# Usar la imagen oficial de PHP con Apache
FROM php:8.1-apache

# Instalar dependencias del sistema necesarias
RUN apt-get update && apt-get install -y \
    libzip-dev unzip git curl \
    && docker-php-ext-install zip pdo pdo_mysql

# Instalar Composer manualmente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configurar la carpeta de trabajo
WORKDIR /var/www/html

# Copiar el código fuente (src será la carpeta del proyecto Symfony)
COPY ./src /var/www/html

# Exponer el puerto 80 para la aplicación
EXPOSE 80


