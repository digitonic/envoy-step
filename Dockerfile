FROM digitonic1/php7.4-php:stable

ARG INSTANCE_IP
ARG PRIVATE_KEY

COPY . .

RUN composer global require laravel/envoy

RUN ln -s envoy /usr/local/bin/envoy

ENTRYPOINT ["main.sh"]
