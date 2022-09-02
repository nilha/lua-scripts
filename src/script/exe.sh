#!/usr/bin/env sh

function lua_src_path(){
    echo $(dirname "$PWD")
}

function lua_path(){
    echo "$1/?.lua;$1/?/?.lua;"
}

function export_variables(){
    export LUA_SRC_PATH="$(lua_src_path)"
    export LUA_PATH="$(lua_path $LUA_SRC_PATH)"
    eval $(luarocks path --bin)
}


export_variables
exec "$PWD/exe_lua.sh"
