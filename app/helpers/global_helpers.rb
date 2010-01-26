module Merb
  module GlobalHelpers
    def flash_message
      unless message.empty?
        message_type = message.keys.first
        message_text = h(message[message_type])
        partial("shared/flash", {:message_type => message_type, :message_text => message_text})
      end
    end
  end
end
