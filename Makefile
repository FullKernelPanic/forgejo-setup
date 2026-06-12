ENV ?= local

build:
	docker compose --env-file=.env.$(ENV) build --no-cache --progress plain

run:
	docker compose --env-file=.env.$(ENV) up -d --remove-orphans

stop:
	docker compose -env-file=.env.$(ENV) down

cert-renew:
	docker compose run --rm --entrypoint "certbot renew" certbot