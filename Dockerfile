FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y software-properties-common wget curl git zip nano vim netcat supervisor cron rsyslog apache2 php php-cli libapache2-mod-php php-mysql php-dom php-simplexml php-curl php-intl php-xsl php-mbstring php-zip php-xml php-xmlrpc composer php-gd php-redis mysql-client && a2enmod rewrite remoteip headers;

RUN apt-get install -y wget && wget -q 'https://getcomposer.org/installer' -O - | php; \
    mv composer.phar /usr/local/bin/composer;

RUN mkdir /var/sync

ADD vhost /etc/apache2/sites-enabled/000-default.conf
ADD httpd-foreground /bin/httpd-foreground

EXPOSE 80

CMD ["httpd-foreground"]
