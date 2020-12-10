FROM digitonic1/php7.4:stable

COPY . /app

WORKDIR /app

RUN composer require laravel/envoy

RUN ln -s /app/vendor/laravel/envoy/bin/envoy /usr/local/bin/envoy

RUN chmod +x /app/main.sh

ENTRYPOINT ["/app/main.sh"]

CMD ["envoy", "run", "deploy", "--env=prod"]
