local JSON = require 'lunajson'
local http = require 'lib.http'

local SendInBlueApiClient = {}

function SendInBlueApiClient.new()
  local self = { settings = {} }

  function self.send(params)
    local url = self.settings["apiUrl"] or ""
    local apiKey = os.getenv("SEND_IN_BLUE_API_TOKEN") or ""
    local postData = JSON.encode(params)
    local request = http.post(url, apiKey, postData)
    return request
  end

  return self;
end

return SendInBlueApiClient
