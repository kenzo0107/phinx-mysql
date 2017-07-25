FROM composer/composer:1.1
MAINTAINER Kenzo Tanaka <kenzo0107>

# DB 接続実行の為、 pdo_mysql
RUN docker-php-ext-install pdo_mysql

RUN composer global require 'robmorgan/phinx:0.8.1'
RUN composer global require 'fzaninotto/faker:v1.6.0'

ENTRYPOINT ["phinx"]
CMD ["--help"]
