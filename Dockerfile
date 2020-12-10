FROM digitonic1/php7.4:stable

ARG INSTANCE_IP
ARG PRIVATE_KEY

RUN composer require laravel/envoy

COPY . /app

RUN ln -s /app/vendor/laravel/envoy/bin/envoy /usr/local/bin/envoy

ENTRYPOINT ["/app/main.sh"]
