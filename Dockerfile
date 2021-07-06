FROM digitonic1/php8.0:latest

COPY . /app

WORKDIR /app

RUN composer require laravel/envoy

RUN ln -s /app/vendor/laravel/envoy/bin/envoy /usr/local/bin/envoy

RUN rm -rf ~/.composer/

RUN composer require deployer/deployer

RUN ln -s /app/vendor/laravel/deployer/bin/dep /usr/local/bin/dep

RUN chmod +x /app/main.sh

ENTRYPOINT ["/app/main.sh"]
