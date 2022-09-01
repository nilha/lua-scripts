#!make
include .env
export $(shell sed 's/=.*//' .env)

.PHONY: clean dev all

all: clean app install

install:
	luarocks install lua-curl
	luarocks install inifile
	luarocks install lunajson

lint:
	lua-format **/*.lua

clean:
	echo "clean all dist files"

dev:
	@cd ./src && lua main.lua

docker:
	docker build -t lua-scripts . && docker run -t lua-scripts
