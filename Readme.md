# PoC lua

## idea

- send mail via sendinblue api (transactional mail)

## knowledge

- how lua works
- creation of executable (static lua)

## install

- lua
  - `brew install lua`
- luajt
  - `brew cleanup luajit`
- package manager
  - `brew install luarocks`
- formatter
  - `luarocks install --server=https://luarocks.org/dev luaformatter`
- exe creator
  - luarocks install [luastatic](https://github.com/ers35/luastatic)

## commands

- see@[Makefile](./Makefile)

- `make dev`
- `make lint`
- `make compile`
- `make docker`  (wip)

## docs

- [Luajit](https://de.quora.com/Was-ist-so-besonders-an-LuaJIT)
