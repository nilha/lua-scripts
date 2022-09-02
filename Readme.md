# mail client with lua

## idea

- send mail via sendinblue api (transactional mail)
- scripting with lua
- make executable and run in docker

## lesson

- how lua works
- creation of executable (static lua)

## install

- lua
  - `brew install lua`
- package manager
  - `brew install luarocks`
- lua modules
  - `make install`

## commands

- see@[Makefile](./Makefile)

- `make dev`
- `make lint`
- `make compile`
- `make docker`  (wip)

## docs

- [Manual](https://www.lua.org/manual/5.4/)
- [Luajit](https://de.quora.com/Was-ist-so-besonders-an-LuaJIT)
- [LUA Dotfiles](https://tewarid.github.io/2014/05/24/lua-dofile-and-globals.html)

## todos

- [x] how lua works
- [x] create mail client
- [x] make executable
- [ ] docker
- [ ] junit tests
- [ ] integration tests
- [ ] [grpc](https://github.com/jinq0123/grpc-lua/blob/master/examples/helloworld/greeter_client.lua) impl?
