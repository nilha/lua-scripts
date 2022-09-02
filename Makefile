#!make
include .env
BUILD_FOLDER=dist
IN_FILE=main.lua
OUT_FILE=main.out
OUT_FILE2=main2.out
INCLUDE_FILES=$(shell cd src && ls -d **/*.{lua,ini} | tr "\n" " ")
LUA_INSTALL_PATH=$(shell brew --prefix lua)
export $(shell sed 's/=.*//' .env)
#export LUA_PATH=/opt/homebrew/bin/lua

.PHONY: clean dev all

all: clean app install

makedist:
	@mkdir -p ${BUILD_FOLDER}

exe:
	cd ./src && luastatic ${IN_FILE} ${INCLUDE_FILES} ${LUA_INSTALL_PATH}/lib/liblua.a -I${LUA_INSTALL_PATH}/include/lua

copy:
	cp -R src/ dist


compile: makedist
	@cd ./src && luac -s -o ${OUT_FILE} ${IN_FILE}

compile_with_luajit: makedist
	cd ./src && luajit -b ${IN_FILE} ../${BUILD_FOLDER}/${OUT_FILE2}
	make copy

install:
	luarocks install lua-curl
	luarocks install inifile
	luarocks install lunajson

lint:
	lua-format **/*.lua

clean:
	@rm -rf ./dist || true
	@rm -f ./src/main.luastatic.c || true
	@rm -f ./src/main.out || true
	@rm -f ./src/main || true

dev:
	@cd ./src && lua main.lua

docker:
	docker build -t lua-scripts . && docker run -t lua-scripts


test: clean compile
	@cd ./src/script && ./exe.sh
