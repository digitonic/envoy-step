FROM digitonic/php8.0:latest

COPY . /app

WORKDIR /app

RUN composer require laravel/envoy

RUN ln -s /app/vendor/laravel/envoy/bin/envoy /usr/local/bin/envoy

RUN chmod +x /app/main.sh

ENTRYPOINT ["/app/main.sh"]
