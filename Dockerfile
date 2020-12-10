FROM digitonic1/php7.4:stable

ARG INSTANCE_IP
ARG PRIVATE_KEY


COPY . /app

WORKDIR /app

RUN composer require laravel/envoy

RUN ln -s /app/vendor/laravel/envoy/bin/envoy /usr/local/bin/envoy

ENTRYPOINT ["/app/main.sh"]

CMD ["envoy", "run", "deploy", "--env=prod"]
