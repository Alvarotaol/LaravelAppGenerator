FROM php:8.4-fpm

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
	unzip curl git zip libzip-dev \
	&& docker-php-ext-install zip

# Instala o Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Cria o usuário laravel com UID 1000
RUN useradd -u 1000 -ms /bin/bash laravel

USER laravel
WORKDIR /home/laravel