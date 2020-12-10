FROM digitonic1/php7.4-nginx:stable

ARG INSTANCE_IP
ARG PRIVATE_KEY

COPY . .

RUN composer global require laravel/envoy

ENTRYPOINT ["main.sh"]
