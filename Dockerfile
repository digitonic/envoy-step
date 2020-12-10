FROM digitonic1/php7.4:stable

ARG INSTANCE_IP
ARG PRIVATE_KEY

RUN composer require laravel/envoy

COPY /app/vendor/laravel/envoy/bin/envoy /usr/local/bin/envoy

COPY . /app

ENTRYPOINT ["/app/main.sh"]
