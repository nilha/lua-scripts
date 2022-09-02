local inifile = require('inifile')

local function resolvePath(dir, fileName)
  return dir .. "/" .. fileName
end

local function readConfig(fileName, dir)
  dir = dir or os.getenv("LUA_SRC_PATH") or os.getenv("PWD")
  local filePath = resolvePath(dir, fileName);
  local params = inifile.parse(filePath)
  return params
end

return readConfig
