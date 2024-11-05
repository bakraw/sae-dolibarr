# Utiliser une image de base Debian
FROM debian:bullseye

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y \
    mariadb-server \
    php \
    php-mysql \
    apache2 \
    libapache2-mod-php \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configurer MariaDB
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=dolibarr
ENV MYSQL_USER=dolibarr_user
ENV MYSQL_PASSWORD=dolibarr_password

# Copier le script d'initialisation de la base de données
COPY ./data.csv /docker-entrypoint-initdb.d/data.csv

# Installer Dolibarr
RUN git clone https://github.com/Dolibarr/dolibarr.git /var/www/html/dolibarr && \
    chown -R www-data:www-data /var/www/html/dolibarr

# Exposer les ports
EXPOSE 3306 8080

# Commande pour démarrer les services
CMD service mysql start && \
    service apache2 start && \
    tail -f /dev/null
