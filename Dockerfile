FROM digitonic1/php7.4-nginx:stable

ARG INSTANCE_IP
ARG PRIVATE_KEY

COPY . .

RUN composer require laravel/envoy -g

ENTRYPOINT ["main.sh"]
CMD cd codefresh/volume/cricketnews && php /vendor/laravel/envoy/bin/envoy run deploy --env=prod --branch=feature/add-envoy]
