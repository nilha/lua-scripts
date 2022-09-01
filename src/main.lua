local MailService         = require "mail.MailService"
local readConfig          = require "lib.readConfig"
local SendInBlueAPIClient = require "mail.SendInBlueAPIClient"


local function main(props)
  local configFileName = props["configFileName"]
  local config = readConfig(configFileName)
  local mailService = props["service"]
  mailService.mailClient = props["client"]
  local clientSettingsKey = props["clientSettingsKey"]
  mailService.mailClient.settings = config[clientSettingsKey]
  local mailPropertiesKey = props["mailPropertiesKey"]
  mailService.send(config[mailPropertiesKey])
end

main({
  service = MailService.new(),
  client = SendInBlueAPIClient.new(),
  configFileName = "config.ini",
  mailPropertiesKey = "mail",
  clientSettingsKey = "sendInBlue"
})
