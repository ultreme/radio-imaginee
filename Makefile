-include config.mk

ADMIN_PASSWORD	?=	secure
HARBOR_PASSWORD	?=	secure
SOURCE_PASSWORD	?=	secure
RELAY_PASSWORD  ?=	secure
MYSQL_PASSWORD  ?=	secure
PIWIK_PASSWORD  ?=	secure

ENV ?=			HARBOR_PASSWORD=$(HARBOR_PASSWORD) \
			LIVE_PASSWORD=$(HARBOR_PASSWORD) \
			ICECAST_SOURCE_PASSWORD=$(SOURCE_PASSWORD) \
			ICECAST_ADMIN_PASSWORD=$(ADMIN_PASSWORD) \
			ICECAST_PASSWORD=$(ADMIN_PASSWORD) \
			ICECAST_RELAY_PASSWORD=$(RELAY_PASSWORD) \

.PHONY: all
all: up logs

.PHONY: re-main
re-main: up
	$(ENV) docker-compose up -d --no-deps --force-recreate main

.PHONY: up
up:
	$(ENV) docker-compose up -d --no-recreate

.PHONY: logs
logs:
	$(ENV) docker-compose logs --tail=100 -f
