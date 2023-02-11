ifneq (,$(wildcard ./.env))
    include .env
    export
endif

webpack: webpack-clear-assets clear-assets webpack-build webpack webpack-copy
deploy-local: pull config-local composer-install cache webpack
deploy-test: pull config-test composer-install cache webpack

local: config-local cache

composer-install:
	cd $(COMPOSER_DIR) && composer install

push:
	git add . && git commit -m "update" && git push

pull:
	git pull

cache:
	rm -rf $(ROOT_DIR)/bitrix/cache/
	rm -rf $(ROOT_DIR)/bitrix/managed_cache/
	rm -rf $(ROOT_DIR)/bitrix/stack_cache/

mysqldump:
	mysqldump -h $(DB_HOST) -u $(DB_USER) -p$(DB_PWD) $(DB_NAME) | gzip > $(DB_BACKUP_PATH)

webpack-build:
	cd $(MARKUP) && npm run build

webpack-clear-assets:
	rm -rf $(MARKUP)/build

clear-assets:
	rm -rf $(ASSETS)

webpack-copy:
	cp -R $(MARKUP)/build/js $(ASSETS)
	cp -R $(MARKUP)/build/assets/images $(ASSETS)
	cp -R $(MARKUP)/build/assets/fonts $(ASSETS)
	cp -R $(MARKUP)/build/css $(ASSETS)

env:
	cp .env.template .env

config-local:
	cp $(ROOT_DIR)/bitrix/.settings.local.php $(ROOT_DIR)/bitrix/.settings.php
	cp $(ROOT_DIR)/bitrix/php_interface/dbconn.local.php $(ROOT_DIR)/bitrix/php_interface/dbconn.php

config-test:
	cp $(ROOT_DIR)/bitrix/.settings.test.php $(ROOT_DIR)/bitrix/.settings.php
	cp $(ROOT_DIR)/bitrix/php_interface/dbconn.test.php $(ROOT_DIR)/bitrix/php_interface/dbconn.php
