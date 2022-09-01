local http = {}

function http.post(url, apiKey, postData)
  local result = ""
  local command = "curl -s --request POST "
      .. url
      .. " --header accept: application/json"
      .. " --header api-key:" .. apiKey
      .. " --header content-type: application/json"
      .. " --data '" .. postData .. "'"
  local handle = io.popen(command)
  if handle ~= nil then
    result = handle:read("*a")
    handle:close()
  end
  return result
end

return http
