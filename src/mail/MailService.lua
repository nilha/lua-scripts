local MailService = { }

function MailService.new()
  local self = {}
  self.mailClient = nil
  function self.send(params)
    if self.mailClient ~= nil then
      print("start mail transport = ")
      local response = self.mailClient.send(params);
      print("end mail transport - response: "..response)
    else
      print("mail send failed - please add a mailClient")
    end
  end
  return self;
end

return MailService
